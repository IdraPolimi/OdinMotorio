function [ mu ] = prova( s )
%PROVA Summary of this function goes here
%   Detailed explanation goes here

n=size(s,1);
m=size(s,2);
%per ogni colonna
for j=1:size(s,2)
    t=1; %inizio di un blocco di numeri uguali
    g=1; %numero da inserire nel blocco
    %per ogni blocco
    for i=1:(n^(m-j+1))/(n^(m-j))
        %metti il numero g sempre uguale
        mu(t:t+(n^(m-j))-1,j)=s(g,j);
        %vai al blocco successivo
        t=t+(n^(m-j));
        %vai al numero successivo
        g= g+1
    end
    f=t-1;
    while t<n^m
        mu(t:t+f-1,j)=mu(1:f,j);
        t= t+f;
    end    
end
end

