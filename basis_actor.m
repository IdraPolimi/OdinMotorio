function [ f ] = basis_actor( x )
%BASIS_ACTOR Calcola il vettore delle features per una coppia stato-azione
%   Le features sono gaussiane, ogni componente gaussiana i ha centro
%   xi che è il vettore delle distanze dai centri dei cluster 
%   dello stato "base" corrispondente alla primitiva i-esima.
%   Il numero delle basis function è il numero delle primitive che ho a
%   disposizione.

%   variabili
%   f: vettore colonna risultato delle basis functions
%   x: vettore colonna distanze dai cluster dello stato

%   Inizializzo media e varianza delle gaussiane
%   MU= ;
%   SIGMA= ;  Le devo recuperare da Idra/Odin quando faccio i test.
global NUM_PRIMITIVE

%   Calcolo la gaussiana multivariata, immaginando che vettore x sia
%   vettore colonna lo devo trasporre.
    f = zeros(NUM_PRIMITIVE,1);
for i=1:NUM_PRIMITIVE
    f(i) = mvnpdf(x',MU(i),SIGMA);
end


end