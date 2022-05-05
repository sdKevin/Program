function p = donut(varargin)
% Donut creates a donut chart with offset slices and custom labels.
% <Syntax>
% All input arguments and syntax of pie function could be used by donut as 
% follows:
% donut(X)
% donut(X,explode)
% dount(X,labels)
% donut(X,explode,labels)
% donut(ax,___)
% p = donut(___)
% Edit more properties by using Name-Value pair arguments:
% donut(___,Name,Value)
% 
% <Input/Output>
% The following arguments are the same as that in pie function, see pie 
% for more details about the way in which they should be specified.
% X - Input array
% explode - Offset slices
% labels - Label options
% ax - Axes
% p - Patch and Text objects
% 
% <Optional Input>
% Name-Value pair arguments
% ringwidth - width of the donut ring, as the ratio to circle radius
%     specified as a scalar in range [0,1], defaule is 0.33.
% 
% <Examples>
% Example 1:
% X = [1 3 0.5 2.5 2];
% explode = [0 1 0 0 0];
% donut(X,explode);
% colormap(lines(5))
% 
% Example 2:
% labels = {'A','B','C','D','E','F','J','H','I','J','K','L'};
% donut(ones(1,12),labels,'ringwidth',0.45);
% colormap(hsv)
% 
% <Copyright>
% Author:   Yang Liu
% Contact:  liuyang-y2003@foxmail.com
% Update:   2022-05-01
% Version:  1.0.2
% 
% See also pie


rw = 0.33;


idx = find(cellfun(@(x) ischar(x),varargin));
temp = find(ismember(varargin(idx),{'ringwidth'}),1);

if isempty(temp)
    k = length(varargin)+1;
else
    k = idx(temp);
end
idx = k;


while k<=length(varargin)
    switch lower(varargin{k})
        case 'ringwidth'
            rw = varargin{k+1};
    end
    k=k+2;
end

p = pie(varargin{1:idx-1});

for i = 1:2:length(p)
    p(i).CData = p(i).CData(1);
    os = repmat(p(i).Vertices(1,:),size(p(i).Vertices,1)-2,1); 
    p(i).Faces = 1:(length(p(i).Faces)-2)*2+1;
    p(i).Vertices = [p(i).Vertices(2:end-1,:);...
        (p(i).Vertices(end-1:-1:2,:)-os).*(1-rw) + os;p(i).Vertices(2,:)];
end
