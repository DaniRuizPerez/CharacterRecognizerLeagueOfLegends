%Transpone las dos matrices y las concatena de forma que la red de neuronas
%acepte la entrada
function f = neuronJoin(m1, m2)
    f = horzcat(m1',m2');
end

