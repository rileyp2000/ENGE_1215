%Patrick Riley
%10/22/19
%This is problem 2 of challenge 4, and is the fish sorter

clear;
clc;

%Map the prices of the different grades of fish for easy use
grade = containers.Map({'S','A','B','C','D','N'},{22, 15.6, 6.3, 3.7, 1.2,0});


%Takes in the weights from the user
weights = input("Please input the fish weights from today's haul: ");

%This keeps track of the number of fish and total weight of the fish along with the running income
S = [0 0 0];
A = [0 0 0];
B = [0 0 0];
C = [0 0 0];
D = [0 0 0];
N = [0 0 0];

%Loops over each weight, places them into the proper group and adjusts the tracker
for weight = weights
    fish_grade = '';
    %Determine the grade of the fish based on its weight
    if weight > 30 
        fish_grade = 'S';
        S = [(S(1)+1) (S(2)+ weight) (S(3) + grade(fish_grade))];
    elseif weight > 16
        fish_grade = 'A';
        A = [(A(1)+1) (A(2)+weight) (A(3) + grade(fish_grade))];
    elseif weight > 8
        fish_grade = 'B';
        B = [(B(1)+1) (B(2)+weight) (B(3) + grade(fish_grade))];
    elseif weight > 3
        fish_grade = 'C';
        C = [(C(1)+1) (C(2)+weight) (C(3) + grade(fish_grade))];
    elseif weight >= 1
        fish_grade = 'D';
        D = [(D(1)+1) (D(2)+weight) (D(3) + grade(fish_grade))];
    else
        fish_grade = 'N';
        N = [(S(1)+1) (S(2)+weight) (N(3) + grade(fish_grade))];
    end

end

%Prints out an invoice for the whole haul including total income
disp("Detailed invoice of the haul");
total_income = S(3) + A(3) + B(3) + C(3) + D(3) + N(3);

fprintf("Grade S: %i total fish, %d lbs of total weight, $%.2f in total income\n", S(1), S(2), S(3));
fprintf("Grade A: %i total fish, %d lbs of total weight, $%.2f in total income\n", A(1), A(2), A(3));
fprintf("Grade B: %i total fish, %d lbs of total weight, $%.2f in total income\n", B(1), B(2), B(3));
fprintf("Grade C: %i total fish, %d lbs of total weight, $%.2f in total income\n", C(1), C(2), C(3));
fprintf("Grade D: %i total fish, %d lbs of total weight, $%.2f in total income\n", D(1), D(2), D(3));
fprintf("Grade N: %i total fish, %4.2d lbs of total weight, $%.2d in total income\n", N(1), N(2), N(3));


fprintf("Total income from the call: $%.2f\n", total_income);