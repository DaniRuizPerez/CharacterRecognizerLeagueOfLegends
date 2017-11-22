function X = urgot_aprox8(Folder, NumImgs, Imgs)
X = zeros([NumImgs 18]);
    for i=1:NumImgs,
      image = double(imread([Folder '/' Imgs(i).name]));
      X(i,:) = urgot_aprox8_imagen(image);
    end
end

