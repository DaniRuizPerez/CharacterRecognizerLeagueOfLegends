function X = numFromDB( dbName)
    b = regexpi(dbName, '([0-9]+)\.mat','tokens');
    a = b{:};
    X = str2num(cell2mat(a));

end

