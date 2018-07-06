function [ resultado ] = aristas( listapuntos )
    %Primera Casilla: Ymax-Ymin
    %Segunda Casilla: X correspondiente a la Ymin
    %Tercera Casilla: (Xmax-Xmin) / (Ymax-Ymin)
    resultado=[];
    
    for i=1:size(listapuntos,1)
        
        if i==size(listapuntos,1)
            A = listapuntos(end,:);
            B = listapuntos(1,:);
        else
            A=listapuntos(i,:);
            B=listapuntos(i+1,:);
        end
        
        if(B(2) < A(2))
            max=A;
            min=B;
        else
            max=B;
            min=A;
        end
        
        if max(2)~= min(2)
            lineas=max(2)-min(2);
            xmin=min(1);
            pendiente=(min(1)-max(1))/(min(2)-max(2));
            resultado=[resultado ; lineas xmin pendiente min(2)];
        end                
    end
end

