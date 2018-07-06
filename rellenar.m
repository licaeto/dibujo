function [salida] = rellenar(entrada,lista,brillo,ldr)
if rem(size(lista,1),2)>0
    error('Numero impar de intersecciones');
end

salida=entrada;
iteraciones = size(lista,1)/2;
for i=1:iteraciones
    izq=2*i-1;
    der=2*i;
    x1=lista(izq,2);
    x2=lista(der,2);
    if isfloat(x1)
        x1=floor(x1)+1;
    end
    if isfloat(x2)
        x2=floor(x2);
    elseif isinteger(x2)
        x2=x2-1;
    end
    
    for x=x1:x2
        salida=asignacion(salida,[ldr,x],brillo);
    end
    
end
end

