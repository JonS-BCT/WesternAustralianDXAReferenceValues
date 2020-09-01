%% Clear Matlab workspace
clear all
close all
clc

%% Access Data
% Data needs to be in a .xlsx file with the following columns of data (see
% column names in code below): Gender, Age, Waist circumference, WHR,
% WHtR,android fat mass, AGR, total fat mass, percent body fat, FMI, RSMI,
% Visceral fat mass & gynoid fat mass.

[Filename Pathname] = uigetfile('*.xlsx');
ExcelFile = strcat(Pathname,Filename);
[numbers text both] = xlsread(ExcelFile);
data = both(2:end,:);

%%Split by gender(sex)
IndexGender = strfind(text(1,:),'T_Gender');
GenderCol = find(not(cellfun('isempty', IndexGender)));
SortGender = sortrows(data,GenderCol);

IndexMale = strfind(SortGender(:,GenderCol),'Male');
MaleRows = find(cellfun('isempty',IndexMale),2,'last') + 1;
FemaleData = SortGender(1:MaleRows(1,1),:);
MaleData = SortGender(MaleRows(2,1):end,:);

%% Split Data by age categories
IndexAge = strfind(text(1,:),'T_Age');
AgeCol = find(not(cellfun('isempty',IndexAge)));

SortMaleData = sortrows(MaleData,AgeCol);
SortFemaleData = sortrows(FemaleData,AgeCol);

%Run AgeSplit function to sort into pre-defined age groups
[Male18to24 Male25to34 Male35to44 Male45to54 Male55to65] = AgeSplit(AgeCol,MaleData);

[Female18to24 Female25to34 Female35to44 Female45to54 Female55to65] = AgeSplit(AgeCol,FemaleData);

%% Percentiles for each gender x age category

%Find Columns for Anthropometry and Body Composition Variables in Data
IndexWaist = strfind(text(1,:),'Waist');
Columns(1,1) = find(not(cellfun('isempty', IndexWaist)));

IndexWHR = strfind(text(1,:),'WHR');
Columns(1,2) = find(not(cellfun('isempty', IndexWHR)));

IndexWHtR = strfind(text(1,:),'WHtR');
Columns(1,3) = find(not(cellfun('isempty', IndexWHtR)));

IndexAndroidFat = strfind(text(1,:),'Fat Mass - Android');
Columns(1,4) = find(not(cellfun('isempty', IndexAndroidFat)));

IndexAGR = strfind(text(1,:),'AGR');
Columns(1,5) = find(not(cellfun('isempty', IndexAGR)));

IndexTotalFat = strfind(text(1,:),'Fat Mass - Total');
Columns(1,6) = find(not(cellfun('isempty', IndexTotalFat)));

IndexFatPercentage = strfind(text(1,:),'PercentFat');
Columns(1,7) = find(not(cellfun('isempty', IndexFatPercentage)));

IndexFMI = strfind(text(1,:),'FMI');
Columns(1,8) = find(not(cellfun('isempty', IndexFMI)));

IndexRSMI = strfind(text(1,:),'RSMI');
Columns(1,9) = find(not(cellfun('isempty', IndexRSMI)));

IndexVisceral = strfind(text(1,:),'VAT Mass');
Columns(1,10) = find(not(cellfun('isempty', IndexVisceral)));

IndexGynoid = strfind(text(1,:),'Fat Mass - Gynoid');
Columns(1,11) = find(not(cellfun('isempty',IndexGynoid)));

[MPerWaist MPerWHR MPerWHtR MPerAndroidFat MPerAGR MPerTotalFat MPerFatPercentage MPerFMI MPerRSMI MPerVisceral MPerGynoidFat] = PercentileCollate(Columns,Male18to24,Male25to34,Male35to44,Male45to54,Male55to65);
[FPerWaist FPerWHR FPerWHtR FPerAndroidFat FPerAGR FPerTotalFat FPerFatPercentage FPerFMI FPerRSMI FPerVisceral FPerGynoidFat] = PercentileCollate(Columns,Female18to24,Female25to34,Female35to44,Female45to54,Female55to65);

%Convert g to kg and decimal to %
MPerTotalFat = MPerTotalFat/1000;
FPerTotalFat = FPerTotalFat/1000;
MPerAndroidFat = MPerAndroidFat/1000;
FPerAndroidFat = FPerAndroidFat/1000;
MPerVisceral = MPerVisceral/1000;
FPerVisceral = FPerVisceral/1000;
MPerFatPercentage = MPerFatPercentage*100;
FPerFatPercentage = FPerFatPercentage*100;
MPerGynoidFat = MPerGynoidFat/1000;
FPerGynoidFat = FPerGynoidFat/1000;

%% Plot Normative Graphs
% Max and Min are manually adjusted to create desired y-axis range

% Plot Waist Circumference

Ytitle = 'Waist circumference (cm)';

MaleMax = 120;
MaleMin = 50;
if MaleMin < 0
    MaleMin = 0;
end

FemaleMax = 120;
FemaleMin = 50;
if FemaleMin < 0
    FemaleMin = 0;
end

MaleSaveName = 'MaleWaistCircumference.png';
FemaleSaveName = 'FemaleWaistCircumference.png';

PercentilePlot(MPerWaist,Ytitle,MaleMax,MaleMin,MaleSaveName)
close
PercentilePlot(FPerWaist,Ytitle,FemaleMax,FemaleMin,FemaleSaveName)
close

% Plot WHR
Ytitle = 'Waist-hip ratio';

MaleMax = 1.20;
MaleMin = 0.60;
if MaleMin < 0
    MaleMin = 0;
end

FemaleMax = ceil(max(FPerWHR(:))*100)/100+0.05;
FemaleMin = floor(min(FPerWHR(:))*100)/100-0.05;
if FemaleMin < 0
    FemaleMin = 0;
end

MaleSaveName = 'MaleWHR.png';
FemaleSaveName = 'FemaleWHR.png';

PercentilePlot(MPerWHR,Ytitle,MaleMax,MaleMin,MaleSaveName)
close
PercentilePlot(FPerWHR,Ytitle,FemaleMax,FemaleMin,FemaleSaveName)
close

% Plot WHtR
Ytitle = 'Waist-height ratio';

MaleMax = 0.70;
MaleMin = 0.30;
if MaleMin < 0
    MaleMin = 0;
end

FemaleMax = 0.70;
FemaleMin = 0.30;
if FemaleMin < 0
    FemaleMin = 0;
end

MaleSaveName = 'MaleWHtR.png';
FemaleSaveName = 'FemaleWHtR.png';

PercentilePlot(MPerWHtR,Ytitle,MaleMax,MaleMin,MaleSaveName)
close
PercentilePlot(FPerWHtR,Ytitle,FemaleMax,FemaleMin,FemaleSaveName)
close

% Plot Android Fat
Ytitle = 'Android fat (kg)';

MaleMax = 3;
MaleMin = 0;
if MaleMin < 0
    MaleMin = 0;
end

FemaleMax = 3;
FemaleMin = 0;
if FemaleMin < 0
    FemaleMin = 0;
end

MaleSaveName = 'MaleAbdominalFat.png';
FemaleSaveName = 'FemaleAbdominalFat.png';

PercentilePlot(MPerAndroidFat,Ytitle,MaleMax,MaleMin,MaleSaveName)
close
PercentilePlot(FPerAndroidFat,Ytitle,FemaleMax,FemaleMin,FemaleSaveName)
close

% Plot AGR
Ytitle = 'Android-gynoid ratio';

MaleMax = 1.2;
MaleMin = 0;
if MaleMin < 0
    MaleMin = 0;
end

FemaleMax = 0.6;
FemaleMin = 0;
if FemaleMin < 0
    FemaleMin = 0;
end

MaleSaveName = 'MaleAGR.png';
FemaleSaveName = 'FemaleAGR.png';

PercentilePlot(MPerAGR,Ytitle,MaleMax,MaleMin,MaleSaveName)
close
PercentilePlot(FPerAGR,Ytitle,FemaleMax,FemaleMin,FemaleSaveName)
close

% Plot Total Fat
Ytitle = 'Total Fat (kg)';

MaleMax = ceil(max(MPerTotalFat(:))/10)*10;
MaleMin = floor(min(MPerTotalFat(:))/10)*10;
if MaleMin < 0
    MaleMin = 0;
end

FemaleMax = ceil(max(FPerTotalFat(:))/10)*10;
FemaleMin = floor(min(FPerTotalFat(:))/10)*10-5;
if FemaleMin < 0
    FemaleMin = 0;
end

MaleSaveName = 'MaleTotalFat.png';
FemaleSaveName = 'FemaleTotalFat.png';

PercentilePlot(MPerTotalFat,Ytitle,MaleMax,MaleMin,MaleSaveName)
close
PercentilePlot(FPerTotalFat,Ytitle,FemaleMax,FemaleMin,FemaleSaveName)
close

% Plot Fat Percentage
Ytitle = 'Fat percentage (%)';

MaleMax = 40;
MaleMin = 0;
if MaleMin < 0
    MaleMin = 0;
end

FemaleMax = 50;
FemaleMin = 10;
if FemaleMin < 0
    FemaleMin = 0;
end

MaleSaveName = 'MaleFatPercentage.png';
FemaleSaveName = 'FemaleFatPercentage.png';

PercentilePlot(MPerFatPercentage,Ytitle,MaleMax,MaleMin,MaleSaveName)
close
PercentilePlot(FPerFatPercentage,Ytitle,FemaleMax,FemaleMin,FemaleSaveName)
close

% Plot FMI
Ytitle = 'Fat mass index (kg/m^2)';

MaleMax = 15;
MaleMin = 0;
if MaleMin < 0
    MaleMin = 0;
end

FemaleMax = 15;
FemaleMin = 0;
if FemaleMin < 0
    FemaleMin = 0;
end

MaleSaveName = 'MaleFMI.png';
FemaleSaveName = 'FemaleFMI.png';

PercentilePlot(MPerFMI,Ytitle,MaleMax,MaleMin,MaleSaveName)
close
PercentilePlot(FPerFMI,Ytitle,FemaleMax,FemaleMin,FemaleSaveName)
close

% Plot RSMI
Ytitle = 'Relative skeletal mass index (kg/m^2)';

MaleMax = ceil(max(MPerRSMI(:)));
MaleMin = floor(min(MPerRSMI(:)));
if MaleMin < 0
    MaleMin = 0;
end

FemaleMax = ceil(max(FPerRSMI(:)));
FemaleMin = floor(min(FPerRSMI(:)));
if FemaleMin < 0
    FemaleMin = 0;
end

MaleSaveName = 'MaleRSMI.png';
FemaleSaveName = 'FemaleRSMI.png';

PercentilePlot(MPerRSMI,Ytitle,MaleMax,MaleMin,MaleSaveName)
close
PercentilePlot(FPerRSMI,Ytitle,FemaleMax,FemaleMin,FemaleSaveName)
close


% Plot Visceral Fat
Ytitle = 'Visceral fat (kg)';

MaleMax = 3;
MaleMin = 0;
if MaleMin < 0
    MaleMin = 0;
end

FemaleMax = 1.5;
FemaleMin = 0;
if FemaleMin < 0
    FemaleMin = 0;
end

MaleSaveName = 'MaleVisceralFat.png';
FemaleSaveName = 'FemaleVisceralFat.png';

PercentilePlot(MPerVisceral,Ytitle,MaleMax,MaleMin,MaleSaveName)
close
PercentilePlot(FPerVisceral,Ytitle,FemaleMax,FemaleMin,FemaleSaveName)
close

% Plot Gynoid Fat
Ytitle = 'Gynoid fat (kg)';

MaleMax = 6;
MaleMin = 0;
if MaleMin < 0
    MaleMin = 0;
end

FemaleMax = 7;
FemaleMin = 0;
if FemaleMin < 0
    FemaleMin = 0;
end

MaleSaveName = 'MaleGynoidFat.png';
FemaleSaveName = 'FemaleGynoidFat.png';

PercentilePlot(MPerGynoidFat,Ytitle,MaleMax,MaleMin,MaleSaveName)
close
PercentilePlot(FPerGynoidFat,Ytitle,FemaleMax,FemaleMin,FemaleSaveName)
close