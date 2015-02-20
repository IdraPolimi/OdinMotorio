function [ w,t,a1,z ] = Nac( w,t,a,z,x,y,r )
%NAC Algoritmo Natural Actor-Critic, restituisce il vettore dei pesi della
%policy. Ogni chiamata a questa funzione è una iterazione dell'algoritmo.
%   Critico: Sarsa(1)
%   Attore: Policy gaussiana
%   
%   Variabili
%   w: vettore colonna dei parametri della policy
%   t: vettore colonna dei parametri della Action-Value function
%   z: vettore delle eligibility traces della Action-Value function
%   a: azione risultante dalla policy
%   r: reward ricevuto
%   y: vettore dello stato dopo l'esecuzione di a. Rappresentato da vettore
%   delle distanza dai centri dei cluster.
%   x: vettore dello stato presente
%   b: learning rate della policy. Deve essere più piccolo di quello del
%   critico.

%   Inizializzazioni eseguite nel chiamante alla prima iterazione
%   w=0; t=0; z=0;

%   Inizializzazioni
b=0.5; %trovare un valore corretto, vedi sopra.
%   SIGMA = ;  Direi di inizializzarlo a beta*I matrice costante.

%   Esegue l'azione e riceve il reward e lo stato successivo
%   [r, y] = EseguiAzione(a)

%   Sceglie azione a1 dalla policy. Le azioni ammissibili sono comprese
%   nell'intervallo [0,1], aggiungere questo controllo.
a1 = mvnrnd(w'*basis_actor(y),SIGMA);

%   Valuto la policy corrente aggiornando la Action-value function
[t,z] = sarsa_critic(x,a,r,y,a1,t,z);

%   Aggiorno i pesi della policy con la regola del Nac
w = w + b*t;

%   Aggiorno lo stato corrente e la prossima azione da eseguire
%   x=y; lo faccio nel modulo esterno gangli.
a=a1;




end

