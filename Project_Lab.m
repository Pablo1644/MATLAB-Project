% Authors - Paweł Wągrodzki Łukasz Sarnacki

clc
clear 
close all

%% 0. Parameters:
lambda = 0.6328;
M = -10;
dx = 3.45/abs(M);
n0 = 1;
ns = 1.45701;
% 1.Extract the field with TPS formulas -> Lab2

objtype = 'phase';

if objtype =='phase'
    folder_name = 'C:\Users\pawel\OneDrive\Dokumenty\2_stopien\2_semestr\Numerical methods in optics\Projekt_Lab\';
    data1 = double(imread([folder_name,'holo1.bmp']));
    data2 = double(imread([folder_name,'holo2.bmp']));
    data3 = double(imread([folder_name,'holo3.bmp']));
    data4 = double(imread([folder_name,'holo4.bmp']));
    data5 = double(imread([folder_name,'holo5.bmp']));
    ph = atan2(2*(data2-data4),(2*data3-data1-data5));
    amp = (1/4)*sqrt(4*(data2-data4).^2 + (2.*data3-data1-data5).^2);
end

u=amp.*exp(1i*ph); % phase case
u1=u;
uin = u1;

% value calculated from autofocusing
uout = PropagatePlaneWaveDecC2DNxNy(uin,113.7,n0,lambda,dx); %% given function 

%% comparing defocused and focused fields

figure
subplot 121
imagesc(abs(uin))
title('Initial amplitude')

subplot 122
f_amp = abs(uout);
imagesc(f_amp)
title('Focused amplitude')


figure
subplot 121
imagesc(ph)
title('Initial phase')

subplot 122

ph_before=angle(uout);
imagesc(ph_before)
title('Focused phase')
colormap gray



%% unwrapping phase
% function TIE_unwrap2DCdct2

ph_1= angle(uout);
figure
unwrapped_1 = TIE_unwrap2DCdct2(ph_1,dx,lambda);
shape = double(imbinarize(unwrapped_1));
for x=1:1:size(unwrapped_1,1)
    for y=1:1:size(unwrapped_1,2)
        if shape(x,y)==1
            shape(x,y)=unwrapped_1(x,y);
        end
    end
end

unwrapped_1=shape;

subplot 121
colormap gray
imagesc(shape)
title('Unwrapped phase')


%% Circle detection 
figure
subplot 111
colormap gray
imagesc(unwrapped_1)
[centers, radii, metric] = imfindcircles(unwrapped_1,[38 300]);
viscircles(centers, radii,'LineStyle','--');


%% Analyzed lens
figure
colormap gray
subplot 121
xlabel ('X Pixels')
ylabel('Y Pixels')

unwrapped_2 = unwrapped_1(262:605,363:707);
imagesc(unwrapped_2)

%% Analyzed part of lens
figure 
phase_values = unwrapped_2(164,50:284);
x = 0.35*linspace(0,size(phase_values,2),size(phase_values,2));
plot(x,phase_values)
xlabel('X [um]')
ylabel('Phase [rad]')
title('Height calculation from phase')
h = max (phase_values)*lambda/(2*pi*(ns-1));


%% Analyze of other lenses
x = 0.35*linspace(0,size(unwrapped_1,2),size(unwrapped_1,2));
y = unwrapped_1(108,1:end);
figure
plot(x,y)
xlabel('X [um]')
ylabel('Phase [rad]')
title('Phase of row of lenses')

h_max= max(max(unwrapped_1));

