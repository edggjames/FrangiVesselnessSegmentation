% This file is part of Vesselness_Filter_Tool.
% Copyright (C) 2023 Edward James.

% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU Lesser Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU Lesser Public License for more details.
   
% You should have received a copy of the GNU Lesser Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

function If = gaussian_imfilter_sep(I, p, q, sigma)
% GAUSSIAN_IMFILTER_SEP filters an image using a nth order derivative 
% Gaussian kernel taking advantage of the separability property (i.e. by
% performing a series of 1D convolutions).
%
%
% DESCRIPTION: If = gaussian_imfilter_sep(I, p, q, sigmax, sigmay)
%       Filters an image matrix, I, using a separable Gaussian kernel of 
%       width, sigmax/sigmay, and derivative order, p/q (in x and y
%       directions, respectively).
%
% INPUTS:
%       I (double matrix) - image to be filtered.
%       
%       p (integer scalar >= 0) - order of derivative in x-direction
%                                (The values of a zero-mean Gaussian function
%                                are evaluated when p = 0)
%
%       q (integer scalar >= 0) - order of derivative in y-direction
%                                (The values of a zero-mean Gaussian function
%                                are evaluated when q = 0)
%
%       sigma (double scalar)  - Standard deviations in each direction of
%       the Gaussian Kernel (determines the width or scale of the Gaussian)
%     
% OUTPUTS:
%       If (double matrix) - Filtered image
% 
% NB: For 2D images, x is in the direction of increasing column
%           index (i.e. left to right), and y is in the direction of
%           increasing row index (i.e. top to bottom);
%
% NB: 
%   1) When p or q is zero, a gaussian blurring filter is applied in the
%      relevant direction
%   2) When p or q is one, an edge detector filter is applied in the
%      relevant direction, which peaks at an edge
%   3) When p or q is two, a Laplacian of Gaussian (LOG) edge detector
%      filter is applied, which has a zero crossing at an edge.
%   
% FUNCTION DEPENDENCIES:
%	    comp_dgaussian - Computes the n-th order derivative of a Gaussian
%       function (Gn)
%       imfilter - image filtering (MATLAB Image Processing Toolbox)
%
% AUTHOR:
%       Edward James, Medical Imaging CDT MRes , UCL, 2017

% Create two 1D nth order derivative Gaussian masks over +/- 4*sigma
% (Note the x and y ranges always have an odd number of elements)

% Assume an isotropic Gaussian if only one value of sigma is provided
if length(sigma) == 1
    sigma = [sigma sigma];
end

x_lim = ceil(4*sigma(1));
y_lim = ceil(4*sigma(2));
x = -x_lim:x_lim;
y = -y_lim:y_lim;
Gpx = comp_dgaussian(x, sigma(1), p);  % 1 by N mask
Gqy = comp_dgaussian(y, sigma(2), q); % 1 by N mask
Gqy = Gqy'; %transpose into N by 1 mask

% Perform filtering using separability property
If = imfilter(I, Gpx, 'conv', 'replicate');
If = imfilter(If, Gqy, 'conv', 'replicate');
end

