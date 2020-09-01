%% This function splits participants into their age cateogories, written by Jon Staynor 18th September 2018
% The function is designed to be called from NormativeCurves.m

function [EighteenToTwentyFour,TwentyFiveToThirtyFour,ThirtyFiveToFourtyFour,FourtyFiveToFiftyFour,FiftyFiveToSixtyFive] = AgeSplit(AgeCol,Data)
   
    Age = sortrows(Data,AgeCol);

    %Find age 18-24
    EighteenToTwentyFourIndex = length(find([Age{:,AgeCol}] <25));  
    EighteenToTwentyFour = Age(1:EighteenToTwentyFourIndex,:);
    
    %Find age 25-34
    TwentyFiveToThirtyFourIndex = find([Age{:,AgeCol}] >=25 & [Age{:,AgeCol}] <35);
    TwentyFiveToThirtyFour = Age(TwentyFiveToThirtyFourIndex(1,1):TwentyFiveToThirtyFourIndex(1,end),:);
    
    %Find age 35-44
    ThirtyFiveToFourtyFourIndex = find([Age{:,AgeCol}] >=35 & [Age{:,AgeCol}] <45);
    ThirtyFiveToFourtyFour = Age(ThirtyFiveToFourtyFourIndex(1,1):ThirtyFiveToFourtyFourIndex(1,end),:);
    
    %Find age 45-54
    FourtyFiveToFiftyFourIndex = find([Age{:,AgeCol}] >=45 & [Age{:,AgeCol}] <55);
    FourtyFiveToFiftyFour = Age(FourtyFiveToFiftyFourIndex(1,1):FourtyFiveToFiftyFourIndex(1,end),:);
    
    %Find age 55-65
    FiftyFiveToSixtyFive = Age(FourtyFiveToFiftyFourIndex(1,end)+1:end,:);
    
end