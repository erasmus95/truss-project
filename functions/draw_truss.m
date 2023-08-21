
function draw_truss(X,Y,C,L,c_member)
    XYcoords = [X',Y'];
    adjacency_matrix = zeros(size(C, 1));
    for k = 1:size(C, 2)
        joints = find(C(:,k));
        if numel(joints) == 2
            adjacency_matrix(joints(1), joints(2)) = 1;
            adjacency_matrix(joints(2), joints(1)) = 1;
        end
    end
    
    hold on
    grid on
    scatter(X,Y,'red','filled')
    
% plot the buckling member in thick red
   crit_nodes = find(C(:,c_member),2);
   XY_Crit = [XYcoords(crit_nodes(1),:);XYcoords(crit_nodes(2),:)];
   plot(XY_Crit(:,1)', XY_Crit(:,2)', 'r', 'LineWidth', 3);
%text((sum(XY_Crit(:,1))/2)-1,(sum(XY_Crit(:,2))/2)+2,'critical member',BackgroundColor='white');

% plot the lines connecting each node
   [x, y] = gplot(adjacency_matrix,XYcoords,'blue');
   plot(x,y,'b')
    
% add labels to the connecting lines
    for i = 1:size(C, 2)
        joints = find(C(:,i));
        if numel(joints) == 2
            % get the midpoint of the line
            midx = (X(joints(1)) + X(joints(2))) / 2;
            midy = (Y(joints(1)) + Y(joints(2))) / 2;
            % add the label to the plot
            text(midx, midy, num2str(i), 'HorizontalAlignment', 'center',BackgroundColor='white');
        end
    end

 % plot the load vector
    load_lbl = [num2str(L(L>0)) ' oz'];
    load_index = find(L>0);
    loadx = X(load_index-height(C));
    loady = Y(load_index-height(C));
    load_u = 0;
    load_v = -10;
    quiver(loadx,loady,load_u,load_v,'Color','red','LineWidth',1,'MaxHeadSize',2)
    text(loadx(1)+load_u(1)/2, loady(1)+load_v(1)/2, load_lbl)
    
    
 % create a list of numbers and label nodes
    j = height(C);
    listNodes = 1:j;
    strNodes = strings(j, 1);
    for i = 1:j
        strNodes(i) = num2str(listNodes(i));
    end
    
    for i = 1:j
        text(X(i)+0.5, Y(i)+0.5, sprintf('J%s',strNodes(i)),Color='white',BackgroundColor='black');
    end
end
