%crea entrena y devuelve el SVM para un kernel específico que diferencia
%entre dos bases de datos (personaje y fondo)
function a = aa_svm(rutaDB1,rutaDB2,kernel)

addpath('C:\Users\Acer\Dropbox\Compupenes\AA\ficheros matlab\DB\Bases_de_datos');

annie = readDb(rutaDB1,numFromDB(rutaDB1));
fondo = readDb(rutaDB2,numFromDB(rutaDB2));

inputs = svmjoin(annie, fondo);

targets =  [ones(1,numFromDB(rutaDB1))  zeros(1,numFromDB(rutaDB2))];

SVMStruct = svmtrain(inputs, targets, 'Kernel_Function', kernel);

a = SVMStruct;

end