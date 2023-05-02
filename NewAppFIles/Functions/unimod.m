function [conc]=unimod(conc,rmod,cmod)
%conc: Working profile
%rmod: Tolerance
%cmod: Implementation type 0-vertical, 1-horizontal, 2-average

[ns,nc]=size(conc);

% 1) look for the maximum

for j=1:nc % For each column
[y,imax(j)]=max(conc(:,j)); % find maximum index
end

% 2) force unimodality shape

for j=1:nc % For each column

rmax=conc(imax(j),j); % Get initial working max from absolute max
k=imax(j);
% disp('maximum at point');disp(k)

% 2a) discard left maxima (tolerance rmod)

while k>1, % while max index is greater than 1
k=k-1; % move to left of max by one

if conc(k,j)<=rmax % if the value here is less than the working max
	rmax=conc(k,j); % replace working max
else, % It the value is greater than working max, uh oh we should not be going back up...
	rmax2=rmax*rmod; % Apply tolerance to allow limited increase
    if conc(k,j)>rmax2, % If out of the tolerance of working max
	
	    % disp('no left unimodality in point: ');disp(k);
	    % pause
       	    
	    if cmod==0 % vertical - set to zero
            conc(k,j)=1.0E-30;end
       	    if cmod==1 % horizontal - set to value to the right
                conc(k,j)=conc(k+1,j);end 
	    if cmod==2 % average
		    if rmax>0 % for positive working max, set value to average of current value and value to right
			    conc(k,j)=(conc(k,j)+conc(k+1,j))/2;
			    conc(k+1,j)=conc(k,j); % also set right value to that average
			    k=k+2; % This will force the algorithym to go over these points again
		    else
			    conc(k,j)=0;
		    end
	    end
	    
	    rmax=conc(k,j);

    end

end

end

% 2b) discard right maxima (tolerance rmod)

rmax=conc(imax(j),j);
k=imax(j);

while k<ns,
k=k+1;

if conc(k,j)<=rmax,
	rmax=conc(k,j);
else,
	rmax2=rmax*rmod;
        if conc(k,j)>rmax2,
        if cmod==0,conc(k,j)=1.0E-30;end
        if cmod==1,conc(k,j)=conc(k-1,j);end
 	if cmod==2,
		% disp('no right unimodality in point: ');
		% disp([k,conc(k,j),rmax])
		% disp('rmax= ');disp(rmax);
		% pause
		if rmax>0,
			conc(k,j)=(conc(k,j)+conc(k-1,j))/2;
			conc(k-1,j)=conc(k,j);
			k=k-2;
		else
			conc(k,j)=0;
		end
	end
        rmax=conc(k,j);
        end
end

end

end
