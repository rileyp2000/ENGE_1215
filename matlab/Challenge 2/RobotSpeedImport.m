%Sample Solution: Script to input robot speed data collected in class 5B. The script
%calculates the average motor inputs between 0 and 1, and plots the
%measured speed.

clear all
clc

%beginning of code generated by Import Data Tool
%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: G:\My Drive\ENGE 1215 - Fall 2019\Course Content\Module 2\Week 6A - Input and Output\Robot Data from Class 5B.xlsx
%    Worksheet: Sheet1
%
% Auto-generated by MATLAB on 30-Sep-2019 08:48:04

%% Setup the Import Options
opts = spreadsheetImportOptions("NumVariables", 3);

% Specify sheet and range
opts.Sheet = "Sheet1";
opts.DataRange = "A2:C86";

% Specify column names and types
opts.VariableNames = ["LeftMotor", "RightMotor", "Speedfts"];
opts.SelectedVariableNames = ["LeftMotor", "RightMotor", "Speedfts"];
opts.VariableTypes = ["double", "double", "double"];

% Import the data
tbl = readtable("G:\My Drive\ENGE 1215 - Fall 2019\Course Content\Module 2\Week 6A - Input and Output\Robot Data from Class 5B.xlsx", opts, "UseExcel", false);

%% Convert to output type
LeftMotor = tbl.LeftMotor;
RightMotor = tbl.RightMotor;
Speedfts = tbl.Speedfts;

%% Clear temporary variables
clear opts tbl

%% calculate average motor speed
AvgMotor = abs((LeftMotor+RightMotor)/2);

%end of code generated by Import Data Tool

%% plot and label motor inputs versus robot speed
plot(AvgMotor,Speedfts,'x')
title('Robot Speed vs. Motor Values')
xlabel('Motor Values (0-1)')
ylabel('Estimated Speed (ft/s)')

%% Export average motor values and robot speed to a new Excel file
SpeedData = table(AvgMotor,Speedfts);
filename = 'SpeedSummary.xlsx';
writetable(SpeedData,filename)

