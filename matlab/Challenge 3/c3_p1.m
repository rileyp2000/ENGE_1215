%Patrick Riley
%10/10
%This is problem 1 of challenge 3

clc 
clear all

%Store the methane levels from the user
methane = input("Please insert the methane level in ppm: ");

vent_rate = 0;

%Determine the ventilation rate of the system based on the methane level given from chart
if methane < 5000
    vent_rate = 6;
    
elseif methane < 20000
    vent_rate = 12;
    
elseif methane < 30000
    vent_rate = 24;
    
elseif methane < 50000
    vent_rate = 48;
    
else 
    %Displays a warning is the levels are above a certain concentration
    vent_rate = 96;
    disp("WARNING WARNING METHANE LEVELS DANGEROUSLY HIGH. EXPLOSION RISK");
    
end

fprintf("The current ventilation rate is " + vent_rate + " ppm.\n");

