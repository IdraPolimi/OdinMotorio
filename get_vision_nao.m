function [ output_args ] = get_vision_nao( input_args )
%GET_VISION_NAO Summary of this function goes here
%   Detailed explanation goes here

global PICTURE

      
PICTURE.setResolution(0);
PICTURE.setCameraID(cameraID); %settare cameraID
PICTURE.setPictureFormat('jpg');
PICTURE.takePicture('/','vision');
end

