function [member_lengths,forces] = calculate_lengths_forces(X,Y,C,L,Sx,Sy)
% Returns the member lengths and forces as matricies
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
    
    member_lengths = r;
    forces = T;
   
end
        

