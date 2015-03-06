function [ output_args ] = esegui_nao( keys,dt )
%ESEGUI_NAO Summary of this function goes here
%   Detailed explanation goes here

global MOTION
global DURATA
global NAMES
%   Controllare durata nella implementazione di Schaal perchè usa un
%   parametro tau per scalare una durata fissa di 0.5s. Inoltre controllare
%   il tipo di parametri in ingresso della funzione matlab del nao
%   interpolazione e inserire una volta scelto il task i nomi giusti dei
%   dofs.

times = ones(DURATA/dt,1);
times(1)=dt;
for i=2:size(times)
    times(i)=times(i-1)+dt;
end

names=['dof1', 'dof2', 'dof3', 'dof4'];
MOTION.angleInterpolationBezier(NAMES, times, keys);

end

