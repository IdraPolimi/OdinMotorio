%
% Copyright (c) 2012 Aldebaran Robotics. All rights reserved.
% Use of this source code is governed by a BSD-style license that can be
% found in the COPYING file.
%



classdef ALProxy < handle
    
    properties
    end
    
    properties (GetAccess='public', SetAccess='private')
        ptrProxyNaoQi;
    end
    
    methods
        function obj=ALProxy(module, ip, port)
            obj.ptrProxyNaoQi = matlabproxy(module,ip,port)
        end
		
        function I = call(obj, method, varargin)
			I = matlabcall(obj.ptrProxyNaoQi,method, varargin)
        end 
        
		function callVoid(obj, method, varargin)
			matlabcall(obj.ptrProxyNaoQi,method, varargin)
        end 
		
    end
end

