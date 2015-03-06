%
% Copyright (c) 2012 Aldebaran Robotics. All rights reserved.
% Use of this source code is governed by a BSD-style license that can be
% found in the COPYING file.
%


video = ALVideoDeviceProxy('nao.local',9559);
video.subscribe('matlab', int16(1), int16(11), int16(30));


res = video.getImageRemote('matlab');

rgb  = res{7};
im = uint8(rand(240,320,3));
video.unsubscribe('matlab');

v = 1;
for j=1:240,
    for i=1:320,
        alpha = bitand(uint8(255),uint8(255));
        alpha = bitshift(uint8(alpha), uint8(24));
        red = bitand(uint8(rgb(i*j)),uint8(255));
        red = bitshift(red,16);

        green = bitand(uint8(rgb(i*j+1)), uint8(255));
        green = bitshift(red,uint8(8));

        blue = bitand(uint8(rgb(i*j+2)), uint8(255));
        
        
        red = rgb(v);
        green = rgb(v+1);
        blue = rgb(v+2);
        
        im(j,i,1) = red;
        im(j,i,2) = green;
        im(j,i,3) = blue;
        v = v+3;
    end
end


image(im); 
axis image


title('RGB image');

