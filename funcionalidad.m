function funcionalidad(opcion,nombre)

    respuesta = false;
    while respuesta == false
        
        pregunta = "Nombre de carpeta o archivos \n";
        planS = input(pregunta,'s');
        esDirectorio = dir;
    
        for q = 1:length(esDirectorio)
            if(esDirectorio(q).name == string(planS))
                Q = q;
                break;
            end
        end
        
        if(exist('Q') == 0)
            fprintf("El nombre no existe \n");
            respuesta = false;
        elseif(opcion == 1 && esDirectorio(Q).isdir == 0)
            respuesta = true;
        elseif(opcion ~= 1 && esDirectorio(Q).isdir == 1)
            respuesta = true;
        else
            fprintf("Ponte vio \n");
            respuesta = false;
        end
    
    end
   
    
    
    if(esDirectorio(Q).isdir == 0)
        
        imag{1} = imread(planS);
        [h,w] = size(imag);
        imagenOut = sacarBordes(imag{1},h,w);
        number = length(dir('exportado'));
        number = number - 1;
        final = imagenOut;

    elseif(esDirectorio(Q).isdir == 1)
    
    cd(planS); delete .DS_Store
    a = dir; [archivos,~] = size(a);
    imag = cell(1,archivos);

    for n = 3:archivos
    imag{n-2} = imread(a(n).name);
    end

    cd ..

    [h,w] = size(imag);

    for m = 1:length(imag)-2
        imagenOut = sacarBordes(imag{m},h,w);
        imag{m} = imagenOut;
    end
    
        number = length(dir('exportado'))-1;
    if(opcion == 3)
        imag{1} = imresize(imag{1},[500 1000]);
        imag{2} = imresize(imag{2},[500 1000]);
        final = [imag{1}; imag{2}];
    elseif(opcion==4)
        imag{1} = imresize(imag{1},[400 1200]);
        imag{2} = imresize(imag{2},[400 1200]);
        imag{3} = imresize(imag{3},[400 1200]);
        final = [imag{1}; imag{2};imag{3}]; 
    elseif(opcion == 5)
        final = [imag{1} imag{2};imag{3} imag{4}];
    elseif(opcion == 6)
%         for i = 1:length(imag)
%             imag{i} = imresize(imag{i},[500 200]);
%         end
        final = [imag{1} imag{3} imag{5};
            imag{2} imag{4} imag{6}; 
             imag{7} imag{9} imag{11};
            imag{8} imag{10} imag{12}];
        final = imresize(final,[1000 1000]);
    end

    end


fig = imshow(final); axis off;
saveas(fig,['./exportado/edit_' num2str(number) '_' nombre]); 


end