function [salida]=circuloconpuntero(p1,p2,entrada,brillo)
    r=round(norm(p2-p1));
    x=0;
    y=r;
    d=1-r;
    
    
    while y >= x
        %Dibujo Puntos
        entrada=asignacion(entrada,[x+p1(1) y+p1(2)],brillo);%    x, y MAL
        entrada=asignacion(entrada,[y+p1(1) x+p1(2)],brillo);%    y, x 
        entrada=asignacion(entrada,[y+p1(1) -x+p1(2)],brillo);%   y,-x 
        entrada=asignacion(entrada,[x+p1(1) -y+p1(2)],brillo);%   x,-y MAL
        entrada=asignacion(entrada,[-x+p1(1) -y+p1(2)],brillo);% -x,-y MAL
        entrada=asignacion(entrada,[-y+p1(1) -x+p1(2)],brillo);% -y,-x 
        entrada=asignacion(entrada,[-y+p1(1) x+p1(2)],brillo);%  -y, x 
        entrada=asignacion(entrada,[-x+p1(1) y+p1(2)],brillo);%  -x, y MAl
        
        if d<0
            d = d + 2*x + 3;
        else
            d = d + 2*x - 2*y + 5;
            y = y - 1;
        end
        
        x = x + 1;
    end
    
    salida=entrada;
end