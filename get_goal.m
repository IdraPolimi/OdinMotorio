function [ g ] = get_goal( id )
%GET_GOAL Summary of this function goes here
%   Detailed explanation goes here

infos = dcp('Structure',id);
g = infos.g;

end

