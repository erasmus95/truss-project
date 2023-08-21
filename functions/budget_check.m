
% Check if over budget
function cost = budget_check(r,C,demo_truss)
    cost = sum(r)+height(C)*10;
    if cost > 325 && demo_truss==0
        error("You are over budget, go work for the government")
    end
end
