%
% Copyright (c) 2012 Aldebaran Robotics. All rights reserved.
% Use of this source code is governed by a BSD-style license that can be
% found in the COPYING file.
%



function [FootStepX FootStepY] = drawFoot(PosFootX, PosFootY, teta, color, lineWidth)
%axis (-10 -10 10 10)
% function to draw the foot step

%global lFoot         %largeur du pied
%global LFoot         %Longueur du pied

lFoot = 0.08;
LFoot = 0.13;

x1 = 2*LFoot/3;
x2 = -LFoot/3;
y1 = lFoot/2;
y2 = -lFoot/2;
FootStepX = [...
    PosFootX+x1*cos(teta)-y1*sin(teta),...
    PosFootX+x2*cos(teta)-y1*sin(teta),...
    PosFootX+x2*cos(teta)-y2*sin(teta),...
    PosFootX+x1*cos(teta)-y2*sin(teta),...
    PosFootX+x1*cos(teta)-y1*sin(teta)];

disp(FootStepX);

FootStepY = [...
    PosFootY+y1*cos(teta)+x1*sin(teta),...
    PosFootY+y1*cos(teta)+x2*sin(teta),...
    PosFootY+y2*cos(teta)+x2*sin(teta),...
    PosFootY+y2*cos(teta)+x1*sin(teta),...
    PosFootY+y1*cos(teta)+x1*sin(teta)];
FootStepZ = [0,0,0,0,0];
hold on;
%plot3(PosFootX, PosFootY,0, 'or', 'LineWidth', 2);
line(FootStepX, FootStepY, FootStepZ, 'Color',color, 'LineStyle' ,'-', 'LineWidth', lineWidth);
axis square
hold off;
end