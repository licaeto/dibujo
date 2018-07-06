function [ salida ] = NL_bajo( entrada )
    %Enmarcar la imagen de entrada para evitar el zero padding
    aux=[entrada(1,:);entrada];
    aux=[aux;aux(end,:)];
    aux=[aux(:,1),aux];
    aux=[aux,aux(:,end)];
    
    %Aplicar el filtro a la imagen
    B=medfilt2(aux);
    
    %Convertir la matriz al formato entero sin signo de 8 bits
    salida=uint8(B);
end

