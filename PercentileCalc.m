%% This function calculates percentiles, written by Jon Staynor 7th August 2019
% This function is designed to be called from PercentileCollate.m

function [Percentiles] = PercentileCalc(DataAge1,DataAge2,DataAge3,DataAge4,DataAge5);
% Percentile can be manually adjusted.

    %18-24
    Percentiles(1,1) = prctile(DataAge1,10); %10th Percentile
    Percentiles(2,1) = prctile(DataAge1,30); %30th Percentile
    Percentiles(3,1) = prctile(DataAge1,50); %50th Percentile
    Percentiles(4,1) = prctile(DataAge1,70); %70th Percentile
    Percentiles(5,1) = prctile(DataAge1,90); %90th Percentile
    
    %25-34
    Percentiles(1,2) = prctile(DataAge2,10); %10th Percentile
    Percentiles(2,2) = prctile(DataAge2,30); %30th Percentile
    Percentiles(3,2) = prctile(DataAge2,50); %50th Percentile
    Percentiles(4,2) = prctile(DataAge2,70); %70th Percentile
    Percentiles(5,2) = prctile(DataAge2,90); %90th Percentile
    
    %35-44
    Percentiles(1,3) = prctile(DataAge3,10); %10th Percentile
    Percentiles(2,3) = prctile(DataAge3,30); %30th Percentile
    Percentiles(3,3) = prctile(DataAge3,50); %50th Percentile
    Percentiles(4,3) = prctile(DataAge3,70); %70th Percentile
    Percentiles(5,3) = prctile(DataAge3,90); %90th Percentile
    
    %45-54
    Percentiles(1,4) = prctile(DataAge4,10); %10th Percentile
    Percentiles(2,4) = prctile(DataAge4,30); %30th Percentile
    Percentiles(3,4) = prctile(DataAge4,50); %50th Percentile
    Percentiles(4,4) = prctile(DataAge4,70); %70th Percentile
    Percentiles(5,4) = prctile(DataAge4,90); %90th Percentile
    
    %55-65
    Percentiles(1,5) = prctile(DataAge5,10); %10th Percentile
    Percentiles(2,5) = prctile(DataAge5,30); %30th Percentile
    Percentiles(3,5) = prctile(DataAge5,50); %50th Percentile
    Percentiles(4,5) = prctile(DataAge5,70); %70th Percentile
    Percentiles(5,5) = prctile(DataAge5,90); %90th Percentile
    
end