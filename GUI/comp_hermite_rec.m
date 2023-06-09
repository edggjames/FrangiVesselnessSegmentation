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

function [Hn] = comp_hermite_rec(n, x)
%comp_hemrite_dir - Computes the physicist's Hermite polynomial of order n

%Description - Uses recursion (in which the function calls itself) until
%exit conditions are satisfied

%Inputs: n (integer) = any integer greater than or equal to 0
%        x (double scalar) = input value

%Outputs:Hn (double scalar) = evaluation of Hn(x)

%Function dependencies: None

%Author: Edward James, Medical Imaging CDT MRes, 2017

%Define exit conditions for when n = 0 or n = 1
if n == 0
      Hn = 1;
elseif n == 1
      Hn = 2*x;
elseif n > 1
      %Initiate recursion
      Hn=(2*x.*comp_hermite_rec(n-1,x))-(2*(n-1)*comp_hermite_rec(n-2,x));
end  

end

