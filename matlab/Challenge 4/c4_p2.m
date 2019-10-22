%Patrick Riley
%10/22/19
%This is problem 2 of challenge 4, and is the fish sorter

clear;
clc;

%Map the prices of the different grades of fish for easy use
grade = containers.Map({'S','A','B','C','D','N'},{22, 15.6, 6.3, 3.7, 1.2,0});


%Takes in the weights from the user
weights = input("Please input the fish weights from today's haul: ");

%Need:
%Take user input for the weights (kg) of all fish from the haul as a vector
%e.
%Use a loop to tally the total number and total weight of each grade fish in the haul
%f.
%Calculate the total income for each grade of fish. Determine the total income resulting from selling the entire haul
%g.
%Output a detailed invoice including, the total number of each grade of fish, the total weight of each grade of fish, the total income for each grade of fish, and the total income from the entire haul

%Iterates over all the weights inputted to the program from the user

a = [0 0];
b = [0 0];
c = [0 0];
d = [0 0];
s = [0 0];
n = [0 0];

for weight = weights
    fish_grade = '';
    %Determine the grade of the fish based on its weight
    if weight > 30 
        fish_grade = 'S';
    elseif weight > 16
        fish_grade = 'A';
    elseif weight > 8
        fish_grade = 'B';
    elseif weight > 3
        fish_grade = 'C';
    elseif weight >= 1
        fish_grade = 'D';
    else 
        fish_grade = 'N';
    end

end
