function [ y ] = pi_base(id,dt,meta_param)
%PI_BASE Calcolo la primitiva: restituisce vettore posizione dei giunti
%   Detailed explanation goes here

global DURATA
global MOTION
global NAMES

%recuperarli da nao
posizione_giunti = MOTION.getAngles(NAMES,false);

%   Nuova posizione iniziale
dcp('Reset_State',ID,posizione_giunti);

%   Imposto nuovo goal
dcp('Set_Goal',id,meta_param,1);

%   Calcolo la nuova primitiva
[y,yd,ydd]=dcp('Run',id,DURATA,dt);

end

