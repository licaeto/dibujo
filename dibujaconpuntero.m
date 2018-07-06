function salida=dibujaconpuntero(p1,p2,entrada,brillo)
    salida=entrada;
    tam=size(entrada);
    
    if p2(2)<p1(2)
        temp=p2;
        p2=p1;
        p1=temp;
    end
    
    dy=(p2(1)-p1(1));
    dx=(p2(2)-p1(2));
    m=dy/dx;
    
    if m<0 && m>-1
        p1(1)=tam(1)-p1(1);
        p2(1)=tam(1)-p2(1);
        dy=(p2(1)-p1(1));
        dx=(p2(2)-p1(2));
    elseif m>1
        p1=[p1(2),p1(1)];
        p2=[p2(2),p2(1)];
        dy=(p2(1)-p1(1));
        dx=(p2(2)-p1(2));
    elseif m<-1
        p1(1)=tam(1)-p1(1);
        p2(1)=tam(1)-p2(1);
        p1=[p1(2),p1(1)];
        p2=[p2(2),p2(1)];
        dy=(p2(1)-p1(1));
        dx=(p2(2)-p1(2));
    end
    
    y=p1(1);
    d=2*dy-dx;
    
    for x=p1(2):p2(2)
        if m<0 && m>-1
            salida=asignacion(salida,[tam(1)-y,x],brillo);
        elseif m>1
            salida=asignacion(salida,[x,y],brillo);
        elseif m<-1
            salida=asignacion(salida,[tam(1)-x,y],brillo);
        else
            salida=asignacion(salida,[y,x],brillo);
        end
        if d<0
            d=d+2*dy;
        else
            y=y+1;
            d=d+2*dy-2*dx;
        end
    end
end