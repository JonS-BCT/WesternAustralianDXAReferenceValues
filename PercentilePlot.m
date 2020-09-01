%% This function plots the smoothed percentile lines
% This function is designed to be called from NormativeCurves.m

function PercentilePlot(Percentiles,Ytitle,MAX,MIN,SaveName)

x = (1:5);
xx = (1:0.1:5);

%Cubic spline data interpolation
Curve1 = spline(x,Percentiles(1,:),xx);
Curve2 = spline(x,Percentiles(2,:),xx);
Curve3 = spline(x,Percentiles(3,:),xx);
Curve4 = spline(x,Percentiles(4,:),xx);
Curve5 = spline(x,Percentiles(5,:),xx);

%Plot curves
plot(xx,Curve1,'LineWidth',1,'color','k');
text(5.05,Curve1(1,41),'10th','FontSize',14)
hold on
plot (xx,Curve2,'LineWidth',1,'color','k')
text(5.05,Curve2(1,41),'30th','FontSize',14)
x2 = [xx,fliplr(xx)];
inBetween = [Curve2,fliplr(Curve1)];
fill(x2,inBetween,[0.6    0.95    0.4],'LineStyle','none')

plot (xx,Curve3,'LineWidth',2,'color','k')
text(5.05,Curve3(1,41),'50th','FontSize',14)
inBetween = [Curve3,fliplr(Curve2)];
fill(x2,inBetween,[0.0    0.8    0.0],'LineStyle','none')

plot (xx,Curve4,'LineWidth',1,'color','k')
text(5.05,Curve4(1,41),'70th','FontSize',14)
inBetween = [Curve4,fliplr(Curve3)];
fill(x2,inBetween,[0.0    0.8    0.0],'LineStyle','none')

plot (xx,Curve5,'LineWidth',1,'color','k')
text(5.05,Curve5(1,41),'90th','FontSize',14)
inBetween = [Curve5,fliplr(Curve4)];
fill(x2,inBetween,[0.6    0.95    0.4],'LineStyle','none')

plot (xx,Curve3,'LineWidth',2,'color','k')

% Add markers for median value
plot (1,Curve3(1),'d','MarkerSize',8,'MarkerEdgeColor','k','MarkerFaceColor','k')
plot (2,Curve3(11),'d','MarkerSize',8,'MarkerEdgeColor','k','MarkerFaceColor','k')
plot (3,Curve3(21),'d','MarkerSize',8,'MarkerEdgeColor','k','MarkerFaceColor','k')
plot (4,Curve3(31),'d','MarkerSize',8,'MarkerEdgeColor','k','MarkerFaceColor','k')
plot (5,Curve3(41),'d','MarkerSize',8,'MarkerEdgeColor','k','MarkerFaceColor','k')

ypos = (MAX-MIN)/50+MIN;
line([1.5 1.5],[0 ypos],'color','k')
line([2.5 2.5],[0 ypos],'color','k')
line([3.5 3.5],[0 ypos],'color','k')
line([4.5 4.5],[0 ypos],'color','k')
line([5.5 5.5],[0 ypos],'color','k')

%Add labels
xlabel('Age (years)','FontWeight','Bold','FontSize',18)
% ylabel(Ytitle,'FontWeight','Bold','FontSize',18)
y = ylabel(Ytitle,'FontWeight','Bold','FontSize',18);
set(y,'Units','Normalized','Position',[-0.07,0.3,0])

set(gca,'XTickLabel',str2mat('','18 - 24','','25 - 34','','35 - 44','','45 - 54','','55 - 65'),'fontsize',14)
set(gca,'TickLength',[0 0])
ylim([MIN MAX])
xlim([0.5 5.5])

%Change graph size
set(gcf,'position',[100 100 1800 600])
p = get(gca,'OuterPosition');
set(gca,'OuterPosition',[p(1) p(2) + 0.02 p(3) p(4)])


%Save
saveas(gcf,SaveName)
end