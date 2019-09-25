%Patrick Riley
%9/24/19
%This is problem 2 of the Matlab Challenge 1 for ENGE 1215

clc
clear

dims = input("Insert the dimensions of cuboid LxWxH: ",'s');
dim = split(dims,"x");

x = str2double(dim(1));
y = str2double(dim(2));
z = str2double(dim(3));

%volume = lxwxh
vol = x * y * z;
%surface area = 2xlxw + 2xlxh + 2xwxh
sa = 2*x*y + 2*x*z + 2*y*z;

%mass = density * vol
density_iron = 7860;
mass = density_iron * vol;



