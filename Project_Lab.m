% Paweł Wągrodzki Łukasz Sarnacki
% Parameters to calculate:


% 0. Simulation parameters:
lambda = 0.6328;
M = -10;
dx = 3.45;
n0 = 1;
% 1.Extract the field with TPS formulas -> Lab2

objtype = 'phase';

if objtype =='phase'
    folder_name = 'C:\Users\pawel\OneDrive\Dokumenty\2_stopien\2_semestr\Numerical methods in optics\Projekt_Lab';
    data1 = double(imread([folder_name,'holo1.bmp']));
    data2 = double(imread([folder_name,'holo2.bmp']));
    data3 = double(imread([folder_name,'holo3.bmp']));
    data4 = double(imread([folder_name,'holo4.bmp']));
    data5 = double(imread([folder_name,'holo5.bmp']));
    ph = atan2(2*(data2-data4),(2*data3-data1-data5));
    amp = (1/4)*sqrt(4*(data2-data4).^2 + (2.*data3-data1-data5).^2);
end
if objtype =='amplitude'
    folder_name = 'C:\Users\pawel\OneDrive\Dokumenty\2 stopien\2 semestr\Numerical methods in optics\lab2\autofocusing lab\';
    data = double(imread([folder_name,'amp.bmp']));
end    
