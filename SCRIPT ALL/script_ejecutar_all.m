%Este escript genera ejecuciones con svm con rbf para todos los personajes
%y todos los fondos
champs = ['Urgot ';'Zilean';'Thresh'];
backgrounds = ['STD';'RIV';'BAS'];

for i = 1:3;
    name = strtrim(champs(i,1:6));
    switch i
       case 1
            aprox = @urgot_aprox7_imagen;
            champbd = 'URGOT_all_7_75.mat';
            backgroundbd = 'FONDO_all_7_75.mat';            
        case 2
             aprox = @zilean_aprox6_imagen;
             champbd = 'ZILEAN_ALL_6_75.mat';
             backgroundbd = 'FONDO_ALL_6_75.mat';
             
        case 3
            aprox = @thresh_aprox9_imagen;
             champbd = 'THRESH_STD_9_25.mat';
             backgroundbd = 'FONDO_STDHUD_9_25.mat';    
        otherwise
            aprox = @thresh_aprox9_imagen;
             champbd = 'THRESH_STD_9_25.mat';
             backgroundbd = 'FONDO_STDHUD_9_25.mat';
    end;
    for j = 1:3;
        background = strtrim(backgrounds(j,1:3));
        ruta = strcat('C:\Users\Acer\Dropbox\Compupenes\AA\Resultados\' ,name, '_' ,background);
        mkdir(ruta);
        times = fopen(strcat(ruta,'\times.txt'),'w');
       
        for desp = 15:15:45;
            fprintf(times,strcat(name,'_desp=',int2str(desp), '->  '));
            tic;
            procesar_ALL(strcat('C:\Users\Acer\Dropbox\Compupenes\AA\ConjuntoPrueba\',name,'_',background,'.jpg'),desp,aprox,champbd, backgroundbd,strcat(ruta,'\'),name)
            time = toc;    
            fprintf(times,strcat(num2str(time),'\n'));
        end;
        
        times = fclose(times);
    end;
end;