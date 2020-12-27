function [imagenOut] = sacarBordes(imagen,h,w)

comp = 1*ones(1,h);
    k = 1;
    i = imagen(:,:,1);
    i2 = imagen(:,:,2);
    i3 = imagen(:,:,3);
    [h,w] = size(imagen);
    while k <= h
        compr = sum((i(k,:) < comp));
        if (compr <= w && compr > 0.99*w)
            i(k,:) = [];
            i2(k,:) = [];
            i3(k,:) = [];
        else 
            k = k + 1;
        end
    [h,w] = size(i);
    end
   imagen =  cat(3,i,i2,i3);
   imag{1} = imagen;


[h,w] = size(imag{1});
comp = 1*ones(h,1);
    k = 1;
    imagen = imag{1};
    i = imagen(:,:,1);
    i2 = imagen(:,:,2);
    i3 = imagen(:,:,3);
    [h,w] = size(i);
while k <= w
        compl = sum((i(:,k) < 5*ones(h,1)));
        if(compl <= h && compl > 0.99*h)
            i(:,k) = [];
            i2(:,k) = [];
            i3(:,k) = [];
        else 
            k = k + 1;
        end
    [h,w] = size(i);
end
   imagen =  cat(3,i,i2,i3);
%    imag{1} = imresize(imagen,[1000 1000]);
    imagenOut = imag{1};

end 