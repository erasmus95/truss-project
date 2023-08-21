

%this is the main thing
function [passing,member_lengths,forces,crit_member,F_lower,F_upper,Rm,W,load_to_crit_pressure_ratio] = calculate_if_truss_fails(X,Y,C,L,Sx,Sy)

    A = zeros(height(C)*2,width(C)+3);
    
    % generate position matricies - the C matrix but with X or Y value instead
    % of 1 at each node

    posX = zeros(size(C));
    posY = zeros(size(C));
    for m = 1:width(C)
        for j = 1:height(C)
            if C(j,m) ==1
                posX(j,m) = X(j);
                posY(j,m) = Y(j);
            end
        end
    end
    
    r = zeros(1,width(C)); % member lengths
    
    % building the A matrix partially
    for m = 1:width(C)
        counter = 1;
        index = find(C(:,m),2); %using the C matrix as a mask, find the coordinate indexes
        for j = 1:height(C)
            if C(j,m) == 1
                if counter == 1 %use a counter to check the first then the second
                    dx = (posX(index(2),m)-posX(index(1),m)); %x2-x1
                    dy = (posY(index(2),m)-posY(index(1),m)); %y2-y1
                    r(m) = sqrt(dx^2+dy^2); %pythagoras
    
                    A(j,m) = dx/r(m); %(x2-x1)/r
                    A(j+height(C),m) = dy/r(m); %(y2-y1)/r
                    counter = counter +1;
                else
                    dx = (posX(index(1),m)-posX(index(2),m)); %x1-x2
                    dy = (posY(index(1),m)-posY(index(2),m)); %y1-y2
                    r(m) = sqrt(dx^2+dy^2); %pythagoras
    
                    A(j,m) = dx/r(m); %(x1-x2)/r
                    A(j+height(C),m) = dy/r(m); %(y1-y2)/r
                end
            end
    
        end
    end
    
    % Finish building the A matrix
        A(1:height(C),width(C)+1:width(C)+3)=Sx;
        A(height(C)+1:height(C)*2,width(C)+1:width(C)+3)=Sy;
    
    % Calculate T matrix using an inverse A * Load
        T = (A^-1)*L;
    
    % Determin if our truss will buckle
        [crit_member_load,crit_member] = min(T);
        crit_member_length = r(crit_member);
        load('fit_analysis.mat','U_fit','alpha_exponent','coefficient');
        
        W = T/crit_member_length;
              
        
        F_upper = (coefficient * (crit_member_length^(-alpha_exponent))) + U_fit;
        F_lower = (coefficient * (crit_member_length^(-alpha_exponent))) - U_fit;
        
        load_to_crit_pressure_ratio = (L(L>0))/abs(crit_member_load);



        if abs(crit_member_load) > F_lower
            passing = 0;
            %error("Your truss will buckle with the given load: %d oz",L(L>0));
        else
            passing = 1;
        end
    member_lengths = r;
    forces = T;
    Rm = T/F_lower;

    %clean up function specific variables
    %clear posY posX alpha coefficient U_fit counter m j A r
end
