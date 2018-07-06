function [ salida ] = MCecualizacion( entrada )
    entrada=double(entrada);
    
    [filas,columnas]=size(entrada);
    histograma=histcounts(entrada,255);
    
    salida=entrada;
    
    for i=1:filas
        for j=1:columnas
            celda=entrada(i,j)+1;
            salida(i,j)=((sum(histograma(1:celda))-(sum(histograma(1:1))))/(filas*columnas))*255;
        end
    end
    
    
    salida=MClineal(uint8(salida),10,2);
    
end