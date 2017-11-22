function X = thresh_aprox9(Folder, NumImgs, Imgs)
X = zeros([NumImgs 18]);
    for i=1:NumImgs,
      image = double(imread([Folder '/' Imgs(i).name]));
      X(i,:) = thresh_aprox9_imagen(image);
    end
end

