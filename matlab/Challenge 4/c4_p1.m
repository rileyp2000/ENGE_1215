%Patrick Riley
%10/22/19
%This is problem 1 of challenge 4, at deals with gathering signatures for a petition

clear;
clc;

signature_total = 0;
goal = 1200;
final_day = 0;
days = 10;

while signature_total < goal 
    final_day = input("What day of the campaign is it? ");
    daily_sig = input("How many signatures did you collect for day " + final_day + "? ");
    signature_total = signature_total + daily_sig;
    fprintf("On day %i you collected %i signatures", final_day, daily_sig);
end

fprintf("You met your goal of %i signatures in %i days by getting %i signatures in %i days.\n", goal, days, signature_total, final_day);