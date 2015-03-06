%
% Copyright (c) 2012 Aldebaran Robotics. All rights reserved.
% Use of this source code is governed by a BSD-style license that can be
% found in the COPYING file.
%

function motiongraph()
'motion graph'

motion = ALMotionProxy('127.0.0.1',9559);


walkTarget = [
    [0.0, 0.0];...
    [0.0, 0.1];...
    [0.1, 0.1];...
    [0.1, -0.1];...
    [0.2, -0.1];...
    [0.05, -0.05];...
    ];

for i = 1:5

step = motion.getFootSteps();
left = step{1}{1};
disp('teta:');
disp(left{1});
disp(left{2});
disp(left{3});
disp('draw');
drawFoot(left{1}, left{2}, left{3}, 'Left', 2);

pause(1.0)
end
end

function plotMass(motion, jointName)
'plotMass'
mass = motion.getMass(jointName);
com  = [0.0, 0.0, 0.0];


plot3(com(1), com(2), com(3));

end

function plotWalkAbsolute(motion, walkTarget)


plot(walkTarget(1), walkTarget(2), 'x')
hold on

end

function plotWalkRelative(motion, walkTarget)

motion.getFootSteps
plot(walkTarget(1), walkTarget(2), 'x')
hold on

end

function plotFootStep(x, y, theta)


dx = 0.2;
dy = 0.1;

line([x + (-dx), x + (-dx)], [y + (-dy), y + dy])
line([x + dx, x + dx], [y + (-dy), y + dy])
line([x + (-dx), x + dx], [y + dy, y + dy])
line([x + (-dx), x + dx], [y + (-dy), y + (-dy)])
end
