%
% Copyright (c) 2012 Aldebaran Robotics. All rights reserved.
% Use of this source code is governed by a BSD-style license that can be
% found in the COPYING file.
%


classdef ALVideoDeviceProxy < handle
    properties
    end
    
    properties (GetAccess='public', SetAccess='private')
        ptrProxyNaoQi;
    end
    
    methods
        function obj=ALVideoDeviceProxy(ip, port)
            obj.ptrProxyNaoQi = matlabproxy('ALVideoDevice',ip,port);
        end
		
        function I = call(obj, method, varargin)
			I = matlabcall(obj.ptrProxyNaoQi,method, varargin);
        end 
        
		function callVoid(obj, method, varargin)
			matlabcall(obj.ptrProxyNaoQi,method, varargin);
        end 


        function exit(obj, varargin)
            matlabcall(obj.ptrProxyNaoQi, 'exit', varargin);
        end
        function I = getActiveCamera(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getActiveCamera', varargin);
        end
        function I = getAngPosFromImgPos(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getAngPosFromImgPos', varargin);
        end
        function I = getAngSizeFromImgSize(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getAngSizeFromImgSize', varargin);
        end
        function I = getBrokerName(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getBrokerName', varargin);
        end
        function I = getDirectRawImageLocal(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getDirectRawImageLocal', varargin);
        end
        function I = getDirectRawImageRemote(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getDirectRawImageRemote', varargin);
        end
        function I = getGVMColorSpace(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getGVMColorSpace', varargin);
        end
        function I = getGVMFrameRate(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getGVMFrameRate', varargin);
        end
        function I = getGVMResolution(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getGVMResolution', varargin);
        end
        function I = getImageLocal(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getImageLocal', varargin);
        end
        function I = getImageRemote(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getImageRemote', varargin);
        end
        function I = getImgInfoFromAngInfo(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getImgInfoFromAngInfo', varargin);
        end
        function I = getImgInfoFromAngInfoWithRes(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getImgInfoFromAngInfoWithRes', varargin);
        end
        function I = getImgPosFromAngPos(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getImgPosFromAngPos', varargin);
        end
        function I = getImgSizeFromAngSize(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getImgSizeFromAngSize', varargin);
        end
        function I = getMethodHelp(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getMethodHelp', varargin);
        end
        function I = getMethodList(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getMethodList', varargin);
        end
        function I = getModuleHelp(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getModuleHelp', varargin);
        end
        function I = getParam(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getParam', varargin);
        end
        function I = getUsage(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getUsage', varargin);
        end
        function I = getVIMColorSpace(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getVIMColorSpace', varargin);
        end
        function I = getVIMFrameRate(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getVIMFrameRate', varargin);
        end
        function I = getVIMResolution(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getVIMResolution', varargin);
        end
        function I = isFrameGrabberOff(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'isFrameGrabberOff', varargin);
        end
        function I = isRunning(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'isRunning', varargin);
        end
        function onClientDisconnected(obj, varargin)
            matlabcall(obj.ptrProxyNaoQi, 'onClientDisconnected', varargin);
        end
        function I = ping(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'ping', varargin);
        end
        function I = recordVideo(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'recordVideo', varargin);
        end
        function I = releaseDirectRawImage(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'releaseDirectRawImage', varargin);
        end
        function I = releaseImage(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'releaseImage', varargin);
        end
        function I = resolutionToSizes(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'resolutionToSizes', varargin);
        end
        function I = setColorSpace(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'setColorSpace', varargin);
        end
        function I = setFrameRate(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'setFrameRate', varargin);
        end
        function setParam(obj, varargin)
            matlabcall(obj.ptrProxyNaoQi, 'setParam', varargin);
        end
        function setParamDefault(obj, varargin)
            matlabcall(obj.ptrProxyNaoQi, 'setParamDefault', varargin);
        end
        function I = setResolution(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'setResolution', varargin);
        end
        function I = sizesToResolution(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'sizesToResolution', varargin);
        end
        function I = startFrameGrabber(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'startFrameGrabber', varargin);
        end
        function stop(obj, varargin)
            matlabcall(obj.ptrProxyNaoQi, 'stop', varargin);
        end
        function I = stopFrameGrabber(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'stopFrameGrabber', varargin);
        end
        function I = stopVideo(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'stopVideo', varargin);
        end
        function I = subscribe(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'subscribe', varargin);
        end
        function unsubscribe(obj, varargin)
            matlabcall(obj.ptrProxyNaoQi, 'unsubscribe', varargin);
        end
        function I = version(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'version', varargin);
        end
        function I = wait(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'wait', varargin);
        end
    end
    
    
end

