%cargamos la memoria compartida
loadlibrary('smClient64.dll','./main.h');
%creamos dos memorias(x,y) para cada canal de color(black,red,gren,blue)
calllib('smClient64','gestMemoria',3);

%Obtencion de datos de imagen
%width_image = 300;
%height_image = 300;

imagen  = imread('test.jpg');
[height_image, width_image, numberOfColorChannels] = size(imagen)


%Obtencion del tamaña del array para cada canal
memory_size = width_image * height_image;

% creamos un array para transmitir el valor X,Y del canal del color negro
calllib('smClient64','crearMemoria','red',memory_size,1);
calllib('smClient64','crearMemoria','green',memory_size,1);
calllib('smClient64','crearMemoria','blue',memory_size,1);

%abrimos la memoria compartida de tipo enteros para poder escribir los
%datos de cada pixel en X,Y
calllib('smClient64','abrirMemoria','red',1);
calllib('smClient64','abrirMemoria','green',1);
calllib('smClient64','abrirMemoria','blue',1);


counter=0;


for c = 1:width_image
    for r = 1:height_image
        red=imagen(r,c,1);
        green=imagen(r,c,2);
        blue=imagen(r,c,3);
        
        calllib('smClient64','writeIntValue','red',counter,red);
        calllib('smClient64','writeIntValue','green',counter,green);
        calllib('smClient64','writeIntValue','blue',counter,blue);
        counter=counter+1;
        
    end
    fprintf("pixel: " + c + "_" + r + "__"+counter+"__:" + red+"/"+green+"/"+blue+"\n")
end