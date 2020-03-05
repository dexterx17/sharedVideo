#ifndef MAIN_H
#define MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

#ifdef _WIN32
#   ifdef BUILDING_DLL
#       define DLL_IMPORT_EXPORT __declspec(dllexport)
#   else
#       define DLL_IMPORT_EXPORT __declspec(dllimport)
#   endif
#else
#   define DLL_IMPORT_EXPORT
#endif

DLL_IMPORT_EXPORT int abrirMemoria(char *nombre, int tipo);
DLL_IMPORT_EXPORT int abrirMemoriaString(char *nombre, int cantPalabras);

DLL_IMPORT_EXPORT int readIntValue(char *nomMemoria, int posicion);
DLL_IMPORT_EXPORT void writeIntValue(char *nomMemoria, int posicion,int valor);
DLL_IMPORT_EXPORT void writeFloatValue(char *nomMemoria, int posicion, float valor);
DLL_IMPORT_EXPORT float readFloatValue(char *nomMemoria, int posicion);
DLL_IMPORT_EXPORT void writeDoubleValue(char *nomMemoria, int posicion, double valor);
DLL_IMPORT_EXPORT double readDoubleValue(char *nomMemoria, int posicion);
DLL_IMPORT_EXPORT void writeStringValue(char *nomMemoria, int posicion, char *str);
DLL_IMPORT_EXPORT void readStringValue(char *nomMemoria, int posicion, char *str);
DLL_IMPORT_EXPORT void rStringValMatlab(char *nomMemoria, int posicion, char **str);

DLL_IMPORT_EXPORT int gestMemoria(int cantidad);
DLL_IMPORT_EXPORT int crearMemoria(char *nombre, int cantidad, int tipo);
DLL_IMPORT_EXPORT void liberarMemorias();

#ifdef __cplusplus
}
#endif

#endif