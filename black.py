from ctypes import *
import os
import platform
import numpy
import time

from PIL import Image

if __name__ == '__main__':
    # Busqueda de la dll en la carpeta de windows
    # 32 bits = smClient.dll
    # 64 bits = smClient64.dll
    dll = 'smClient64.dll'  # Especificar si se desea utilizar la libreria de 32 o 64 bits

    # Especificacion de la carpeta de carga de la libreria
    system32 = os.path.join(os.environ['SystemRoot'], 'SysNative' if
    platform.architecture()[0] == '32bit' else 'System32')
    dllPath = os.path.join(system32, dll)

    # Carga de la libreria
    mydll = cdll.LoadLibrary(dllPath)
    
    ###################################### Trabajar con memoria de tipo entero ###################################
    ## Abrir memoria tipo entero
    memoria = b'black'  # Nombre de la memoria
    tipo = int(1)  # el 1 indica que se abrira una memoria de tipo entero
    abrir = mydll.abrirMemoria(memoria, tipo)
    print(abrir)

    width=240
    height=320
    
    while True:
        time.sleep(3)
        counter=0
        data = numpy.zeros((width, height, 3), dtype=numpy.uint8)

        for y in xrange(0,height):
            for x in xrange(0,width):
                ## Leer en memoria tipo entero
                # Parametros son: el nombre de la memoria, posicion que se desee leer
                leer = mydll.readIntValue(memoria, int(counter))
                #print(leer)
                data[x,y]=[leer,leer,leer]
                counter+=1

        image = Image.fromarray(data)
        image.show()