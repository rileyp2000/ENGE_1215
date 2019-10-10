%Patrick Riley
%10/3/19
%This is problem 1 of challenge 2

clc
clear all

%Gets the batch size from the user
batch_size = input("Please insert a batch size in KG: ");

%Sets the time constraint of the program
time = transpose([1:45]);

%Calculates the rate for each substance according to the given formula
substance_1_rate = 45 ./ (time + 1);
substance_2_rate = (batch_size + 5).*(time + 1) / 200;


output_table = table(time, substance_1_rate, substance_2_rate);
fn = "rileyp_SubstanceRates.xlsx";
writetable(output_table, fn);
fprintf("A spreadsheet has been created with your information with the filename: \n" + pwd + fn + "\n");


