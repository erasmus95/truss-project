
function joint_joint_constraint(r)
    %Check for member length constraint (8 in <= L <= 15in)
        if min(r)<8 || max(r)>15
            error("Joint-to-Joint contrainst fails")
        end
end
