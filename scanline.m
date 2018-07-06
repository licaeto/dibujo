function salida=scanline(listapuntos,entrada,brillo)
listapuntos=[listapuntos(:,2) listapuntos(:,1)];
salida=entrada;
lista_aristas = aristas(listapuntos);
ldr = min(lista_aristas(:,end));
lista_activas = lista_aristas(find(lista_aristas(:,end)==ldr),:);

while size(lista_activas,1)>0
    [B,I]=sort(lista_activas);
    lista_ordenada=lista_activas(I(:,2),:);
    salida=rellenar(salida,lista_ordenada,brillo,ldr);
    for i=1:size(lista_ordenada,1)
        lista_ordenada(i,1)=lista_ordenada(i,1)-1;
        lista_ordenada(i,2)=lista_ordenada(i,2)+lista_ordenada(i,3);
    end
    filas_terminadas=find(lista_ordenada(:,1)==0);
    if size(filas_terminadas,1)>0
        lista_ordenada(filas_terminadas,:)=[];
    end
    lista_activas = lista_ordenada;
    ldr=ldr+1;
    lista_activas=[lista_activas;lista_aristas(find(lista_aristas(:,end)==ldr),:)];
end
end    