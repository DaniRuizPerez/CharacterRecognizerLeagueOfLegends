%procesar con parametros auxiliares para guardar las capturas
function procesar_ALL(ruta, desp, aprox, rutaDB1, rutaDB2,rutaSave,character)

imgEnt = imread(ruta);
system = aa_svm(rutaDB1,rutaDB2,'rbf');

imshow(imgEnt)

minsizex = 25;
minsizey = 25;

maxsizex = size(imgEnt,2);
maxsizey = size(imgEnt,1);

maxwinsizex = size(imgEnt,2)/4;
maxwinsizey = size(imgEnt,1)/3;

inix = 1;
iniy = 1;

h = waitbar(0,'Please wait...');
for sizex=minsizex:desp:maxwinsizex;
    porcentaje = sizex * 100 / maxwinsizex;
    h = waitbar(porcentaje/100,h,...
    ['percentage =',num2str(porcentaje),'%' ]);
    for sizey=minsizey:desp:maxwinsizey;
        for x=inix:desp:(maxsizex - sizex);
            for y=iniy:desp:(maxsizey - sizey);
                if (x + sizex < maxsizex & y + sizey < maxsizey)
                    image = imgEnt(y:y+sizey, x:x+sizex, 1:3);
                    trozo = aprox(image);
                    output = svmclassify(system,trozo);  
                   if (output(1) > 0.99)
                        rectangle('Position',[x y sizex sizey], 'LineWidth',1, 'EdgeColor','b'); 
                   end;
               end;
            end;
        end;
    end;
end;
delete(h)

f = getframe(gca);
imgEnt = frame2im(f);
imwrite(imgEnt, strcat(rutaSave,character, '_desp=',int2str(desp), '.jpg'))
end

