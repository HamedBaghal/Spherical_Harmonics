clear;
clc;

k = 2;

% ---- sphere grid ----
theta = linspace(0, 2*pi, 50);
phi   = linspace(0, pi, 50);
[theta, phi] = meshgrid(theta, phi);

x = sin(phi).*cos(theta);
y = sin(phi).*sin(theta);
z = cos(phi);
Point1=[0.7151    0.6561    0.2412];
Psi1 = zeros(size(x));

for j = 1:5
    dotp = Point1(1)*x + Point1(2)*y + Point1(3)*z;
    Psi1 = Psi1 + (2*k+1)*legendreP(k, dotp);
end

% ---- plot ----
figure;
surf(x, y, z, Psi1, 'FaceColor','interp', 'EdgeColor','none');
axis square tight on;
colormap(gray);
colorbar;

title('Spherical Harmonics', 'FontSize',20);

set(gca,'box','off');
xlabel('x'); ylabel('y'); zlabel('z');


% ---- directions (eta_j) ----
Points = [
     0.7476    0.2287   -0.6236
     0.0005   -0.8343    0.5514
     0.7151    0.6561    0.2412
     0.2534   -0.0009    0.9674
    -0.9045    0.2874   -0.3150
];

coeffs = [0.3923, 0.2354, 2.4142, 0.2365, 0.3925];

% ---- scalar zonal combination ----
Psi11 = zeros(size(x));

for j = 1:5
    dotp = Points(j,1)*x + Points(j,2)*y + Points(j,3)*z;
    Psi11 = Psi11 + coeffs(j) * legendreP(k, dotp);
end

% ---- plot ----
figure;
surf(x, y, z, Psi11, 'FaceColor','interp', 'EdgeColor','none');
axis square tight on;
colormap(gray);
colorbar;

title( 'Spherical Pseudo Zonal Harmonics', 'FontSize',20);

set(gca,'box','off');
xlabel('x'); ylabel('y'); zlabel('z');

 