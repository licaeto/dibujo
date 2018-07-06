function [ matriz_imagen_end ] = asignacion( matriz_imagen_ini,posicion,valor_nuevo ) 

    DimIni=size(matriz_imagen_ini);
   
    if posicion(1)>DimIni(1) || posicion(2)>DimIni(2)
        p=sprintf('Valores de posicion fuera de las dimensiones originales de la imagen');
        disp(p);
        matriz_imagen_end=matriz_imagen_ini;
    else
        matriz_imagen_ini(posicion(1),posicion(2))=valor_nuevo;
        matriz_imagen_end=matriz_imagen_ini;
    end

end

