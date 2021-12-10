function [Accum,chan] = d8alg(Psi,varargin)
% This function computes the most-likely channel positions in a subglacial
% environment.  The hydraulic potential is used to compute total
% contributing area and hence direction of flow.  Algorithmically, it uses
% the simple D8 algorithm.
%
% Step 1: Find flow direction (find nanmin. potential of all adjacent cells)
% Step 2: Follow flow direction to nansum the cumulative # cells flowing into
%         a given "minimum" cell.
% Step 3: Find the maximum likely channel location in each E-W direction
%         for a given number of channels.
% 
% NOTE: The user should make sure that the upstream portion of the 
% potential matrix Psi corresponds to first row of the matrix.
% 
% USAGES
% [channel,I] = d8alg(Psi)
% [channel,I] = d8alg(Psi,numChans)
% [channel,I] = d8alg(Psi,Accum, numChans)
% [channel,I] = d8alg(Psi,Accum,numChans,'plot')
% 
% INPUT:
% Psi:      An MxN array giving the hydraulic potential over a grid.
% Accum:    The accumulation matrix. This weights each cell with a fluid
%           volume. Must be same size as Psi.
% numChans: The number of channels to be chosen per column.
% plotopt:  Gives an option to plot images of the potential and the channel
%           locations, is a string 'plot'
% 
% OUTPUT:
% channel: The channel locations are specified by a matrix in which all the
%          elements without channels are 0 and all the elements with a
%          channel are equal to the accumulation.
% I:       the index matrix giving the channel locations.
% 
% -------------------------------------------------------------------------
% EXAMPLE: See example on d-8 tutorial, provided by the following tutorial:
% http://www.niu.edu/landform/nonlinearRules.htm
% 
% %make potential function
% Psi =[14,13,13,14,11;
%       11,12,14,13,10;
%       11,10,11,11, 9;
%       8, 9, 11,10, 8;
%       6, 8, 10, 7, 9];
% 
% Acc = ones(size(Psi));
% 
% %make accumulation function. Compare to website accumulation function.
% %Note the last row of the website prediction contains an error. One arrow
% %in the predicted flow direction is pointed the wrong way.
% 
% [channel,I] = d8alg(Psi,Acc,2,'plot');
% 
% %The predicted channel locations match with what you would expect from
% %the accumulation plot?
%--------------------------------------------------------------------------
% Joshua D Carmichael
% josh.carmichael@gmail.com
%
% Edit Log
% 12.May.2010
%--------------------------------------------------------------------------

numChans    = 1;
[M,N]       = size(Psi);
chan        = zeros(M,N);
Accum       = ones(M,N);
plotopt     = 'none';

for k=1:length(varargin)
    
    if(ischar(varargin{k}))
        plotopt = varargin{k};
    end;
    
    if(isscalar(varargin{k}))
        numChans = varargin{k};
    end;
    
    if(and( isnumeric(varargin{k}), not(isscalar(varargin{k})) ))
        Accum = varargin{k};
    end;
    
end;

flowDir = cell(size(Psi));
%Set the accumulation over the interior points of the western boundary
for i = 2:M-1 %the column (x-value, or E-value) is set to 1
    
    j               = 1;
    subPsi          = Psi(i-1:i+1,j:j+1);
    [temp,I]        = nanmin(subPsi(:));
    [I,J]           = ind2sub([3,2],I);
    flowDir{i,j}    = [I+i-2,J];
    
end;

%Set the accumulation over the interior points of the eastern boundary
for i = 2:M-1 %the column (x-value, or E-value) is set to the end, N
    
    j               = N;
    subPsi          = Psi(i-1:i+1,j-1:j);
    [temp,I]        = nanmin(subPsi(:));
    [I,J]           = ind2sub([3,2],I);
    flowDir{i,j}    = [I+i-2,j+J-2];
    
end;

%Set the accumulation over the interior points of the northern boundary
for j = 2:N-1 %the column (y-value, or N-value) is set to 1
    
    i               = 1;
    subPsi          = Psi(i:i+1,j-1:j+1);
    [temp,I]        = nanmin(subPsi(:));
    [I,J]           = ind2sub([2,3],I);
    flowDir{i,j}    = [I,J+j-2];
    
end;

%Set the accumulation over the interior points of the southern boundary
for j = 2:N-1 %the column (y-value, or N-value) is set to end
    
    i               = M;
    subPsi          = Psi(i-1:i,j-1:j+1);
    [temp,I]        = nanmin(subPsi(:));
    [I,J]           = ind2sub([2,3],I);
    flowDir{i,j}    = [i+I-2,J+j-2];
    
end;

%Set the accumulation over the corner points of the grid boundary
%First: NorthWest corner
subPsi      = Psi(1:2,1:2);
[temp,I]    = nanmin(subPsi(:));
[I,J]       = ind2sub([2,2],I);
flowDir{1,1}= [I,J];

%Set the accumulation over the corner points of the grid boundary
%Second: SouthWest corner
subPsi              = Psi(M-1:M,1:2);
[temp,I]            = nanmin(subPsi(:));
[I,J]               = ind2sub([2,2],I);
flowDir{M,1}        = [I+M-2,J];

%Set the accumulation over the corner points of the grid boundary
%Third: NorthEast corner
subPsi              = Psi(1:2,N-1:N);
[temp,I]            = nanmin(subPsi(:));
[I,J]               = ind2sub([2,2],I);
flowDir{1,N}        = [I,J+N-2];

%Set the accumulation over the corner points of the grid boundary
%Fourth: SouthEast corner
subPsi              = Psi(M-1:M,N-1:N);
[temp,I]            = nanmin(subPsi(:));
[I,J]               = ind2sub([2,2],I);
flowDir{M,N}        = [I+M-2,J+N-2];


%Compute flow direction in interior grid points now that all edges and
%corners are done
for i = 2:M-1 %nansum over number of northward cells (rows)
    
    for j = 2:N-1 %nansum over number of eastward cells (columns)
        
        % Assign values to variable input arguments.
        subPsi              = Psi(i-1:i+1,j-1:j+1);
        [temp,I]            = nanmin(subPsi(:));
        [I,J]               = ind2sub([3,3],I);
        %the minus 2 is needed since the nanmin is computed over a 3x3 array
        flowDir{i,j}        = [I+i-2,J+j-2];
        
    end;
    
end;

%Get the cumulative nansum matrix
for i = 1:M %nansum over number of northward cells (rows)
    
    for j = 1:N %nansum over number of eastward cells (columns)
        
        ind1 = flowDir{i,j}(1);
        ind2 = flowDir{i,j}(2);
        
        %compute the accumulation without repitition--ensure Accum is not
        %being doubled, tripled, etc... in case were index gives location
        %of local flow 'sink'.
        if( and(ind1==i,ind2==j) ),
            
            continue;
            
        else
            
            Accum(ind1,ind2) = nansum([Accum(i,j) , Accum(ind1,ind2)]);
            
        end;
        
    end;
    
end;

[temp,ind]  = sort(Accum,2,'descend');

%start at 1st row
for k = 1:M
    
    if( nnz(gradient(Accum(k,:)))==0 )
        
        chan(k,:) = 1;
        
    else
        
        chan(k,ind(k,1:numChans)) = 1;
        
    end;
    
end;

if(strcmp(plotopt,'plot'));
    
    subplot(1,2,1);   
    imagesc(Accum);
    makePlotPretty;
    title('Accumulation Values');
    
    subplot(1,2,2);
    imagesc(chan); 
    makePlotPretty;
    title('Channel Locations');
    
end;

return;