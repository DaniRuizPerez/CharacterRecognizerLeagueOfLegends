%Lee y devuelve la base de datos
function f = readDb(Name, NumberOfRows)
    f = load(Name);
    f = f.X;
    f = f(1:NumberOfRows,:);

end

