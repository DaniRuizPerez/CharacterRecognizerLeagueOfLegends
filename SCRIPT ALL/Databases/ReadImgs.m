%Crea la base de datos con las imagenes de una carpeta
function ReadImgs(Folder,destiny,ImgType, Name, aprox)
    Imgs = dir([Folder '\' ImgType]);
    NumImgs = size(Imgs,1)
    Name = [Name '_' num2str(NumImgs)]
    X = aprox(Folder, NumImgs, Imgs);
    save([destiny Name], 'X'); 
end