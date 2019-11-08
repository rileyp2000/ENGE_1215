%Patrick Riley
%11/6/19
%This is the final matlab project with the swimsuit datset

clear 
clc

% Import data from text file (Taken from the matlab import data functionality)

%% Setup the Import Options
opts = delimitedTextImportOptions("NumVariables", 3);
% Specify range and delimiter
opts.DataLines = [2, Inf];
opts.Delimiter = ",";
% Specify column names and types
opts.VariableNames = ["Year", "Month", "SearchInterest"];
opts.VariableTypes = ["double", "double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
% Import the data
swimsuit_searches = readtable("/swimsuit.csv", opts);
%% Clear temporary variables
clear opts

disp("Data Loaded");

%This part of the program tracks the searches by month and creates a matrix to represent that data
monthly_data = zeros(16,12);
for month = 1:12
    %Takes all the results for that month
    r = find(swimsuit_searches.Month == month);
    monthly_searches = swimsuit_searches(r,:);

    %Make sure each month has the same size to keep the matrix properly shaped
    if length(monthly_searches.SearchInterest) == 16
        monthly_data(:,month) = monthly_searches.SearchInterest;
    else
        %Fills the rest of the matrix with the mean value if there are not enough values
        temp = monthly_searches.SearchInterest;
        while length(temp) < 16
            temp(length(temp) + 1) = mean(monthly_searches.SearchInterest);
        end
        monthly_data(:, month) = temp;
    end
end

%Plot the mean of each month on the graph along with a box and whisker plot for that data
scatter(1:12, mean(monthly_data));
legend("Monthly Mean Search Result");
hold on
boxplot(monthly_data);

%Graph Labels
xlabel("Month");
ylabel("Search Interest");
title("Monthly Interest Statistics for Term 'Swimsuit'");

hold off


%%Step 3
%TODO: graph one month for all years, make prediction based on that
months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
mon = input("Please input the month you are interested in looking at (i.e. 'january'): ", "s");
range = input("How many years backward would you like to look? ");

for i = 1:12
    if strcmpi(months(i), mon) == 1
        mon = i;
    end
end

%Gets all values for the month in in the specified range
r = find(swimsuit_searches.Month == mon);
monthly_searches = swimsuit_searches(r,:);
r = find(monthly_searches.Year > (2019-range));
monthly_searches = monthly_searches(r,:);

%Creates a LOBF for the searches in the month over the range
x = monthly_searches.Year;
y = monthly_searches.SearchInterest;
trends = polyfit(x,y, 1);


%Determines the trend in the data over the range based on how steep the slope of the LOBF is
direction = "";
severity = "";
if trends(1) >= 0
    direction = "up";
else
    direction = "down";
end
if abs(trends(1)) >= 1
    severity = "significantly";
else
    severity = "a little";
end

fprintf("Over the last %i years, the general trend of search results in %s has gone %s %s\n", range, months(mon), direction, severity);

%Logical conditionals to get the most recent search interst for the month
m = swimsuit_searches.Month == mon;  
yr = swimsuit_searches.Year == 2019;
a = m == yr;                        
b = m == 1;

%Prints out the most recent number for the search frequency of the month requested
fprintf("Search result frequency for %s of 2019: %i\n", months(mon), swimsuit_searches.SearchInterest(a & b));


%Plots a graph of the search interest for the month in quesiton by year
figure
plot(x, y);
xlabel("Year");
ylabel("Search Interest");
tit = sprintf("Yearly search interest for 'swimsuit' in %s",months(mon));
title(tit);