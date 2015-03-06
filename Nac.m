function [ w,t,a1,z ] = Nac( w,t,a,z,x,y,r )
%NAC Algoritmo Natural Actor-Critic, restituisce il vettore dei pesi della
%policy. Ogni chiamata a questa funzione è una iterazione dell'algoritmo.
%   Critico: Sarsa(1)
%   Attore: Policy gaussiana
%   
%   Variabili
%   w: vettore colonna dei parametri della policy
%   t: vettore colonna dei parametri della Action-Value function
%   z: vettore colonna delle eligibility traces della Action-Value function
%   a: azione risultante dalla policy
%   r: reward ricevuto
%   y: vettore colonna dello stato dopo l'esecuzione di a. Rappresentato da vettore
%   delle distanza dai centri dei cluster.
%   x: vettore colonna dello stato presente
%   b: learning rate della policy. Deve essere più piccolo di quello del
%   critico.

%   Inizializzazioni eseguite nel chiamante alla prima iterazione
%   w=0; t=0; z=0;

%   Inizializzazioni
b=0.5; %trovare un valore corretto, vedi sopra.
SIGMA = 1;  %trovare un valore corretto.

%   Esegue l'azione e riceve il reward e lo stato successivo
%   [r, y] = EseguiAzione(a)

%   Sceglie azione a1 dalla policy. Le azioni ammissibili sono comprese
%   nell'intervallo [0,1].
id=1;
while id==1
    a1 = mvnrnd(w'*basis_actor(y),SIGMA);
    if(a1>=0 && a1<=1)
        id=0;
    end
end
    
%   Valuto la policy corrente aggiornando la Action-value function
[t,z] = sarsa_critic(x,a,r,y,a1,t,z,w);

%   Aggiorno i pesi della policy con la regola del Nac
w = w + b*t;

%   Aggiorno lo stato corrente e la prossima azione da eseguire
%   x=y; lo faccio nel modulo esterno gangli.
%   a=a1;




end

