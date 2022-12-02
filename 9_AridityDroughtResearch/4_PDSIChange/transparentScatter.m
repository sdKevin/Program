function [ax,hp] = transparentScatter(x,y,co,a,dotsize,ncorners,X)
% TRANSPARENTSCATTER(x,y,co,a,dotsize,ncorners) uses patches to create a plot with transparent
% markers. assumes square axis
%
% INPUTS:
%   x and y (N x K): data. Each column is a different color. 
%   c (K x 3): [r,g,b] for each column. Default is the default color order of the
%   axis
%   a: opacity (alpha value) between 0 and 1 and is default: .1
%   dotsize: % of the axis each dot takes up. default: 1%
%   ncorners: number of corners in shape.
%       3: triangle
%       4: diamond
%       5: pentagon
%           ...
%       25: circle (default)

% OUTPUTS:
%   ax: axis handle
%   hp: handles to each of the patches
%
%example: 
%[ax,hp] = transparentScatter(randn(10000,2),randn(10000,2),[0.1 0 0; 0 0.1 0],.5,1,25);
%
% written by Ben Dichter Aug 29, 2014


ax = gca;

if ~exist('co','var') || isempty(co)
    co = get(gca,'ColorOrder');
end

if ~exist('a','var') || isempty(a)
    a = .1;
end

if ~exist('dotsize','var') || isempty(dotsize)
    dotsize = 1;
end

if ~exist('ncorners','var') || isempty(ncorners)
    ncorners = 25;
end

%if single data vectors, orientation doesn't matter
if size(x,1) == 1
    x = x';
end

if size(y,1) == 1
    y = y';
end


xall = x(:);
yall = y(:);

% xlims = [min(xall) max(xall)];
% ylims = [min(yall) max(yall)];
xlims = X;
ylims = X;

xrange = diff(xlims);
yrange = diff(ylims);

dot_height = yrange*dotsize/100;
dot_width = xrange*dotsize/100;

theta = linspace(0,2*pi,ncorners+1);
hp = NaN(length(x),1); %malloc
for i = 1:size(x,2)
    c = co(i,:);
    for ii=1:size(x,1)
        hp(ii,i)=patch((sin(theta)*dot_width + x(ii,i)),(cos(theta)*dot_height+y(ii,i)),c,'edgecolor','none');
        alpha(hp(ii,i),a);
    end
end

%gives you a little breathing room on the axes
xlim(xlims + [-.1 .1]*xrange)
ylim(ylims + [-.1 .1]*yrange)

axis square