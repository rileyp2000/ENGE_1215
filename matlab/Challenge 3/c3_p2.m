%Patrick Riley
%10/10/19
%This is problem 2 of challenge 3

clc 
clear all

initial_glucose = input("Please input your initial glucose level: ");
new_glucose = input("Please input your new glucose level: ");

diff = new_glucose - initial_glucose;

if abs(diff) >= 8
    %Significant difference
    if diff > 0
        fprintf("The blood glucose level had a significant increase of " + diff + " mg/dL\n"); 
    else
        fprintf("The blood glucose level had a significant decrease of " + abs(diff) + " mg/dL\n"); 
    end
else
    disp("There was no significant difference in the blood glucose level");
    
end


if new_glucose < 60 
   fprintf("A blood glucose level of " + new_glucose + "mg/dL is too low for exercise.\n");
elseif new_glucose >= 220
    fprintf("A blood glucose level of " + new_glucose + "mg/dL is safe for exercise.\n");
else
    fprintf("A blood glucose level of " + new_glucose + "mg/dL is too high for exercise.\n");
end
