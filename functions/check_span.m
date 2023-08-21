
% span constraint
function check_span(X)
    if max(X) - min(X) ~= 34
        error('Truss span is not 34 inches');
    end
end
