function table = routhHurwitz(CE)

    arguments
        CE (1,:) % Characteristic Equation
    end
    
    % Get number of rows and columns
    num_row = size(CE,2);
    num_col = ceil(num_row/2); % Rounds up
    
    % Initialize table as all zeros:
    if isnumeric(CE)
        table = zeros(num_row,num_col);
    elseif isa(CE,'sym')
        table = sym(zeros(num_row,num_col));
    end
    
    % Assign the first two rows:
    row = 1;
    col = 1;
    for k = 1:num_row
        % Assign coeffcient to table
        table(row,col) = CE(k);
        % Assign rows and  for next iteration
        if row == 1
            row = 2;
        elseif row == 2
            row = 1;
            col = col+1;
        end
    end
    
    % Compute rest ob table
    for iterRow = 3:num_row-1
        for iterCol = 1:num_col-1
            % Intialize matrix for determinant
            if isnumeric(CE)
                matrix = zeros(2,2);
            elseif isa(CE,'sym')
                matrix = sym(zeros(2,2));
            end
            
            % Populate matrix for determinant
            matrix(1,1) = table(iterRow-2,1);
            matrix(2,1) = table(iterRow-1,1);
            matrix(1,2) = table(iterRow-2,iterCol+1);
            matrix(2,2) = table(iterRow-1,iterCol+1);
            % Compute table value
            table(iterRow,iterCol) = ...
                -det(matrix)/table(iterRow-1,1);
        end
    end
    % Last table value is equal to coefficient of
    % s^0
    table(end,1) = CE(1,end);
    
end