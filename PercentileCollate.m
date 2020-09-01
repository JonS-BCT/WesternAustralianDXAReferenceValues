%% This function collates Percentiles for variables, written by Jon Staynor 7th August 2019
% This function is designed to be called from NormativeCurves.m

function [PerWaist PerWHR PerWHtR PerAndroidFat PerAGR PerTotalFat PerFatPercentage PerFMI PerRSMI PerVisceral PerGynoid] = PercentileCollate(Columns,DataAge1,DataAge2,DataAge3,DataAge4,DataAge5);

    %%Waist Circumference Percentiles
    Waist18to24 = cell2mat(DataAge1(:,Columns(1,1)));
    Waist25to34 = cell2mat(DataAge2(:,Columns(1,1)));
    Waist34to44 = cell2mat(DataAge3(:,Columns(1,1)));
    Waist45to54 = cell2mat(DataAge4(:,Columns(1,1)));
    Waist55to65 = cell2mat(DataAge5(:,Columns(1,1)));

    [PerWaist] = PercentileCalc(Waist18to24,Waist25to34,Waist34to44,Waist45to54,Waist55to65);
    
    %WHR Percentiles
    WHR18to24 = cell2mat(DataAge1(:,Columns(1,2)));
    WHR25to34 = cell2mat(DataAge2(:,Columns(1,2)));
    WHR34to44 = cell2mat(DataAge3(:,Columns(1,2)));
    WHR45to54 = cell2mat(DataAge4(:,Columns(1,2)));
    WHR55to65 = cell2mat(DataAge5(:,Columns(1,2)));

    [PerWHR] = PercentileCalc(WHR18to24,WHR25to34,WHR34to44,WHR45to54,WHR55to65);
    
    %WHtR Percentiles
    WHtR18to24 = cell2mat(DataAge1(:,Columns(1,3)));
    WHtR25to34 = cell2mat(DataAge2(:,Columns(1,3)));
    WHtR34to44 = cell2mat(DataAge3(:,Columns(1,3)));
    WHtR45to54 = cell2mat(DataAge4(:,Columns(1,3)));
    WHtR55to65 = cell2mat(DataAge5(:,Columns(1,3)));

    [PerWHtR] = PercentileCalc(WHtR18to24,WHtR25to34,WHtR34to44,WHtR45to54,WHtR55to65);
    
    %Android Percentiles
    Android18to24 = cell2mat(DataAge1(:,Columns(1,4)));
    Android25to34 = cell2mat(DataAge2(:,Columns(1,4)));
    Android34to44 = cell2mat(DataAge3(:,Columns(1,4)));
    Android45to54 = cell2mat(DataAge4(:,Columns(1,4)));
    Android55to65 = cell2mat(DataAge5(:,Columns(1,4)));

    [PerAndroidFat] = PercentileCalc(Android18to24,Android25to34,Android34to44,Android45to54,Android55to65);
    
    %AGR Percentiles
    AGR18to24 = cell2mat(DataAge1(:,Columns(1,5)));
    AGR25to34 = cell2mat(DataAge2(:,Columns(1,5)));
    AGR34to44 = cell2mat(DataAge3(:,Columns(1,5)));
    AGR45to54 = cell2mat(DataAge4(:,Columns(1,5)));
    AGR55to65 = cell2mat(DataAge5(:,Columns(1,5)));

    [PerAGR] = PercentileCalc(AGR18to24,AGR25to34,AGR34to44,AGR45to54,AGR55to65);
    
    %Total Fat Percentiles
    TotalFat18to24 = cell2mat(DataAge1(:,Columns(1,6)));
    TotalFat25to34 = cell2mat(DataAge2(:,Columns(1,6)));
    TotalFat34to44 = cell2mat(DataAge3(:,Columns(1,6)));
    TotalFat45to54 = cell2mat(DataAge4(:,Columns(1,6)));
    TotalFat55to65 = cell2mat(DataAge5(:,Columns(1,6)));

    [PerTotalFat] = PercentileCalc(TotalFat18to24,TotalFat25to34,TotalFat34to44,TotalFat45to54,TotalFat55to65);
    
    %Fat Percentage Percentiles
    FatPercentage18to24 = cell2mat(DataAge1(:,Columns(1,7)));
    FatPercentage25to34 = cell2mat(DataAge2(:,Columns(1,7)));
    FatPercentage34to44 = cell2mat(DataAge3(:,Columns(1,7)));
    FatPercentage45to54 = cell2mat(DataAge4(:,Columns(1,7)));
    FatPercentage55to65 = cell2mat(DataAge5(:,Columns(1,7)));

    [PerFatPercentage] = PercentileCalc(FatPercentage18to24,FatPercentage25to34,FatPercentage34to44,FatPercentage45to54,FatPercentage55to65);
    
    %FMI Percentiles
    FMI18to24 = cell2mat(DataAge1(:,Columns(1,8)));
    FMI25to34 = cell2mat(DataAge2(:,Columns(1,8)));
    FMI34to44 = cell2mat(DataAge3(:,Columns(1,8)));
    FMI45to54 = cell2mat(DataAge4(:,Columns(1,8)));
    FMI55to65 = cell2mat(DataAge5(:,Columns(1,8)));

    [PerFMI] = PercentileCalc(FMI18to24,FMI25to34,FMI34to44,FMI45to54,FMI55to65);
    
    %RSMI Percentiles
    RSMI18to24 = cell2mat(DataAge1(:,Columns(1,9)));
    RSMI25to34 = cell2mat(DataAge2(:,Columns(1,9)));
    RSMI34to44 = cell2mat(DataAge3(:,Columns(1,9)));
    RSMI45to54 = cell2mat(DataAge4(:,Columns(1,9)));
    RSMI55to65 = cell2mat(DataAge5(:,Columns(1,9)));

    [PerRSMI] = PercentileCalc(RSMI18to24,RSMI25to34,RSMI34to44,RSMI45to54,RSMI55to65);
    
    %Visceral Percentiles
    Visceral18to24 = cell2mat(DataAge1(:,Columns(1,10)));
    Visceral25to34 = cell2mat(DataAge2(:,Columns(1,10)));
    Visceral34to44 = cell2mat(DataAge3(:,Columns(1,10)));
    Visceral45to54 = cell2mat(DataAge4(:,Columns(1,10)));
    Visceral55to65 = cell2mat(DataAge5(:,Columns(1,10)));

    [PerVisceral] = PercentileCalc(Visceral18to24,Visceral25to34,Visceral34to44,Visceral45to54,Visceral55to65);

    %Gynoid Percentiles
    Gynoid18to24 = cell2mat(DataAge1(:,Columns(1,11)));
    Gynoid25to34 = cell2mat(DataAge2(:,Columns(1,11)));
    Gynoid34to44 = cell2mat(DataAge3(:,Columns(1,11)));
    Gynoid45to54 = cell2mat(DataAge4(:,Columns(1,11)));
    Gynoid55to65 = cell2mat(DataAge5(:,Columns(1,11)));

    [PerGynoid] = PercentileCalc(Gynoid18to24,Gynoid25to34,Gynoid34to44,Gynoid45to54,Gynoid55to65);
    
end