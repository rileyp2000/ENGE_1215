%Patrick Riley
%9/30/19
%This is problem 3 of the Matlab Challenge 1 for ENGE 1215

clc
clear

%Save the number of classes
num_classes = 5;
%Creates a map of alphabetical grades to their numerical equivalent
grade_map = containers.Map({'A','B','C','D','F'},{4,3,2,1,0});

total_gpa = 0;
hours = 0;


%Get the user's class hours and grades
for c = 1:num_classes 
   hour = input("Please enter the number of credit hours for class " + c + ": ");
   grade = upper(char(input("Please enter the alphabetical (A-F) grade for class " + c + ": ","s")));
   
   %Adds to the total hours and the running numerator for the final
   %calculation
   hours = hours + hour;
   total_gpa = total_gpa + (grade_map(grade) * hour);
end

%Calculates Semester GPA using the given formula
total_gpa = total_gpa / hours;

fprintf("Your GPA for this semester is: " + total_gpa + "\n")

