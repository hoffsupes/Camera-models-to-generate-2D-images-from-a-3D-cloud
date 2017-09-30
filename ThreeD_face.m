clc;
clear all;
close all;

load('CV1_data.mat');

L(:,:,1) = [0,0,-1];
L(:,:,2) = [0.5774,- 0.5774,- 0.5774];
T = [-14; -71; 1000];
R(:,:,1) = eye(3);
R(:,:,2) = [0.9848 , 0 , 0.1736 ; 0 , 1 , 0 ; -0.1736 ,0 , 0.9848];
alpha = 0; beta = 1; p = 1; d = 3;
c0 = 50; r0 = 50;
sx = 8; sy = 8;
f(1) = 40;
f(2) = 30;

N = [Nx, Ny, Nz]';
XW = [X, Y, Z]';
Ns = size(XW,2);
% Tt = repmat(T,[1,Ns]);

for i = 1:8

[I,J,K] = get_indice(i);
Nn = R(:,:,I) * N;
Ln = R(:,:,I) * L(:,:,J)';

[C,lam,P] = get_pixel(R(:,:,I),XW,T,sx,sy,c0,r0,Ns,f(K));
[Cortho,lambda,Portho] = get_pixel_ortho(R(:,:,I),XW,T,sx,sy,c0,r0,Ns,f(K));
[Cweak,Pweak] = get_pixel_weak(R(:,:,I),XW,T,sx,sy,c0,r0,Ns,f(K),lambda);

CNN = zeros(500,500);
Cw = get_pixel_list(CNN);
Il = get_intensity(Nn,Ln,beta,d,p,f(K),alpha);

% cval = get_3D_weak(R(:,:,I),XW,T,sx,sy,c0,r0,f(K),Cw,Il,lambda);
% Img = get_image_new(cval,Cw,I,J,K,'Weak',CNN);
% cval = get_3D_ortho(R(:,:,I),XW,T,sx,sy,c0,r0,f(K),Cw,Il,lambda);
% Img = get_image_new(cval,Cw,I,J,K,'Weak',CNN);
% Cl = scal * C;

sc = [1 0 -10; 0 1 -10; 0 0 1];
C = round(sc * C);
Cweak = round(sc * Cweak);
% ImgF = get_image(Il,C,I,J,K,'Full');
% ImgW = get_image(Il,Cweak,I,J,K,'Weak');

% scal = [0.25 0 253; 0 0.25 250; 0 0 1];
% Cortho = round(scal * Cortho);
ImgO = get_image_ortho(Il,Cortho,I,J,K,'Ortho',3,2,30);

end
