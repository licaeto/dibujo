function [salida, num]=conteo(entrada, umbral)
    %Comprobamos si es gris o a color la imagen
    if size(entrada(1,1),2) == 3
        entrada_gris=rgb2gray(entrada);
    else
        entrada_gris=entrada;
    end
    
    %umbralizamos la imagen en grises 
    entrada_umbralizada=umbralizar(entrada_gris,umbral);
    
    %negativizamos la imagen umbralizada
    entrada_negativizada=entrada_umbralizada==0;
    
    %etiquetamos zonas blancas
    entrada_etiquetada_blancas=bwlabel(entrada_negativizada,4);
    
    %localizamos etiqueta con mayor numero de pixeles (fondo)
    zona_max=0;
    size_zona_max=0;
    
    for i=1:max(max(entrada_etiquetada_blancas))
        sum(sum(entrada_etiquetada_blancas==i))
        if sum(sum(entrada_etiquetada_blancas==i)) > size_zona_max
            size_zona_max=sum(sum(entrada_etiquetada_blancas==i));
            zona_max=i;
        end
    end
    
    %eliminamos ruido (pixeles en etiqueta < (mayor zona) / 300)
    fondo=zona_max;
    
    for i=1:max(max(entrada_etiquetada_blancas))
        if sum(sum(entrada_etiquetada_blancas==i)) < (size_zona_max/30)
            entrada_etiquetada_blancas(entrada_etiquetada_blancas==i)=fondo;
        end
    end
    
    %pixeles que sean de fondo se ponen a 0 y los demas a 1
    entrada_etiquetada_blancas(entrada_etiquetada_blancas==fondo)=0;
    
    entrada_sin_ruido=entrada_etiquetada_blancas;   

    %etiquetamos para obtener el numero de objetos
    salida=bwlabel(entrada_sin_ruido);
    num=max(max(salida));
end
