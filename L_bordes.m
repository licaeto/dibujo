function [ salida ] = L_bordes( entrada )
    [r,c]=size(entrada);
    %Enmarcar la imagen de entrada para evitar el zero padding
    aux=[entrada(1,:);entrada];
    aux=[aux;aux(end,:)];
    aux=[aux(:,1),aux];
    aux=[aux,aux(:,end)];
    
    %Construir el kernel
    k=ones(3,3)*-1;
    k(2,2)=8;
    
    %Aplicar el filtro a la imagen
    B=filter2(k,aux);
    
    %Aplicar mejora de contraste binario con umbral 67
    for i=1:r
        for j=1:c
            if B(i,j)>67
                B(i,j)=255;
            else
                B(i,j)=0;
            end
        end
    end
    
    
    %Convertir la matriz al formato entero sin signo de 8 bits
    salida=uint8(B);
end

