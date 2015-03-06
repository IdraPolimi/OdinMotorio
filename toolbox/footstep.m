%
% Copyright (c) 2012 Aldebaran Robotics. All rights reserved.
% Use of this source code is governed by a BSD-style license that can be
% found in the COPYING file.
%



function footstep()
'motion graph'


motion = ALMotionProxy('127.0.0.1',9559);


for z = 1:20
    step = motion.getFootSteps();
    left = step{1}{1};
    right = step{1}{2};
    if( (left{1} ~= right{1}) && (left{2} ~= right{2}))
        left2D = {left{1},left{2},left{3}}
        right2D = {right{1},right{2},right{3}}
    end
        if (size(step{1})>=1)
            for i = 1:size(step{2});

                name = step{2}{i}{1}
                pos = step{2}{i}{3}
                tmpPose2D = {pos{1}, pos{2}, pos{3}};
                disp('loop1');
                if(name == 'LLeg')
                        left2D{1} = right2D{1} + cos(right2D{3}) * tmpPose2D{1} - sin(right2D{3}) * tmpPose2D{2};
                        left2D{2} = right2D{2} + sin(right2D{3}) * tmpPose2D{1} + cos(right2D{3}) * tmpPose2D{2};
                        left2D{3} = right2D{3} + tmpPose2D{3};
                        disp('draw left');
                        drawFoot(left2D{1}, left2D{2}, left2D{3}, [1 0 0], 2);
                  else
                        right2D{1} = left2D{1} + cos(left2D{3}) * tmpPose2D{1} - sin(left2D{3}) * tmpPose2D{2};
                        right2D{2} = left2D{2} + sin(left2D{3}) * tmpPose2D{1} + cos(left2D{3}) * tmpPose2D{2};
                        right2D{3} = left2D{3} + tmpPose2D{3};
                        disp('draw right');
                        drawFoot(right2D{1}, right2D{2}, right2D{3}, [0 1 0], 2);
                  end
            end
        end
          if (size(step{3})>=1)
              for i = 1:size(step{3});
                  name = step{3}{i}{1};
                  pos = step{3}{i}{3};
                  tmpPose2D = {pos{1}, pos{2}, pos{3}};
                  if(name == 'LLeg')
                        left2D{1} = right2D{1} + cos(right2D{3}) * tmpPose2D{1} - sin(right2D{3}) * tmpPose2D{2};
                        left2D{2} = right2D{2} + sin(right2D{3}) * tmpPose2D{1} + cos(right2D{3}) * tmpPose2D{2};
                        left2D{3} = right2D{3} + tmpPose2D{3};
                        drawFoot(left2D{1}, left2D{2}, left2D{3}, [1 0 0], 0.5);
                  else
                        right2D{1} = left2D{1} + cos(left2D{3}) * tmpPose2D{1} - sin(left2D{3}) * tmpPose2D{2};
                        right2D{2} = left2D{2} + sin(left2D{3}) * tmpPose2D{1} + cos(left2D{3}) * tmpPose2D{2};
                        right2D{3} = left2D{3} + tmpPose2D{3};
                        drawFoot(right2D{1}, right2D{2}, right2D{3}, [0 1 0], 0.5);
                  end
              end
          end

  

pause(1.0)
end
end


