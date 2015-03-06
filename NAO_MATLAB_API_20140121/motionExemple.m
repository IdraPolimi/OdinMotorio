%
% Copyright (c) 2012 Aldebaran Robotics. All rights reserved.
% Use of this source code is governed by a BSD-style license that can be
% found in the COPYING file.
%


motion = ALMotionProxy('127.0.0.1',9559);

effector = 'LArm';
space = int32(0);
axisMask = int32(1);
isAbsolute = false;
currentPos = [0.01, 0.02, 0.03, 0.04, 0.05, 0.06];

targetPos  = [0.07, 0.08, 0.09, 0.10, 0.11, 0.12];

path = [currentPos;targetPos];

tim = [2.0,4.0];

motion.positionInterpolation(effector, space, path, axisMask, tim, isAbsolute);

names = 'Body';
useSensors  = false; 
commandAngles = motion.getAngles(names, useSensors);
disp(commandAngles)