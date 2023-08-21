function [crit_member,pcrit_lower] = pcrit_m(pressures,lengths,applied_load)
   
    load("fit_analysis.mat", "U_fit", "alpha_exponent", "coefficient");
    F_lower = zeros(width(lengths),1);
    members = width(lengths);
    pcrit_lower = zeros(members,1);
    for i = 1:members

        F_lower(i) = (coefficient * (lengths(i)^-alpha_exponent));% - U_fit;
        pcrit_lower(i) = pressures(i)/F_lower(i);
        
    end
    
    crit_member = find(pcrit_lower == min(pcrit_lower));
    
end