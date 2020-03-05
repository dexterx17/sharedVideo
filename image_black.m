%cargamos la memoria compartida
loadlibrary('smClient64.dll','./main.h');

%Obtencion de datos de imagen
%width_image = 300;
%height_image = 300;

imagen  = imread('gray.jpg');
[height_image, width_image, numberOfColorChannels] = size(imagen)

%creamos una memoria para cada canal de color(black,red,gren,blue)
calllib('smClient64','gestMemoria',numberOfColorChannels);

%Obtencion del tamaña del array para cada canal
memory_size = width_image * height_image

% creamos un array para transmitir el valor del canal del color negro
calllib('smClient64','crearMemoria','black',memory_size,1);

%abrimos la memoria compartida de tipo enteros para poder escribir los
%datos de cada pixel
calllib('smClient64','abrirMemoria','black',1);

counter=0;

for c = 1:width_image
    for r = 1:height_image
        pixel=imagen(r,c)
        %fprintf(r+" : "+c+"\n");
        calllib('smClient64','writeIntValue','black',counter,pixel)
        %fprintf("pixel: " + c + "_" + r + "__"+counter+"__:" + pixel+"\n")
        counter=counter+1;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%% LIBERAR LA LIBRERIA %%%%%%%%%%%%%%%%%%%%%%%%
unloadlibrary smClient64

% Display the frame in a figure window.
image(imagen);

