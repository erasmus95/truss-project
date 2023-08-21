% Truss style validation
function check_truss_style(C)
    if width(C) == 2*height(C) - 3
        %fprintf("Truss is a single, planar, simple truss\nYour truss has %d members and %d nodes",width(C),height(C));
    else
        error("The given truss is not single, planar or simple...try again....");    
    end
end