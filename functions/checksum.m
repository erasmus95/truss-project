function checksum(C) % make sure that the columns of C sum to 2
    checksum = sum(C,1);
    for i = height(C)
        if checksum(i) ~= 2
            error("Member is connected to more than two nodes. This is not a truss.");
        else
            %fprintf("Connectivity Matrix passes");
        end
    end
end