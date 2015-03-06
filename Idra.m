function [ output_args ] = Idra( input_args )
%IDRA Summary of this function goes here
%   Detailed explanation goes here


%   variabili:
%   x: vettore colonna (dimensione=#cluster)
%   x_dmp: vettore colonna (dimensione=NUM_PRIMITIVE)
%   pi_f: vettore colonna (dimensione=DOF)
%   teta_metap: matrice dove ogni colonna rappresenta i 
%   parametri delle basis functions per approssimare la value function 
%   v(metaparametri). Numero di righe =NUM_BASIS_FUNCTION, colonne = 
%   NUM_PRIMITIVE.
%   meta_param: matrice dove ogni colonna rappresenta i metaparametri della
%   dmp, in questo caso immagino siano i goal di ogni DOF. 
%   Numero di righe =DOF, colonne=NUM_PRIMITIVE.
%   pi_pesi: vettore colonna (dimensione=NUM_PRIMITIVE) dei pesi delle
%   primitive per l'azione corrente.
% 
% 
% 
% 
% 
% 
% 
% 

global MOTION
global PICTURE
global NAMES
global DURATA
global NUM_PRIMITIVE
global DOF
global NUM_BASIS_METAP
global MU_METAP
global SIGMA_METAP
global MU_ACTOR
global SIGMA_ACTOR 

%   Inizializzazioni
IP='127.0.0.1';
MOTION=ALProxy('ALMotion', IP, 9559);
PICTURE=ALProxy('ALPhotoCaptureProxy',IP,9559);
NAMES=['dof1', 'dof2', 'dof3', 'dof4'];
DURATA = 3; %imposto durata di ogni dmp 3s standard.
SIGMA_ACTOR=1*ones(1,NUM_PRIMITIVE);
soglia=0.2; %renderla variabile
%   Estremi dell'intervallo dei metaparametri, ad esempio per il goal di 2 
%   DoF.
a=[0 0];
b=[90 90];
%   Calcolo i centri, le varianze e il numero di basis function per la
%   value function dell'algoritmo che apprende i metaparametri. Le
%   gaussiane vengono poste su una griglia nello spazio dei metaparametri.
[MU_METAP,SIGMA_METAP,NUM_BASIS_METAP]=basis_metap(a,b);
%   Inizializzo il vettore parametri della value function che valuta i 
%   metaparametri e alloco lo spazio per la matrice dei metaparametri.
teta_metap=zeros(NUM_BASIS_METAP,NUM_PRIMITIVE);
meta_param=zeros(DOF,NUM_PRIMITIVE);
for i=1:NUM_PRIMITIVE
    meta_param(:,i)=get_goal(i); %Vedere come è possibile prendere i metaparametri 
%   aka goals delle varie primitive
end
%    Inizializzo altri matrici utili
dmp_attive=zeros(NUM_PRIMITIVE,1);
nuove_dmp_attive=zeros(NUM_PRIMITIVE,1);
temp=zeros(NUM_PRIMITIVE,1);
%   Inizializzo matrici di parametri per le policy pi_pesi, per le funzioni
%   Q stato-azione delle policy e matrice delle eligilibity traces.
w = zeros(NUM_PRIMITIVE);
t = zeros(NUM_PRIMITIVE);
z = zeros(NUM_PRIMITIVE);


%   Chiama Idra che analizza l'input visivo del nao. Restituisce la 
%   distanza dell'input corrente dai centri dei cluster presenti in idra.
x_nao=get_vision_nao();
x=archi_idra(x_nao);

%   Sceglie i pesi delle primitive della prima azione. I pesi ammissibili 
%   sono compresi nell'intervallo [0,1].
%   Inizialmente viene eseguita solo una primitiva, quella più consona allo
%   stato x osservato.
pi_pesi=zeros(NUM_PRIMITIVE,1);
dist=zeros(NUM_PRIMITIVE,1);
for i=1:NUM_PRIMITIVE
   dist(i,1)=(sum((x'-MU_ACTOR(i,:))^2))^(1/2);
end
[elemento,posizione]=min(dist);
pi_pesi(posizione)=1;

%   Inizia l'apprendimento fino a convergenza
while true
    
    %   Calcolo quali dmp sono attive e quali si sono attivate ora
    for i=1:NUM_PRIMITIVE
        if(pi_pesi(i)>=soglia)
            temp(i)=1;
            if(dmp_attive(i)==1)
                nuove_dmp_attive(i)=0;
            else nuove_dmp_attive(i)=1;
            end
        else
            temp(i)=0;
            nuove_dmp_attive(i)=0;
        end
    end
    dmp_attive=temp;
    
%   Calcolo i metaparametri nel caso di nuove dmp attive
    if(sum(nuove_dmp_attive)>0)
        for i=1:NUM_PRIMITIVE
            if(nuove_dmp_attive(i)>0)
                meta_param(:,i)=get_goal(i);
            end
        end
    end
    
%   Calcolo la combinazione di primitive.
    pi_f=zeros(DOF,1);
    for i=1:NUM_PRIMITIVE
        if(pi_pesi(i)>=soglia)
            pi_f = pi_f + pi_pesi(i)*pi_base(i,delta_t,meta_param(:,i));
        end
    end    
    
%   Eseguo l'azione, Interfacciarsi con Nao
    esegui_nao(pi_f,delta_t);

%   Chiama Idra che analizza l'input visivo del nao. Restituisce la 
%   distanza dell'input corrente dai centri dei cluster presenti in idra.
    y_nao=get_vision_nao();
    y=archi_idra(y_nao);
    
%   Ricevo/Calcolo il reward
    r=reward(y);
    
%   Esegue una iterazione dell'algoritmo di apprendimento dei
%   metaparametri.
    for i=1:NUM_PRIMITIVE
        if(pi_pesi(i)>=soglia)
            [teta_metap(:,i),meta_param(:,i)]=metap_learning(meta_param(:,i),1.5,r,teta_metap(:,i));
        end
    end
    
%   Esegue una iterazione dell'algoritmo di combinazione di primitive. Su
%   idra abbiamo solo 1 modulo, per odin iteriamo questa chiamata per ogni
%   modulo gangli.
    [w,t,pi_pesi,z]=modulo_gangli(x,y,r,w,t,pi_pesi,z);

%   Aggiorno lo stato corrente
    x=y;


end



end

