%Patrick Riley
%9/24/19
%This is problem 1 of the Matlab Challenge 1 for ENGE 1215

clc
clear

%These are the conversion factors for each of the units to meters
cubit = .457;
feet = 3.281;

%Gets the measurement in cubits
cubits = input("Please input the measurement in Ancient Roman Cubits: ");

%Calculates the measurements in meters and feet using the conversion factor
measure_meter = cubits * cubit;
measure_feet = cubits * feet;

fprintf(cubits + " cubits in meters is: " + measure_meter + "\n")
fprintf(cubits + " cubits in feet is: " + measure_feet + "\n")
