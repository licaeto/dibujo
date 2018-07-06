function [ salida ] = MClineal( entrada , L , P )
    if nargin<3
        L=25;
        P=3;
    end
    
    salida=(entrada-L)*P;
end