function [ ris ] = basis_metap( s,a,b )
%BASIS_METAP Calcola le basis function della state value function dei
%metaparametri
%   Restituisce vettore colonna delle basis function della state value
%   function dei metaparamentri per un valore di s.

%   Variabili:
%   s: stato corrente. vettore riga.
%   ris: vettore colonna delle basis function in s.
%   a,b: estremi dell'intervallo dei metaparametri.
%   n: numero di intervalli
%   c: vettore colonna centri gaussiane.

%   Inizializzazioni
n = 3;
intervallo = (b-a)/n;
m=size(s,2);
SIGMA=1; %aggiustare la varianza
%   Discretizzo i range dei metaparametri per calcolare i poi i centri,
%   per ogni Dof j che corrispondono alle colonne di a,b.
%   Regular grid.
for j=1:m %colonne
    for i=1:n %righe
        c(i,j)= i*intervallo(1,j);
    end
end

% Calcolo i centri facendo prodotto cartesiano delle discretizzazioni.
%per ogni colonna
for j=1:m
    t=1; %inizio di un blocco di numeri uguali
    g=1; %numero da inserire nel blocco
    %per ogni blocco
    for i=1:(n^(m-j+1))/(n^(m-j))
        %metti il numero g sempre uguale
        mu(t:t+(n^(m-j))-1,j)=c(g,j);
        %vai al blocco successivo
        t=t+(n^(m-j));
        %vai al numero successivo
        g= g+1;
    end
    f=t-1;
    while t<n^m
        mu(t:t+f-1,j)=mu(1:f,j);
        t= t+f;
    end    
end

%   Calcolo il valore delle basis function
ris=zeros(n^m);
for k=1:n^m
    ris(k,1) = mvnpdf(x',mu(k,:),SIGMA);
end

end

