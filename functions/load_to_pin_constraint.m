
function load_to_pin_constraint(X,L,C,Sy,Y)
    pin_joint_number = Sy(:,2)==1;
    pin_joint = [X(pin_joint_number),Y(pin_joint_number)];
    j1 = X(1,1);
    dtl = abs(X(find(L>0) - height(C))-j1);
        if (dtl < 19) || (dtl > 22)
            error('Failed load-to-pin constraint. Your load is %d inches from the pin at (%.2f,%.2f)',dtl,pin_joint(1),pin_joint(2));
        else
            %fprintf("Load is located %.2fin away from Joint 1",dtl)
        end

end