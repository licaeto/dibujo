function [ resultado ] = LDR( aristas )
    listaY=aristas(1:end,4);
    resultado=[];
    
    for i=0:ymax
        if i < ymin
            resultado=[resultado ; -1];
        else
            %si la suma no supera 0 es que no se puede encontrar nada
            %si se encuentra lo metemos en resultado todo lo que salga
            %sum(aux2)
            %aux(find(listaY==5),1:end-1)
        end
    end
end

