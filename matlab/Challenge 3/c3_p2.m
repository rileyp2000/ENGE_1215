%Patrick Riley
%10/10/19
%This is problem 2 of challenge 3

clc 
clear all

%Take the initial and new glucose levels from the user
initial_glucose = input("Please input your initial glucose level (mg/dL): ");
new_glucose = input("Please input your new glucose level (mg/dL): ");

dif = new_glucose - initial_glucose;

%This determines if there was a significant difference in the new glucose level
if abs(dif) >= 8
    %If there is a significant difference, determine if it is a decrease or increase
    if dif > 0
        fprintf("The blood glucose level had a significant increase of " + dif + " mg/dL\n"); 
    else
        fprintf("The blood glucose level had a significant decrease of " + abs(dif) + " mg/dL\n"); 
    end
else
    disp("There was no significant difference in the blood glucose level");
    
end


if new_glucose < 60 
    fprintf("A blood glucose level of " + new_glucose + "mg/dL is too low for exercise.\n");
elseif new_glucose <= 220
    fprintf("A blood glucose level of " + new_glucose + "mg/dL is safe for exercise.\n");
else
    fprintf("A blood glucose level of " + new_glucose + "mg/dL is too high for exercise.\n");
end
