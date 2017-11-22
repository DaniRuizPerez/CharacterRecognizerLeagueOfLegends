function X = annie_aprox5(Folder, NumImgs, Imgs)
X = zeros([NumImgs 18]);
    for i=1:NumImgs,
      image = double(imread([Folder '/' Imgs(i).name]));
      X(i,:) = annie_aprox5_imagen(image);
    end
end

