function [ t,z ] = sarsa_critic( x,a,r,y,a1,t,z )
%SARSACRITIC Algoritmo Sarsa(1) che valuta la policy corrente aggiornando i
%parametri della propria Action-Value function.

%   Variabili:
%   x: vettore dello stato da valutare
%   a: azione da valutare
%   r: reward immediato ricevuto
%   y: vettore dello stato dopo l'esecuzione di a. Rappresentato da vettore
%   delle distanza dai centri dei cluster.
%   a1: azione scelta dalla policy nello stato y. 
%   t: vettore colonna dei parametri della Action-Value function
%   z: vettore colonna delle eligibility traces della Action-Value function
%   alpha: learning rate della policy. Deve essere più piccolo di quello del
%   critico.
%   d: errore td
%   g: discount rate
%   l: lambda trace-decay

%   Inizializzazioni da effettuare la prima volta che chiamo questo modulo
%   z=0;
%
%
%

%   Inizializzazioni
g=0.9; % Valuto la policy quindi sono nell'area dei gangli con discount alto.
%   g=0;  Valuto il goal quindi sono nell'area dei gangli con discount basso.
l=1; % Implemento Td(1), comportamente stile MonteCarlo. 
alpha=0.2; %trovare un parametro giusto. 

%   Calcolo l'errore td
phi = basis_critic(x,a);
d = r + g*(t'*basis_critic(y,a1)) - t'*phi;
%   Calcolo la eligibility trace
z = phi + g*l*z;
%   Calcolo i parametri aggiornati della Action-Value function
t = t + alpha*d*z;



end

