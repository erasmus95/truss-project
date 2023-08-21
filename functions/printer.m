
function printer(C,T,Rxns,cost,L,crit_member,r,F_lower,F_upper,lcpr)
    coefficient = 4338;
    alpha = 2.125;
    U_fit = 2.1;
    max_load = [F_lower*lcpr,F_upper*lcpr]; 
    total_length = 0;

    fprintf("EK301, Section A3, Group 16: Gregory Robben, Adam Shaikh, Jonathan Lee, 2023\n");
    fprintf("Load: %.2f oz\n",L(L>0));
    fprintf("Member forces in oz\n");
    
    %loop through member forces
    for m = 1:(width(C))
        if T(m)<0
            force_type = 'C';
            buckle_load = [coefficient*r(m)^(-alpha)+U_fit,coefficient*r(m)^(-alpha)-U_fit];
            fprintf("m%02d: %04.3f in \t| %04.2f oz (%s) \t| Max Buckling compression force range: %03.2f - %03.2f oz.\n",m,r(m),abs(T(m)),force_type,buckle_load(2),buckle_load(1));
        else
            force_type = 'T';
            fprintf("m%02d: %04.3f in \t| %04.2f oz (%s)\n",m,r(m),abs(T(m)),force_type);
        end
        total_length = total_length + r(m);
    end
    fprintf("\nTotal length of materials: %0.2fin or %0.2fft \n\n",total_length,total_length/12);
    
    fprintf("\n\nReaction forces in oz:\n" + ...
            "Sx1: %02.2f\n" + ...
            "Sy1: %02.2f\n" + ...
            "Sy2: %02.2f\n" ...
            ,Rxns(1),Rxns(2),Rxns(3));
    fprintf("Cost of truss: $%0.2f\n\n",cost);
    fprintf("The critical member is member %d with a pressure of: %0.2f oz.\n",crit_member,abs(T(crit_member)));
    fprintf("The theoretical lower bound maximum load is: %0.2f oz.\n",max_load(1));
    fprintf("The theoretical upper bound maximum load is: %0.2f oz.\n",max_load(2));
    fprintf("Theoretical max load/cost ratio in oz/$: %0.4f\n",max_load(2)/cost);
end
