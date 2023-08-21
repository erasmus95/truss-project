function [C,Sx,Sy,X,Y,L] = importJSONtruss()
    cd("json_files");
    [filename, filepath] = uigetfile('*.json*', 'Select a file');
    json_str = fileread(fullfile(filepath, filename));
    cd ..
    % Decode the JSON string into a MATLAB struct
    data = jsondecode(json_str);
    
    % Decompose the data into usable formats
    nodes = round(cell2matrix(data.nodes),0);
    members = cell2matrix(data.members);
    forces = cell2matrix(data.forces);
    M=members+1;
    
    M = sortrows(M,1);
    
    % Get the number of rows in the nodes2 matrix
    num_rows = size(nodes, 1);
    
    % Create a new column vector containing the row numbers
    row_numbers = (1:num_rows)';
    
    % Horizontally concatenate the nodes2 matrix with the new column vector
    nodes_with_row_numbers = horzcat(nodes, row_numbers);
    nodes_with_row_numbers = sortrows(nodes_with_row_numbers,1);
    nodes = nodes_with_row_numbers + [0 -min(nodes(:,2)) 0];
    clear nodes_with_row_numbers row_numbers num_rows
        
    n_joints = max(M(:)); % determine the number of joints
    n_members = height(M); % determine the number of members
    C = zeros(n_joints,n_members); % initialize the connectivity matrix
    
    for i = 1:n_members % loop over each member
        joint1 = find(nodes(:,3) == M(i,1)); % get the index of the first joint
        joint2 = find(nodes(:,3) == M(i,2)); % get the index of the second joint
        C(joint1,i) = 1; % set the appropriate element in the connectivity matrix
        C(joint2,i) = 1; % set the appropriate element in the connectivity matrix
    end

    Sx = zeros(height(C),3);
    Sy = zeros(height(C),3);

    Sx(1) = 1; % default to the pin x-reaction being at the first node
    Sy(1,2)=1; % default to the pin y-reaction being at the first node

    span_end = [0,1]; % set starting values
    for i = 1:height(nodes)
        if nodes(i,1) > span_end(1) && nodes(i,2)==0
            span_end = [nodes(i,1),i];
        end
    end
    Sy(span_end(2),3)=1;
    
    %N = nodes+[1 1 0];
    X = nodes(:,1)';
    Y = nodes(:,2)';
    
    L = zeros(height(C)*2,1);
    L(find(nodes(:,3)==(forces(1)+1))+height(C))=abs(forces(3));
    clear data 'members' 'm' 'nodes' 'n_members' 'n_joints' 'N' M forces joint1 joint2 i;
    %save('TrussDesign10_GregAdamJonathan_A3.mat','C','Sx','Sy','X','Y','L')
    %clear C Sx Sy X Y f L filename filepath json_str saveFileName
end
