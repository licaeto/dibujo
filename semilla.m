function [ salida ] = semilla( p, entrada, brillo, bpf )

    semillaArribaAux=[];
    semillaAbajoAux=[];
    pila=fliplr(p);
    
    while isempty(pila) <=0
        
        s=pila(end,:);
        
        pila(end,:)=[];
        
        der=1;
        izq=1;
        
        aDibujar=[];
        terminado=0;
        
        while terminado==0
            aDibujar=[aDibujar; fliplr(s)];
            
            sder=[s(2) ,s(1)+der];
            sizq=[s(2) ,s(1)-izq];
            
            if entrada(sder(1),sder(2)) ~= bpf
                aDibujar=[aDibujar; sder];
                der=der+1;
            end
            
            if entrada(sizq(1),sizq(2)) ~= bpf
                aDibujar=[aDibujar; sizq];
                izq=izq+1;
            end
            
            %dibujamos todos los pixeles de la fila buscando extremos
            if (entrada(sizq(1),sizq(2)) == bpf) && (entrada(sder(1),sder(2)) == bpf)
                terminado=1;
                for i=1:size(aDibujar,1)
                    aux=aDibujar(i,:);
                    if entrada(aux(1),aux(2)) ~= brillo
                        entrada=asignacion(entrada,aux,brillo);
                    end
                    
                    if entrada(aux(1)-1,aux(2)) ~=brillo
                        semillaArribaAux=[semillaArribaAux;aux(1)-1 aux(2)];
                    end
                    
                    if entrada(aux(1)+1,aux(2)) ~=brillo 
                        semillaAbajoAux=[semillaAbajoAux;aux(1)+1 aux(2)];
                    end
                end  
            end 
        end 
        
        %orden apilar abajo -> arriba y izquierda --> derecha

        apilable=1;
        borde=0;
        
        for i=size(semillaAbajoAux,1):-1:1
            aux=semillaAbajoAux(i,:);
            
            if entrada(aux(1),aux(2)) == bpf
                borde=1;
                apilable=1;
            else
                borde=0;
            end
            
            if apilable==1 && borde==0
                pila=[fliplr(aux);pila];
                apilable=0;
            end
        end
        
        apilable=1;
        borde=0;
        
        for i=size(semillaArribaAux,1):-1:1
            aux=semillaArribaAux(i,:);
           
            if entrada(aux(1),aux(2)) == bpf
                borde=1;
                apilable=1;
            else
                borde=0;
            end
            
            if apilable==1 && borde==0
                pila=[fliplr(aux);pila];
                apilable=0;
            end
        end
        
        semillaArribaAux=[];
        semillaAbajoAux=[];
        
        
    end 
    
    salida=entrada;
    
end

