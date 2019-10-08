%Patrick Riley
%10/8/19
%This is challenge 2 problem 2 for ENGE 1215

clear all
clc

% ****
% Loads in spreadsheet data
% ****

opts = delimitedTextImportOptions("NumVariables", 2);

% Specify range and delimiter
opts.DataLines = [1, Inf];
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["VarName1", "VarName2"];
opts.VariableTypes = ["double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
%Column 1: Time in minutes on phone
%Columns 2: Grade earned for that activity or class
phonetime1 = readtable("/home/rileyp/Documents/github/ENGE_1215/matlab/Challenge 2/phonetime-1.csv", opts);

phone_time = phonetime1.VarName1;
grade_earned = phonetime1.VarName2;

clear opts



% ****
% Draws a plot and then creates a line of best fit to show on the graph
% ****

%Creates the scatterplot with filled in circles
s = scatter(phone_time, grade_earned, 'filled');

%Adds a title and labels to the x and y axes 
title("Graph Time on Phone vs Grade Earned");
xlabel("Time on Phone (min)");
ylabel("Grade Earned");

%Retains the old plot for the new curve of best fit plot
hold on 

%Uses polyfit to create a best fit curve
line = polyfit(phone_time, grade_earned, 1);
%Creates points to display the line of best fit
x = linspace(0,60);
y = polyval(line, x);
%Plots the curve of best fit
plot(x,y,'r');

fprintf("The line of best fit for this data is y = %.3fx + %.3f, \n \twhere x is the number of minutes on your phone and y is the grade received for that assignment\n", line);

hold off 


