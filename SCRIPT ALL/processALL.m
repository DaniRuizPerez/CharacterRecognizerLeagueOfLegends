%Variación del script procesar. Reconoce todos los personajes en todos los
%fondos y escribe los nombres de cada uno.
%Simplemente se le pasa la imagen el desplazamiento. Utiliza svm con rbf.

function procesar_AZUT(ruta, desp)
%Ruta: imagen a procesar
%Desplazamiento: sobre la ventana
imgEnt = imread(ruta);

system_A = aa_svm('Annie_ALL_5_75.mat','FONDO_ALL_5_75.mat','rbf');
system_Z = aa_svm('ZILEAN_ALL_7_75.mat','FONDO_ALL_7_75.mat','rbf');
system_U = aa_svm('URGOT_all_8_75.mat','FONDO_all_8_75.mat','rbf');
system_T = aa_svm('THRESH_STD_9_25.mat','FONDO_STDHUD_9_25.mat','rbf');

imshow(imgEnt)
minsizex = 25;
minsizey = 25;

maxsizex = size(imgEnt,2);
maxsizey = size(imgEnt,1);

maxwinsizex = size(imgEnt,2)/4;
maxwinsizey = size(imgEnt,1)/3;

inix = 1;
iniy = 1;

xa = 100;
ya = 100;
sizeya = 100;

xz = 100;
yz = 100;
sizeyz = 100;

xu = 100;
yu = 100;
sizeyu = 100;


xt = 100;
yt = 100;
sizeyt = 100;

writed_a = true;
writed_z = true;
writed_u = true;
writed_t = true;


h = waitbar(0,'Please wait...');
for sizex=minsizex:desp:maxwinsizex;
    porcentaje = sizex * 100 / maxwinsizex;
    h = waitbar(porcentaje/100,h,...
    ['percentage =',num2str(porcentaje),'%' ]);
    for sizey=minsizey:desp:maxwinsizey;
        for x=inix:desp:(maxsizex - sizex);
            for y=iniy:desp:(maxsizey - sizey);
                if (x + sizex < maxsizex && y + sizey < maxsizey)
                    image = imgEnt(y:y+sizey, x:x+sizex, 1:3);  
                    trozo_A = annie_aprox5_imagen(image);
                    trozo_Z = zilean_aprox7_imagen(image);
                    trozo_U = urgot_aprox8_imagen(image);
                    trozo_T = thresh_aprox9_imagen(image);
                    output_A = svmclassify(system_A,trozo_A);
                    output_Z = svmclassify(system_Z,trozo_Z);
                    output_U = svmclassify(system_U,trozo_U);
                    output_T = svmclassify(system_T,trozo_T);

                  if (output_A(1) > 0.99)
                        rectangle('Position',[x y sizex sizey], 'LineWidth',1, 'EdgeColor','r')
                        if (writed_a)
                            writed_a = false;
                            xa = x;
                            ya = y;
                            sizeya = sizey;
                        end;
                  end;
                   if (output_Z(1) > 0.99)
                        rectangle('Position',[x y sizex sizey], 'LineWidth',1, 'EdgeColor','y')
                        if (writed_z)
                            writed_z = false;
                            xz = x;
                            yz = y;
                            sizeyz = sizey;
                        end;
                  end;        
                    if (output_U(1) > 0.99)
                        rectangle('Position',[x y sizex sizey], 'LineWidth',1, 'EdgeColor','b')
                        if (writed_u)
                            writed_u = false;
                            xu = x;
                            yu = y;
                            sizeyu = sizey;
                        end;
                    end;
                   if (output_T(1) > 0.99)
                        rectangle('Position',[x y sizex sizey], 'LineWidth',1, 'EdgeColor','g')
                        if (writed_t)
                            writed_t = false;
                            xt = x;
                            yt = y;
                            sizeyt = sizey;
                         end;
                    end;
               end;
            end;
        end; 
    end;
end;
delete(h)

if(writed_a == false)
    imgEnt = text(xa, ya + sizeya + maxsizey/8, 'ANNIE');
    set(imgEnt, 'color', 'r', 'fontsize', 15)
end;
if(writed_z == false)
    imgEnt = text(xz, yz + sizeyz + maxsizey/8, 'ZILEAN');
    set(imgEnt, 'color', 'y', 'fontsize', 15)
end;
if(writed_u == false)
    imgEnt = text(xu, yu + sizeyu + maxsizey/8, 'URGOT');
    set(imgEnt, 'color', 'b', 'fontsize', 15)
end;
if(writed_t == false)
    imgEnt = text(xt, yt + sizeyt + maxsizey/8, 'THRESH');
    set(imgEnt, 'color', 'g', 'fontsize', 15)
end;

