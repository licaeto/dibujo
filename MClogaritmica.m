function [ salida ] = MClogaritmica( entrada )
    aux=255*(log(1+double(entrada)/255));
    salida=MClineal(uint8(aux),10,2);
end