%Patrick Riley
%11/6/19
%This is the final matlab project with the swimsuit datset

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
scatter(1:12,mean(monthly_data));
legend("Monthly Mean Search Result");
hold on
boxplot(monthly_data);

%Graph Labels
xlabel("Month");
ylabel("Search Interest");
title("Monthly Interest Statistics for Term 'Swimsuit'");

hold off


%%Step 3
%TODO: graph one month for all years, make bullshit prediction based on that