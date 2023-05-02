
% Output Fcn
als_end=evalin('base','als_end');
% set(handles.alsframe,'background',[0.831 0.816 0.784]);
app = als_res_App;

if als_end == 0; % Continue Iterations
    conc=evalin('base','cx_plot');
    abss=evalin('base','sx_plot');
    nit=evalin('base','niter_plot');
    sstd=evalin('base','sstd_plot');
    change=evalin('base','change_plot');

    axes(app.concen);

    [xi,yi]=size(conc);
    maxim=max(max(conc));
    minim=min(min(conc));

    if maxim > 0
        maxim1=maxim+0.2*maxim;
    else
        maxim1=maxim-0.2*abs(maxim)
    end

    if minim > 0
        minim1=minim+0.2*minim;
    else
        minim1=minim-0.2*abs(minim);
    end

    plot(conc);axis([1 xi minim1 maxim1])

    title('Concentration profiles');

    axes(app.spec);

    [xi,yi]=size(abss);
    maxim=max(max(abss));
    minim=min(min(abss));

    if maxim > 0
        maxim1=maxim+0.2*maxim;
    else
        maxim1=maxim-0.2*abs(maxim);
    end

    if minim > 0
        minim1=minim-0.2*minim;
    else
        minim1=minim-0.2*abs(minim);
    end

    if (minim == 0 & maxim == 0)
        minim1=minim-1;
        maxim1=maxim+1;
    end

    plot(abss');axis([1 yi minim1 maxim1])
    title('Spectra');

    nit=char(['Iteration Nr.  ',num2str(niter)]);
    set(app.als_iter,'Text',nit,'background',[0.831 0.816 0.784]);
%     app.als_iter.Text.


    if change < 0.0
        set(app.als_fit,'Text','FITTING IS NOT IMPROVING','background',[0.831 0.816 0.784])
    else
        set(app.als_fit,'Text','FITTING IS IMPROVING','background',[0.831 0.816 0.784]);
    end

    changes=char(['Change in sigma (%) = ',num2str(change)]);
    set(app.als_change,'Text',changes,'background',[0.831 0.816 0.784]);

    fit_pca=char(['Fitting error (lack of fit, lof) in % (PCA) = ', num2str(sstd(1))]);
    set(app.als_fitpca,'Text',fit_pca,'background',[0.831 0.816 0.784]);

    fit_exp=char(['Fitting error (lack of fit, lof) in % (exp) = ', num2str(sstd(2))]);
    set(app.als_fitexp,'Text',fit_exp,'background',[0.831 0.816 0.784]);

    pause(.3);

    % *************************************************************************

elseif als_end == 1 % Converged
    %     bool = 0;

    set(app.als_fit,'Text','CONVERGENCE IS ACHIEVED!!!','background',[0.831 0.816 0.784])
%     set(app.alsframe,'background',[0.831 0.816 0.784]);

    copt_xxx=evalin('base','copt_xxx'); % Concentration Matrix
    sopt_xxx=evalin('base','sopt_xxx'); % Spectra Matrix
    itopt_xxx=evalin('base','itopt_xxx'); % Number of Iterations
    sdopt_xxx=evalin('base','sdopt_xxx'); % Lack of eror [PCA, exp]
    r2opt_xxx=evalin('base','r2opt_xxx'); % Percent of Variance Explained (R²) at optimum
    rtopt_xxx=evalin('base','rtopt_xxx'); %
    change_xxx=evalin('base','change_xxx'); % Std. dev of residuals vs. exp. data


    axes(app.concen);

    [xi,yi]=size(copt_xxx);
    maxim=max(max(copt_xxx));
    minim=min(min(copt_xxx));

    if maxim > 0
        maxim1=maxim+0.2*maxim;
    else
        maxim1=maxim-0.2*abs(maxim)
    end

    if minim > 0
        minim1=minim-0.2*minim;
    else
        minim1=minim-0.2*abs(minim);
    end

    plot(copt_xxx);axis([1 xi minim1 maxim1])

    title('Concentration profiles');

    axes(app.spec);

    [xi,yi]=size(sopt_xxx);
    maxim=max(max(sopt_xxx));
    minim=min(min(sopt_xxx));

    if maxim > 0
        maxim1=maxim+0.2*maxim;
    else
        maxim1=maxim-0.2*abs(maxim)
    end

    if minim > 0
        minim1=minim-0.2*minim;
    else
        minim1=minim-0.2*abs(minim);
    end

    plot(sopt_xxx');axis([1 yi minim1 maxim1]);

    title('Spectra');

    nit=char(['Plots are optimum in the iteration Nr.  ',num2str(itopt_xxx)]);
    set(app.als_iter,'Text',nit,'background',[0.831 0.816 0.784]);

    changes=char(['Std. dev of residuals vs. exp. data = ',num2str(change_xxx)]);
    set(app.als_change,'Text',changes,'background',[0.831 0.816 0.784]);

    fit_pca=char(['Fitting error (lack of fit, lof) in % (PCA) =', num2str(sdopt_xxx(1,1))]);
    set(app.als_fitpca,'Text',fit_pca,'background',[0.831 0.816 0.784]);

    fit_exp=char(['Fitting error (lack of fit, lof) in % (exp) = ', num2str(sdopt_xxx(1,2))]);
    set(app.als_fitexp,'Text',fit_exp,'background',[0.831 0.816 0.784]);

    R2=char(['Percent of variance explained (R²) at the optimum is = ',num2str(100*r2opt_xxx)]);
    set(app.als_r2,'Text',R2,'background',[0.831 0.816 0.784]);

elseif als_end == 2 % Diverging
    %     bool = 0;

    set(app.als_fit,'Text',['FIT NOT IMPROVING FOR 20 TIMES CONSECUTIVELY (DIVERGENCE?), STOP!!'],'background',[0.831 0.816 0.784])
%     set(app.alsframe,'background',[0.831 0.816 0.784]);

    copt_xxx=evalin('base','copt_xxx');
    sopt_xxx=evalin('base','sopt_xxx');
    itopt_xxx=evalin('base','itopt_xxx');
    sdopt_xxx=evalin('base','sdopt_xxx');
    r2opt_xxx=evalin('base','r2opt_xxx');
    rtopt_xxx=evalin('base','rtopt_xxx');
    change_xxx=evalin('base','change_xxx');

    axes(app.concen);
    [xi,yi]=size(copt_xxx);
    maxim=max(max(copt_xxx));
    minim=min(min(copt_xxx));

    if maxim > 0
        maxim1=maxim+0.2*maxim;
    else
        maxim1=maxim-0.2*abs(maxim)
    end

    if minim > 0
        minim1=minim-0.2*minim;
    else
        minim1=minim-0.2*abs(minim);
    end

    plot(copt_xxx);axis([1 xi minim1 maxim1])
    title('Concentration profiles');

    axes(app.spec);
    [xi,yi]=size(sopt_xxx);
    maxim=max(max(sopt_xxx));
    minim=min(min(sopt_xxx));

    if maxim > 0
        maxim1=maxim+0.2*maxim;
    else
        maxim1=maxim-0.2*abs(maxim)
    end

    if minim > 0
        minim1=minim-0.2*minim;
    else
        minim1=minim-0.2*abs(minim);
    end

    plot(sopt_xxx');axis([1 yi minim1 maxim1]);
    title('Spectra');

    nit=char(['Plots are optimum in the iteration Nr.  ',num2str(itopt_xxx)]);
    set(app.als_iter,'Text',nit,'background',[0.831 0.816 0.784]);

    R2=char(['Percent of variance explained (R²) at the optimum is = ',num2str(100*r2opt_xxx)]);
    set(app.als_r2,'Text',R2,'background',[0.831 0.816 0.784]);

    fit_pca=char(['Fitting error (lack of fit, lof) in % (PCA) =', num2str(sdopt_xxx(1,1))]);
    set(app.als_fitpca,'Text',fit_pca,'background',[0.831 0.816 0.784]);

    fit_exp=char(['Fitting error (lack of fit, lof) in % (exp) = ', num2str(sdopt_xxx(1,2))]);
    set(app.als_fitexp,'Text',fit_exp,'background',[0.831 0.816 0.784]);

    changes=char(['Std. dev of residuals vs. exp. data =',num2str(change_xxx)]);
    set(app.als_change,'Text',changes,'background',[0.831 0.816 0.784]);

elseif als_end == 3 % Max Iterations met
    %     bool = 0;

    set(app.als_fit,'Text','NUMBER OF ITERATIONS EXCEEDED THE ALLOWED!!!','background',[0.831 0.816 0.784])
%     set(app.alsframe,'background',[0.831 0.816 0.784]);

    copt_xxx=evalin('base','copt_xxx');
    sopt_xxx=evalin('base','sopt_xxx');
    itopt_xxx=evalin('base','itopt_xxx');
    sdopt_xxx=evalin('base','sdopt_xxx');
    r2opt_xxx=evalin('base','r2opt_xxx');
    rtopt_xxx=evalin('base','rtopt_xxx');
    change_xxx=evalin('base','change_xxx');

    axes(app.concen);
    [xi,yi]=size(copt_xxx);
    maxim=max(max(copt_xxx));
    minim=min(min(copt_xxx));

    if maxim > 0
        maxim1=maxim+0.2*maxim;
    else
        maxim1=maxim-0.2*abs(maxim)
    end

    if minim > 0
        minim1=minim+0.2*minim;
    else
        minim1=minim-0.2*abs(minim);
    end

    plot(copt_xxx);axis([1 xi minim1 maxim1])
    title('Concentration profiles');

    axes(app.spec);
    [xi,yi]=size(sopt_xxx);
    maxim=max(max(sopt_xxx));
    minim=min(min(sopt_xxx));

    if maxim > 0
        maxim1=maxim+0.2*maxim;
    else
        maxim1=maxim-0.2*abs(maxim)
    end

    if minim > 0
        minim1=minim-0.2*minim;
    else
        minim1=minim-0.2*abs(minim);
    end

    plot(sopt_xxx');axis([1 yi minim1 maxim1]);
    title('Spectra');

    nit=char(['Plots are optimum in the iteration nº  ',num2str(itopt_xxx)]);
    set(app.als_iter,'Text',nit,'background',[0.831 0.816 0.784]);

    R2=char(['Percent of variance explained (R²) at the optimum is = ',num2str(100*r2opt_xxx)]);
    set(app.als_r2,'Text',R2,'background',[0.831 0.816 0.784]);

    fit_pca=char(['Fitting error (lack of fit, lof) in % (PCA) =', num2str(sdopt_xxx(1,1))]);
    set(app.als_fitpca,'Text',fit_pca,'background',[0.831 0.816 0.784]);

    fit_exp=char(['Fitting error (lack of fit, lof) in % (exp) = ', num2str(sdopt_xxx(1,2))]);
    set(app.als_fitexp,'Text',fit_exp,'background',[0.831 0.816 0.784]);

    changes=char(['Std. dev of residuals vs. exp. data =',num2str(change_xxx)]);
    set(app.als_change,'Text',changes,'background',[0.831 0.816 0.784]);

end

