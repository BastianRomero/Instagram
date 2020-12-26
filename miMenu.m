function [opcion,nombre] = miMenu()

respuesta = false;

while respuesta == false

    pregunta = "Eliga una opción\n";
    fprintf("1- Borrar bordes \n");
    fprintf("2- Encuadrar (En desarrollo) \n");
    fprintf("3- Unir 2 imagenes\n");
    fprintf("4- Unir 3 imagenes\n");
    fprintf("5- Unir 4 imagenes\n");
    opcion = input(pregunta,'s');
    entrada = opcion;
    opcion = str2double(opcion);

    if(isnumeric(opcion) && ~isnan(opcion) && opcion < 6 && ~isequal(opcion,0))
        nombre = {'Sinbordes.jpg','Encuadre.jpg','Two_.jpg','Three_.jpg','For_.jpg'};
        nombre = nombre{opcion};
        respuesta = true;
    elseif(isequal(opcion,0))
        ls -l
    else
        respuesta = false;
        fprintf(['Estamos frente a una variable invalida: ' entrada ' no es una variable valida \n']); 
    end  
    
end

end