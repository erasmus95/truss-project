
function printer_02(C,T,Rxns,cost,L,crit_member,r,pcrit_ratios)
    %Prints the output for the truss analysis
    crit_member = crit_member(1);
    pcrit = pcrit_ratios(crit_member);
    max_load = abs((L(L>0))*(pcrit(1))^-1); 
    total_length = 0;
    coefficient = 4338;
    alpha = 2.125;
    U_fit = 2.1;

    fprintf("EK301, Section A3, Group 16: Gregory Robben, Adam Shaikh, Jonathan Lee, 2023\n\n");
    fprintf("Load: %.2f oz\n",L(L>0));
    %fprintf("Member forces in oz\n");
    headers = sprintf("member # \t|length [in]\t|internal force [oz]\t| Buckling Range [oz]\n");
    fprintf("%s",headers)

    %loop through member forces
    for m = 1:(width(C))
        member = m;
        length = round(r(m),3,"significant");
        force = round(abs(T(m)),3,"significant");
        if T(m)<0
            force_type = 'C';
            buckle_load = round([coefficient*r(m)^(-alpha)+U_fit,coefficient*r(m)^(-alpha)-U_fit],3,"significant");
            fprintf("m%02d\t\t| %.2f\t\t| %.2f (%s)\t\t| %.2f - %.2f\n", ...
                member,length,force,force_type,buckle_load(2),buckle_load(1));
            
        else
            force_type = 'T';
            fprintf("m%02d\t\t| %.2f\t\t| %.2f (%s)\t\t|\n", member,length,force,force_type);
        end
        total_length = total_length + r(m);
    end
    fprintf("\nTotal length of materials: %0.2fin or %0.2fft \n",total_length,total_length/12);
    
    fprintf("\nReaction forces in oz:\n" + ...
            "Sx1: %02.2f\n" + ...
            "Sy1: %02.2f\n" + ...
            "Sy2: %02.2f\n" ...
            ,Rxns(1),Rxns(2),Rxns(3));
    fprintf("Cost of truss: $%0.2f\n\n",cost);
    fprintf("The critical member is member %d with a pressure of: %0.1f oz.\n",crit_member,abs(T(crit_member)));
    fprintf("The theoretical maximum load is: %0.1f oz. or %.2f grams\n",max_load,max_load*100/3.53);
    fprintf("Given the calculateduncertainty: \nThe lower bound max load is: %.2f\nThe upper bound max load is: %.2f\n",max_load-U_fit,max_load+U_fit)
    fprintf("Theoretical max load/cost ratio in oz/$: %0.4f\n",max_load/cost);
end
