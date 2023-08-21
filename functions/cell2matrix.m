
function numMatrix = cell2matrix(cellArray)
    numMatrix = cellfun(@str2num, cellArray, 'UniformOutput', false);
    numMatrix = cell2mat(numMatrix);
end
