function ec = except(ecx,varargin)
for eci = 1:nargin-1
if(ecx ~= varargin{eci})
    ec = 1;
else
    ec = 0;
end
end