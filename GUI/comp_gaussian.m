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

function [G] = comp_gaussian(x,sigma)
% Function for exercise sheet 1 - computes the value of a Gaussian
% function.

%DESCRIPTION: G = comp_gaussian(x, sigma)
%       Computes the value of a zero-mean Gaussian function
%       (i.e. normal  distribution) 

% INPUTS:
%       x (double vector) - Function input values (x-axis)
%       sigma (double scalar)  - Standard deviation (determines the 'width' of the Gaussian)

%OUTPUTS:
%       G (double vector) - Evaluated Gaussian function

%Function dependencies: None

%Author: Edward James, Medical Imaging CDT MRes, 2017

%Compute the Gaussian function
G=(1/(sigma*(sqrt(2*pi)))*exp((-1*(x.^2))/(2*sigma^2)));
end

