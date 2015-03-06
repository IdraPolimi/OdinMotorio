function [ w,t,pi_pesi,z ] = modulo_gangli( x,y,r,w,t,pi_pesi,z )
%MODULO_GANGLI Modulo che rappresenta i gangli alla base.
%   Dato uno stato x apprende per rinforzo l'azione migliore da compiere.
%   L'azione è una combinazione di primitive motorie e l'algoritmo si 
%   occupa di imparare i pesi delle primitive che rappresentano la gating
%   network di una "mixture" di esperti (le primitive).
%   L'algoritmo di RL è Natural actor-critic con Sarsa(1) modificato per
%   questo modello del sistema.

%   Variabili
%   x: vettore distanza dai cluster. Immagino che sia colonna, dipende
%   dall'architettura Odin-Idra
%   pi_f: vettore di dimensioni DoFx3 della policy finale a seguito della
%   combinazione delle primitive motorie.
%   pi_pesi: vettore colonna dei pesi corrispondenti alle primitive. I pesi
%   appartengono a [0,1] e sono le azioni delle policy apprese con Nac.
%   pi_base: matrice DoFx3 dove ogni elemento è un vettore della
%   evoluzione nel tempo della grandezza posizione, velocità o
%   accelerazione dei giunti.
%   r: reward immediato.
%   w: vettore nxm dei parametri delle policy pi_pesi. n ed m sono
%   NUM_PRIMITIVE.
%   t: matrice nxm dei parametri della Action-Value function corrispondenti
%   alla pi_pesi. n ed m sono NUM_PRIMITIVE.
%   z: matrice nxm delle eligibility traces. n ed m sono NUM_PRIMITIVE.
%   y: vettore distanza dai cluster corrispondente allo stato dopo 
%   l'esecuzione dell'azione.

global NUM_PRIMITIVE

%   Tutto il codice commentato sotto lo eseguo gia nel chiamante con alcune
%    modifiche.

% %   Inizializzazioni
% w = zeros(NUM_PRIMITIVE);
% t = zeros(NUM_PRIMITIVE);
% z = zeros(NUM_PRIMITIVE);

% %   Sceglie i pesi delle primitive per la prima iterazione del Nac. Le
% %   azioni/pesi ammissibili sono compresi nell'intervallo [0,1].
% %   Inizialmente viene eseguita solo una primitiva, quella più consona allo
% %   stato x osservato.
% pi_pesi=zeros(size(x,1),1);
% [elemento,posizione]=min(x);
% pi_pesi(posizione)=1;
% 
% %   Calcolo la combinazione di primitive.
% for i=1:NUM_PRIMITIVE
%     pi_f = pi_f + pi_pesi(i)*pi_base(i,x);
% end

%   Eseguo la pi_f e ricevo il reward e il corrispondente stato. Interfacciarsi con Nao
%   [r,y] = Esegui(pi_f);


% %   Eseguo Nac per ogni policy pi_pesi(i). Il reward è pesato rispetto al
% %   peso effettivo che la primitiva motoria ha avuto nell'azione
% for i=1:NUM_PRIMITIVE
% [w(:,1),t(:,1),pi_pesi(i),z(:,i)]=Nac(w(:,i),t(:,i),pi_pesi(i),z(:,i),x,y,r*(pi_pesi(i)/sum(pi_pesi)));
% end 
% 
% %   Aggiorno lo stato
% x=y;

% %   Iterazione fino a convergenza.
% while true
%     %   Calcolo la combinazione di primitive.
%     for i=1:NUM_PRIMITIVE
%         pi_f = pi_f + pi_pesi(i)*pi_base(i,x);
%     end
% 
%     %   Eseguo la pi_f e ricevo il reward e il corrispondente stato. Interfacciarsi con Nao
%     %   [r,y] = Esegui(pi_f);


    %   Eseguo Nac per ogni policy pi_pesi(i). Il reward è pesato rispetto al
    %   peso effettivo che la primitiva motoria ha avuto nell'azione.
    for i=1:NUM_PRIMITIVE
        [w(:,i),t(:,i),pi_pesi(i),z(:,i)]=Nac(w(:,i),t(:,i),pi_pesi(i),z(:,i),x,y,r*(pi_pesi(i)/sum(pi_pesi)));
    end
    
%     %   Aggiorno lo stato
%     x=y;
% end



end

