function X = zilean_aprox7(Folder, NumImgs, Imgs)
X = zeros([NumImgs 12]);
    for i=1:NumImgs,
      image = double(imread([Folder '/' Imgs(i).name]));
      X(i,:) = zilean_aprox7_imagen(image);
    end
end

