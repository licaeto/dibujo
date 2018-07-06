function [ salida ] = NL_bordes( entrada )
    %Enmarcar la imagen de entrada para evitar el zero padding
    aux=[entrada(1,:);entrada];
    aux=[aux;aux(end,:)];
    aux=[aux(:,1),aux];
    aux=[aux,aux(:,end)];
    
    %Aplicar el filtro a la imagen
    K1=[-1 0 1;-2 0 2;-1 0 1];
    K2=[-1 -2 -1; 0 0 0; 1 2 1];
    
    Gx=filter2(K1,aux);
    Gy=filter2(K2,aux);
    
    B=sqrt((Gx.^2)+(Gy.^2));
    
    %Convertir la matriz al formato entero sin signo de 8 bits
    salida=uint8(B);
end

