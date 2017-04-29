% knn

% This program takes and reads an spreadsheet with data points having
% three attributes and approximates missing values for a specified data
% point.

% Input Format: tuition act earnings (enter 0 for missing value)
% Output Format: single value representing the missing term

% Excel format...
% Col1: #
% Col2: Tutition
% Col3: ACT
% Col4: Earnings


function[missingVal] = knn(tuition, act, earnings)
    % Convert inputs to numerical format
    tuition = str2double(tuition);
    act = str2double(act);
    earnings = str2double(earnings);
    
    % Read excel file
    data = xlsread('knndata.xlsx');
    s = size(data);
    s = s(1);
    
    % When tuition is the missing value...
    if tuition == 0
        % The distances matrix will store each distance value.
        distances = zeros(s,2);
        for i = 1:s
            aVal = data(i,3);
            eVal = data(i,4);
            % The distance calculation will include act and earnings data.
            d = sqrt(((act-aVal)*(act-aVal))+((earnings-eVal)*(earnings-eVal)));
            distances(i,1) = data(i,1);
            distances(i,2) = d;
        end
        % Sort distances from low to high to determine the three shortest
        % distances, or the three nearest neighbors.
        distances = sortrows(distances, 2);
        dist1 = distances(1, 2);
        dist2 = distances(2, 2);
        dist3 = distances(3, 2);
        % x serves as the denominator for the weight calculation.
        x = (1/dist1) + (1/dist2) + (1/dist3);
        % Calculate the three weights and gather the three original values
        % using the second column of the data matrix for tuition data.
        weight1 = (1/dist1)/x;
        val1 = data(distances(1,1), 2);
        weight2 = (1/dist2)/x;
        val2 = data(distances(2,1), 2);
        weight3 = (1/dist3)/x;
        val3 = data(distances(3,1), 2);
        % The missing value will the the combination of the three nearest
        % neighbors and their weights.
        missingVal = (weight1*val1)+(weight2*val2)+(weight3*val3);
    end
    
    % When act is the missing value...
    if act == 0
        % The distances matrix will store each distance value.
        distances = zeros(s,2);
        for i = 1:s
            tVal = data(i,2);
            eVal = data(i,4);
            % The distance calculation will include tuition and earnings data.
            d = sqrt(((tuition-tVal)*(tuition-tVal))+((earnings-eVal)*(earnings-eVal)));
            distances(i,1) = data(i,1);
            distances(i,2) = d;
        end
        % Sort distances from low to high to determine the three shortest
        % distances, or the three nearest neighbors.
        distances = sortrows(distances, 2);
        dist1 = distances(1, 2);
        dist2 = distances(2, 2);
        dist3 = distances(3, 2);
        % x serves as the denominator for the weight calculation.
        x = (1/dist1) + (1/dist2) + (1/dist3);
        % Calculate the three weights and gather the three original values
        % using the third column of the data matrix for act data.
        weight1 = (1/dist1)/x;
        val1 = data(distances(1,1), 3);
        weight2 = (1/dist2)/x;
        val2 = data(distances(2,1), 3);
        weight3 = (1/dist3)/x;
        val3 = data(distances(3,1), 3);
        % The missing value will the the combination of the three nearest
        % neighbors and their weights.
        missingVal = (weight1*val1)+(weight2*val2)+(weight3*val3);
    end
    
    % When earnings is the missing value...
    if earnings == 0
        % The distances matrix will store each distance value.
        distances = zeros(s,2);
        for i = 1:s
            tVal = data(i,2);
            aVal = data(i,4);
            % The distance calculation will include tuition and act data.
            d = sqrt(((tuition-tVal)*(tuition-tVal))+((act-aVal)*(act-aVal)));
            distances(i,1) = data(i,1);
            distances(i,2) = d;
        end
        % Sort distances from low to high to determine the three shortest
        % distances, or the three nearest neighbors.
        distances = sortrows(distances, 2);
        dist1 = distances(1, 2);
        dist2 = distances(2, 2);
        dist3 = distances(3, 2);
        % x serves as the denominator for the weight calculation.
        x = (1/dist1) + (1/dist2) + (1/dist3);
        % Calculate the three weights and gather the three original values
        % using the fourth column of the data matrix for earnings data.
        weight1 = (1/dist1)/x;
        val1 = data(distances(1,1), 4);
        weight2 = (1/dist2)/x;
        val2 = data(distances(2,1), 4);
        weight3 = (1/dist3)/x;
        val3 = data(distances(3,1), 4);
        % The missing value will the the combination of the three nearest
        % neighbors and their weights.
        missingVal = (weight1*val1)+(weight2*val2)+(weight3*val3);
    end
end



