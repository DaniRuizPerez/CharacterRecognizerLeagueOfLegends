function X = annie_aprox5_imagen(image)

      X = zeros([1 18]);
      sizex = size(image,2);
      sizey = size(image,1);

      red = double(image(:,:,1));
      sred = std(reshape(red,size(red,1)*size(red,2),1));
      mred = mean(mean(red));
      green = double(image(:,:,2));
      sgreen = std(reshape(green,size(green,1)*size(green,2),1));
      mgreen = mean(mean(green));
      blue = double(image(:,:,3));
      sblue = std(reshape(blue,size(blue,1)*size(blue,2),1));
      mblue = mean(mean(blue));
    
       %He cambiado 1-round(sizex/3) por size-round(sizex/3) en carac 1 y 
       %1-round(sizey/2) por sizey-round(sizey/2)
      carac1 = image(1:round(sizey/4), round(sizex/4):sizex-round(sizex/5), 1:3);
      carac2 = image(round(sizey/6):sizey-round(sizey/2), 1:round(sizex/3), 1:3);
      
      
     % figure
      %imshow(image)
      %figure
      %imshow(carac1)
      %figure
      %imshow(carac2)
      

      cred = double(carac1(:,:,1));
      cgreen = double(carac1(:,:,2));
      cblue = double(carac1(:,:,3));
      
      carac1sred = std(reshape(cred,size(cred,1)*size(cred,2),1));
      carac1mred = mean(mean(cred));
      carac1sgreen = std(reshape(cgreen,size(cgreen,1)*size(cgreen,2),1));
      carac1mgreen = mean(mean(cgreen));
      carac1sblue = std(reshape(cblue,size(cblue,1)*size(cblue,2),1));
      carac1mblue = mean(mean(cblue));
      
      c2red = double(carac2(:,:,1));
      c2green = double(carac2(:,:,2));
      c2blue = double(carac2(:,:,3));
      
      carac2sred = std(reshape(c2red,size(c2red,1)*size(c2red,2),1));
      carac2mred = mean(mean(c2red));
      carac2sgreen = std(reshape(c2green,size(c2green,1)*size(c2green,2),1));
      carac2mgreen = mean(mean(c2green));
      carac2sblue = std(reshape(c2blue,size(c2blue,1)*size(c2blue,2),1));
      carac2mblue = mean(mean(c2blue));
      

      X(1,:) = [mred mblue mgreen sred sblue sgreen carac1mred carac1mblue carac1mgreen carac1sred carac1sblue carac1sgreen carac2mred carac2mblue carac2mgreen carac2sred carac2sblue carac2sgreen];


end

