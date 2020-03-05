%cargamos la memoria compartida
loadlibrary('smClient64.dll','./main.h');

%Obtencion de datos de imagen
width_image = 320;
height_image = 240;
numberOfColorChannels = 3;

%Obtencion del tamaña del array para cada canal
memory_size = width_image * height_image

%creamos una memoria para cada canal de color(black,red,gren,blue)
calllib('smClient64','gestMemoria',numberOfColorChannels);

% creamos un array para transmitir el valor del canal del color negro
calllib('smClient64','crearMemoria','black',memory_size,1);

%abrimos la memoria compartida de tipo enteros para poder escribir los
%datos de cada pixel
calllib('smClient64','abrirMemoria','black',1);


% Connect to the webcam.
 cam = webcam(1)
 cam.Resolution = '320x240';
%
while true
    pause(1)
    frame = snapshot(cam);
     %size(frame)
    % 
    % % Display the frame in a figure window.
    % image(frame);
    % 
      counter=0;
    % % 
      for c = 1:width_image
          for r = 1:height_image
              pixel=frame(r,c);
    % %         fprintf(r+" : "+c+"\n");
             calllib('smClient64','writeIntValue','black',counter,pixel)
    %          fprintf("pixel: " + c + "_" + r + "__"+counter+"__:" + pixel+"\n")
              counter=counter+1;
          end
      end
    % 
    % % Display the frame in a figure window.
     image(frame);
end

 % Liberando camara
clear cam

%%%%%%%%%%%%%%%%%%%%%%%%% LIBERAR LA LIBRERIA %%%%%%%%%%%%%%%%%%%%%%%%
unloadlibrary smClient64
