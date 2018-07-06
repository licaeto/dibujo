function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 27-Jan-2014 16:07:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end


% End initialization code - DO NOT EDIT
%path(path,'p1');
%path(path,'p2');
%path(path,'p3');
%path(path,'p4');
%path(path,'p5');
%path(path,'p6');
%path(path,'p7');
%path(path,'p8');

% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global image;
x=600;
y=800;
image=255+uint8(zeros(x,y));
imshow(image);
axis([0 y 0 x]);
setpixelposition(handles.imageGUI,[0 0 y x])

% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on mouse press over axes background.
function imageGUI_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to imageGUI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function uipushtool3_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image imageorig
[filename,filepath]=uigetfile('*.*','Select the image','./imagenes');
if(filename~=0)
    image=imread([filepath filename]);
    imageorig=image;
    axes(handles.imageGUI);
    imshow(image);
    [sx,sy,sz]=size(image);
    axis([1 sy 1 sx]);
    %set(handles.imageGUI,'Position',[0 -50 100 100]);
    sizewindow=get(handles.figure1,'Position');
    getpixelposition(handles.imageGUI);
    setpixelposition(handles.imageGUI,[0 sizewindow(4)-sx sy sx])
end
% --------------------------------------------------------------------
function uipushtool5_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[x,y]=ginput(2);
global image;
p1=[floor(y(1)),floor(x(1))];
p2=[floor(y(2)),floor(x(2))];
image=dibujaconpuntero(p1,p2,image,0);
imshow(image);

% --------------------------------------------------------------------
function uipushtool1_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
x=600;
y=800;
image=255+uint8(zeros(x,y));
imshow(image);
axis([0 y 0 x]);
setpixelposition(handles.imageGUI,[0 0 y x])


% --------------------------------------------------------------------
function uipushtool2_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
%[filename,filepath]=uiputfile('*.png','Select the image',winqueryreg('HKEY_CURRENT_USER', 'Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders', 'Desktop'));
[filename,filepath]=uiputfile('*.png','Select the image','./imagenes');
if(filename~=0)
   imwrite(image,[filepath filename],'png'); 
end


% --------------------------------------------------------------------
function uipushtool16_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
[image num]=conteo(image,100);
imshow(image);
h = msgbox([num2str(num) ' objetos encontrados en la imagen'],'Conteo');


% --------------------------------------------------------------------
function uipushtool15_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
h = msgbox(['Calculando...'],'Espera por favor');
image=NL_alto(image);
close(h)
imshow(image);


% --------------------------------------------------------------------
function uipushtool14_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
h = msgbox(['Calculando...'],'Espera por favor');
image=NL_bajo(image);
close(h)
imshow(image);



% --------------------------------------------------------------------
function uipushtool10_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
[x,y]=ginput(2);
p1=[floor(y(1)),floor(x(1))];
p2=[floor(y(2)),floor(x(2))];
image=circuloconpuntero(p1,p2,image,0);
imshow(image);


% --------------------------------------------------------------------
function uipushtool11_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[x,y]=ginput(1);
global image;
p1=[floor(y(1)),floor(x(1))];
h = msgbox(['Calculando...'],'Espera por favor');
image=semilla(p1,image,0,0);
close(h)
imshow(image);


% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
sizewindow=get(handles.figure1,'Position');
[sx,sy,sz]=size(image);
if(sx>1)
    axis([1 sy 1 sx]);
    setpixelposition(handles.imageGUI,[0 sizewindow(4)-sx sy sx])
end


% --------------------------------------------------------------------
function uipushtool21_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[x,y]=ginput;
global image;
puntos=[y,x];
h = msgbox(['Calculando...'],'Espera por favor');
image=scanline(round(puntos),image,0);
close(h)
imshow(image);


% --------------------------------------------------------------------
function uipushtool13_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
image=MCecualizacion(image);
imshow(image);


% --------------------------------------------------------------------
function uipushtool22_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
h = msgbox(['Calculando...'],'Espera por favor');
image=MClineal(image);
close(h)
imshow(image);


% --------------------------------------------------------------------
function uipushtool23_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
h = msgbox(['Calculando...'],'Espera por favor');
image=MClogaritmica(image);
close(h)
imshow(image);


% --------------------------------------------------------------------
function uipushtool29_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
image=negativiza(image);
imshow(image);


% --------------------------------------------------------------------
function uipushtool25_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
h = msgbox(['Calculando...'],'Espera por favor');
image=L_bajo(image);
close(h)
imshow(image);


% --------------------------------------------------------------------
function uipushtool26_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
h = msgbox(['Calculando...'],'Espera por favor');
image=L_alto(image);
close(h)
imshow(image);


% --------------------------------------------------------------------
function uipushtool30_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
h = msgbox(['Calculando...'],'Espera por favor');
image=L_bordes(image);
close(h)
imshow(image);


% --------------------------------------------------------------------
function uipushtool31_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
h = msgbox(['Calculando...'],'Espera por favor');
image=NL_bordes(image);
close(h)
imshow(image);


% --------------------------------------------------------------------
function uipushtool32_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image imageorig
[sx,sy,sz]=size(imageorig);
image=imageorig;
imshow(image);
axis([1 sy 1 sx]);
sizewindow=get(handles.figure1,'Position');
getpixelposition(handles.imageGUI);
setpixelposition(handles.imageGUI,[0 sizewindow(4)-sx sy sx])


% --------------------------------------------------------------------
function uipushtool17_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image imageorig
h = msgbox(['Calculando...'],'Espera por favor');
image=L_aumento(image);
close(h);
imshow(image);
[sx,sy,sz]=size(image);
axis([1 sy 1 sx]);
sizewindow=get(handles.figure1,'Position');
getpixelposition(handles.imageGUI);
setpixelposition(handles.imageGUI,[0 sizewindow(4)-sx sy sx])

% --------------------------------------------------------------------
function uipushtool27_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image imageorig
h = msgbox(['Calculando...'],'Espera por favor');
image=NL_aumento(image);
close(h);
imshow(image);
[sx,sy,sz]=size(image);
axis([1 sy 1 sx]);
sizewindow=get(handles.figure1,'Position');
getpixelposition(handles.imageGUI);
setpixelposition(handles.imageGUI,[0 sizewindow(4)-sx sy sx])


% --------------------------------------------------------------------
function uipushtool33_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to uipushtool33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
h = msgbox(['Calculando...'],'Espera por favor');
image=reduccion(image,2);
close(h);
imshow(image);
[sx,sy,sz]=size(image);
axis([1 sy 1 sx]);
sizewindow=get(handles.figure1,'Position');
getpixelposition(handles.imageGUI);
setpixelposition(handles.imageGUI,[0 sizewindow(4)-sx sy sx])
