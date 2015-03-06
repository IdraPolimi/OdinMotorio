%
% Copyright (c) 2012 Aldebaran Robotics. All rights reserved.
% Use of this source code is governed by a BSD-style license that can be
% found in the COPYING file.
%


classdef ALInfraredProxy < handle
    properties
    end
    
    properties (GetAccess='public', SetAccess='private')
        ptrProxyNaoQi;
    end
    
    methods
        function obj=ALInfraredProxy(ip, port)
            obj.ptrProxyNaoQi = matlabproxy('ALInfrared',ip,port);
        end
		
        function I = call(obj, method, varargin)
			I = matlabcall(obj.ptrProxyNaoQi,method, varargin);
        end 
        
		function callVoid(obj, method, varargin)
			matlabcall(obj.ptrProxyNaoQi,method, varargin);
        end 


        function I = confRemoteRecordAddKey(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'confRemoteRecordAddKey', varargin);
        end
        function I = confRemoteRecordCancel(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'confRemoteRecordCancel', varargin);
        end
        function I = confRemoteRecordGetStatus(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'confRemoteRecordGetStatus', varargin);
        end
        function I = confRemoteRecordNext(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'confRemoteRecordNext', varargin);
        end
        function confRemoteRecordSave(obj, varargin)
            matlabcall(obj.ptrProxyNaoQi, 'confRemoteRecordSave', varargin);
        end
        function confRemoteRecordStart(obj, varargin)
            matlabcall(obj.ptrProxyNaoQi, 'confRemoteRecordStart', varargin);
        end
        function exit(obj, varargin)
            matlabcall(obj.ptrProxyNaoQi, 'exit', varargin);
        end
        function I = getBrokerName(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getBrokerName', varargin);
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
        function I = getUsage(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getUsage', varargin);
        end
        function initReception(obj, varargin)
            matlabcall(obj.ptrProxyNaoQi, 'initReception', varargin);
        end
        function I = isRunning(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'isRunning', varargin);
        end
        function I = ping(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'ping', varargin);
        end
        function send32(obj, varargin)
            matlabcall(obj.ptrProxyNaoQi, 'send32', varargin);
        end
        function send8(obj, varargin)
            matlabcall(obj.ptrProxyNaoQi, 'send8', varargin);
        end
        function sendIpAddress(obj, varargin)
            matlabcall(obj.ptrProxyNaoQi, 'sendIpAddress', varargin);
        end
        function sendRemoteKey(obj, varargin)
            matlabcall(obj.ptrProxyNaoQi, 'sendRemoteKey', varargin);
        end
        function stop(obj, varargin)
            matlabcall(obj.ptrProxyNaoQi, 'stop', varargin);
        end
        function I = version(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'version', varargin);
        end
        function I = wait(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'wait', varargin);
        end
    end
    
    
end

