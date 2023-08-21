
function mat = calculate_rxns(L,C,X,Y)
    Sy2 = (L(L>0)*X(find(L>0)-height(C)))/max(X); % calculate Sy2
    Sy2 = Sy2/L(L>0);
    %Sy2 = round(abs(Sy2), -floor(log10(abs(Sy2))) + 2) * sign(Sy2); %get 3 sig figs
    %Pin support reactions
    Sx1 = 0;
    %Sy1 = (L(L>0))-Sy2;
    %Sy1 = Sy1/
    Sy1 = 1-Sy2;
    %Sy1 = round(abs(Sy1), -floor(log10(abs(Sy1))) + 2) * sign(Sy1);
    mat = [Sx1,Sy1,Sy2];
end
