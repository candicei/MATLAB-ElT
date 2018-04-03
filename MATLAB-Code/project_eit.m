%% MATH 406
%  Electrical Impedance Tomography (EIT)
%     Problem to determine non-uniformity within a circular region (a tumor
%     in the region) based on boundary values
%     
%     Using the solution  u(r,theta) =
%     [I*a/(2*pi*sigma)]*log[(a^2+r^2+2arcos(phi)/(a^2+r^2-2arcos(phi)]
%     where phi = theta-pi/2
%
%     Z_data.txt is a file containing for measurement data of voltages
%     - size: 16x8
%       
% Variables
%   [X,Y] = points on the boundary where measurements are taken
%   [x_mesh, y_mesh] = made by the mesh we want to determine our inner
%                      points and will be mapped to...
%   [XX, YY] = the mesh points (line above) to the edges given by the
%              transformations mapX and mapY
% % % % % 

clear;clc;
% OPENING THE DATA FILE (delta v1)
load('Z_data.mat');

% CONSTANTS
a = 10;     % radius
sigma = 1 ; % conductance
I = 1/a;    % current
k = 16;     % boundary points
n = 8;      % number of excitation location pairs (of current)
eps = 1e-9; % small number for the voltage boundary values to not have an effect on the data
C1 = I*a/(2*sigma*pi);
N = n*100;     % number of radial points within the mesh

% MAPPING FUNCTIONS
mapX = @(x,y) 2.*a^2.*x./(y.^2+x.^2+a^2);
mapY = @(X) (a^2-X.^2).^(1/2);

% VARIABLES
phi = 0:pi/n:(2*pi); 
u1 = zeros(k+1,n);
r = a;      % where we r

% HOMOGENOUS BOUNDARY VOLTAGE VALUES
u_foo(:,1) = C1*(log(a^2+a^2+2.*a.*a.*cos(phi))- log(a^2+a^2-2.*a.*a.*cos(phi)));
u_foo(abs(u_foo) == inf) = eps; %checking for voltage values at infinity to be set as eps to have little effect on data
% creating the homogenous matrix (of boundary voltages at the points)
for i = 1:n
    u1(:,i) = u_foo; 
end

% CREATING THE ZH MATRIX
ZH = diff(u1); % in order to the the delta u1 matrix
ZH([1,8,9,16],:) = eps;


% CREATING THE DELTA SIGMA MATRIX
del_sig = -sigma.*(Z./ZH - 1);
del_sig(abs(del_sig)==inf) = eps; % replacing inf locations

% CREATING THE MESH
r_foo = linspace(0,a,N);
phi_foo = linspace(0,2*pi,N);
[r_mesh, phi_mesh] = meshgrid(r_foo, phi_foo);
x_mesh = r_mesh.*cos(phi_mesh);
y_mesh = r_mesh.*sin(phi_mesh);

% these XX and YY transformations only go to the top half (+sqrt())
XX = mapX(x_mesh,y_mesh);
YY = mapY(XX);

% creating the actual measurment points X, Y on the boundary for only the
% top half
phi = 0:pi/n:(2*pi-pi/n);
X = a.*cos(phi); edgesX = fliplr(X(1:length(X)/2+1)); 
Y = a.*sin(phi); edgesY = fliplr(Y(1:length(Y)/2+1));

% We check by regions to see if XX is within certain regions (separated by
% the equipotential lines from the mapped x_mesh, y_mesh. This is compare
% to values of our measurement points X and Y. The regions are specified
% such that region 1 = region  from X(pi) - X(15*pi/16), region 2 =
% X(15*pi/16) - X(14*pi/16) and so on. Region 8 is the region from phi
% pi/16 to 0. 
% This only checks the top curve. From this,
% we determin a mapping (a look-up table) from regions 1, 2, ... 8, to
% determine in which equipotential line we exist in. 
% We search down on columns first then to the next row.
lookupX = discretize(XX,edgesX);


% CREATING THE MULTIPLE EXCITATION POINT MAPS
uuu = repmat(lookupX,1,1,k/2);
shift = 1*floor(N/(k)); % number of points to "circshift" the data
uu = lookupX;

%regions 1->8 averaged with the bottom half
avg_del_sig = del_sig(fliplr(1:k/2),:)+del_sig((k/2+1):k,:)/2;
% obtaining the 3d graph for all points for excitation points at phi/16
for ii = 1:n
   for i = 1:length(avg_del_sig)
        uu(lookupX == i) = avg_del_sig(i,ii);
   end
   uuu(:,:,ii) = circshift(uu,shift*(ii-1));
end

% PLOTTING THE FIGURES
titlename = ['Excitation at \phi =  \pi/16'];
figure(1)
for i = 1:n
   subplot(2,4,i)
   surf(x_mesh,y_mesh,uuu(:,:,i))
   view([0 90])
   shading interp
   titlename(22) = num2str(i-1);
   title(titlename)
   xlabel('X');
   ylabel('Y');
end

figure(2)
surf(x_mesh,y_mesh,sum(uuu,3))
title('Location of Tumor')
zlabel('Conductivity Pertubation(\Delta\sigma)')
xlabel('X')
ylabel('Y')
view([0 90])
colormap(parula)
shading interp
colorbar

% To Visualize
% surf(x_mesh,y_mesh,zeros(size(x_mesh)))
% view([0,90])
% figure(2)
% surf(XX,YY,zeros(size(XX)))
% view([0,90])

