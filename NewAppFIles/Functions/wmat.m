function [dm]=wmat(c,imp,irank,jvar)
    % c is COO or corelation around origin matrix
    % imp is first purest variable (index in matrix d)
    % irank is i or current row
    % jvar is j or current column

    % the function creates a matrix dm which equals [c(i,i), c(i,p1); c(p1,i), c(p1,p1)]
    % Where p is index of first purest variable
    dm(1,1)=c(jvar,jvar); % get COO at current position for first
    for k=2:irank, % for rows up to current rows
        kvar=imp(k-1); 
        dm(1,k)=c(jvar,kvar);
        dm(k,1)=c(kvar,jvar);
        for kk=2:irank,
            kkvar=imp(kk-1);
            dm(k,kk)=c(kvar,kkvar);
        end
    end
end
