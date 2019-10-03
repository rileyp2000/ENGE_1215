%Patrick Riley
%9/24/19
%This is problem 2 of the Matlab Challenge 1 for ENGE 1215

clc
clear

%Get the dimensions of the cuboid
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
mass_iron = density_iron * vol;

%Mass of gold added
%in kg.m^2
g_mass_area = .0185;
g_mass = g_mass_area * sa;

%Total mass of the cuboid
mass_cuboid = g_mass + mass_iron;


%Calculate total cost
cost_iron = 1.75;
cost_gold = 48000;
total_cost = cost_iron * mass_iron + cost_gold * g_mass;

fprintf("Total mass of the cuboid: " + mass_cuboid + " kg\n")
fprintf("Total cost of the cuboid: $ " + total_cost + "\n")


