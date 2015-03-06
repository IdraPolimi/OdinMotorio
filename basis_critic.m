function [ f ] = basis_critic( x,a,teta )
%BASIS Calcola il vettore delle features per una coppia stato-azione

%   variabili
%   f: vettore colonna rappresentante le compatible basis functions per x,a
%   x: vettore colonna distanze dai cluster dello stato
%   a: scalare, azione
%   teta: vettore colonna dei parametri della policy.
%   basis: vettore colonna delle basis function della policy valutate per
%   x,a.

global NUM_PRIMITIVE

sigma=1; %Inizializzarla nella maniera più opportuna

f = zeros(NUM_PRIMITIVE,1);
basis = basis_actor(x);
for i=1:NUM_PRIMITIVE
    f(i) = (a-teta'*basis)*basis(i)/(sigma^2);
end



end

