xy = load('benchmarks/rbx711.tsp');
N = 1;
figure
hold on

for k=1:N
    tic
    [BestTour, Dist, PlotValues, totalTime] = run_sa(xy(:,1), xy(:,2), true);
    toc
    plot(PlotValues)
end

