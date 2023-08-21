
function mat = calculate_rxns_02(L,C,X,Y,Sx,Sy)
    
    applied_load = L(L>0);
    load_index = find(L>0)-height(C);
    %location of S2
    S2_index = find(Sy(:,3)>0);

    %Roller support reaction
    %Sum of moments about S1 = 0
    %Sy2 = distance_to_load*load/distance_to_S2

    %fix the distance calculation so that its the true distance and not just the node!
    %You have zero in the numerator
    Sy2 = ((X(load_index)-X(1))*applied_load)/((X(S2_index)-X(1))); % calculate Sy2
    Sy2 = Sy2/applied_load; % calculate the portion of the load in the reaction
        
    %Pin support reactions
    Sx1 = 0;
    Sy1 = 1-Sy2;

    mat = [Sx1,Sy1,Sy2];
end
