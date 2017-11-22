function X =  zilean_aprox7_imagen(image)

      X = zeros([1 12]);
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
    

      carac1 = image(round(sizey/3):sizey-round(sizey/2), round(sizex/2):2*round(sizex/3), 1:3);
      
      %figure
      %imshow(image)
      %figure
      %imshow(carac1)


      cred = double(carac1(:,:,1));
      cgreen = double(carac1(:,:,2));
      cblue = double(carac1(:,:,3));
      
      carac1sred = std(reshape(cred,size(cred,1)*size(cred,2),1));
      carac1mred = mean(mean(cred));
      carac1sgreen = std(reshape(cgreen,size(cgreen,1)*size(cgreen,2),1));
      carac1mgreen = mean(mean(cgreen));
      carac1sblue = std(reshape(cblue,size(cblue,1)*size(cblue,2),1));
      carac1mblue = mean(mean(cblue));
  
      X(1,:) = [mred mblue mgreen sred sblue sgreen carac1mred carac1mblue carac1mgreen carac1sred carac1sblue carac1sgreen];


end

