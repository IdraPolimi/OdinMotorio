%
% Copyright (c) 2012 Aldebaran Robotics. All rights reserved.
% Use of this source code is governed by a BSD-style license that can be
% found in the COPYING file.
%


classdef ALBluetoothProxy < handle
    properties
    end
    
    properties (GetAccess='public', SetAccess='private')
        ptrProxyNaoQi;
    end
    
    methods
        function obj=ALBluetoothProxy(ip, port)
            obj.ptrProxyNaoQi = matlabproxy('ALBluetooth',ip,port);
        end
		
        function I = call(obj, method, varargin)
			I = matlabcall(obj.ptrProxyNaoQi,method, varargin);
        end 
        
		function callVoid(obj, method, varargin)
			matlabcall(obj.ptrProxyNaoQi,method, varargin);
        end 


        function connect(obj, varargin)
            matlabcall(obj.ptrProxyNaoQi, 'connect', varargin);
        end
        function disconnect(obj, varargin)
            matlabcall(obj.ptrProxyNaoQi, 'disconnect', varargin);
        end
        function exit(obj, varargin)
            matlabcall(obj.ptrProxyNaoQi, 'exit', varargin);
        end
        function I = getAssociatedDeviceList(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getAssociatedDeviceList', varargin);
        end
        function I = getBrokerName(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getBrokerName', varargin);
        end
        function I = getConnectedDeviceList(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getConnectedDeviceList', varargin);
        end
        function I = getDeviceList(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'getDeviceList', varargin);
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
        function I = isConnected(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'isConnected', varargin);
        end
        function I = isRunning(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'isRunning', varargin);
        end
        function I = ping(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'ping', varargin);
        end
        function I = scan(obj, varargin)
            I = matlabcall(obj.ptrProxyNaoQi, 'scan', varargin);
        end
        function send(obj, varargin)
            matlabcall(obj.ptrProxyNaoQi, 'send', varargin);
        end
        function setAssociatedDeviceList(obj, varargin)
            matlabcall(obj.ptrProxyNaoQi, 'setAssociatedDeviceList', varargin);
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

