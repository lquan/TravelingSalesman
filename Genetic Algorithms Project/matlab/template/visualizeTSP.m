function visualizeTSP(X,Y, Path, TotalDist, ...
                        ah1, gen, best, mean_fits, worst, ...
                        ah2, ObjV, NIND, ah3, update)
                    
    plot(ah1, [X(Path); X(Path(1))], [Y(Path); Y(Path(1))], 'ko-');
    title(ah1, ['Best TSP length: ' num2str(TotalDist)]);

    plot(ah2, 0:gen, best(1:gen+1),'r-', ...
                 0:gen, mean_fits(1:gen+1),'b-', ...
                 0:gen, worst(1:gen+1),'g-');
    xlabel(ah2,'Generation');
    ylabel(ah2,'Distance (Min. - Avg. - Max.)');       
    
        
    hist(ah3, ObjV);
    title(ah3, 'Histogram');
    xlabel(ah3,'Distance');
    ylabel(ah3,'Number');
    set(ah3,'Ylim',[0 NIND]);
    
    if (update)
        drawnow;
    end
end