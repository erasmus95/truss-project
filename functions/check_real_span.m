
% span constraint
function check_real_span(Sy,X)
    [rows,cols] = find(Sy>0);
    clear cols
    
    if X(rows(2)) - X(rows(1)) ~= 34
        error('Truss span is not 34 inches');
    end
end
