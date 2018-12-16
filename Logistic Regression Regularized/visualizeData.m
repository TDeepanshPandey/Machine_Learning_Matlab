% function to plot data values
function visualizeData(X,Y)
figure;
hold on;
pos = find(Y == 1)
neg = find(Y == 0)
plot(X(pos,1),X(pos,2),'k+','Linewidth',3,'MarkerSize',6);
plot(X(neg,1),X(neg,2),'ko','MarkerFaceColor','g','MarkerSize',6);
end