%{
#include <stdio.h>
#include <string.h>

void imprimir_resultado(const char* texto, const char* resultado) {
    char buffer[512];
    strncpy(buffer, texto, sizeof(buffer) - 1);
    buffer[sizeof(buffer) - 1] = '\0';
    
    // limpiar saltos de linea en caso de haberlos 
    buffer[strcspn(buffer, "\r\n")] = 0; 
    
    printf("%s == %s\n", buffer, resultado);
}
%}

/*Flex (-lfl) */
%option noyywrap

/* Definiciones regulares */

ESP     [ \t]*
SIGNO   [-+]
DIGITO  [0-9]

/* Reconoce enteros y decimales */
DECIMAL ({DIGITO}+(\.{DIGITO}+)?|\.{DIGITO}+)

/* Reconoce la notación científica permitiendo espacios */
EXP     [eE]{ESP}{SIGNO}?{ESP}{DIGITO}+

/* Un número real es un decimal seguido opcionalmente por un exponente */
NUM     {DECIMAL}({ESP}{EXP})?

/* Posibles letras para la parte imaginaria */
IMAG    [iIjJ]


/*   Ej: 1.3 e -12 + 2.34 I */
COMPLEJO_COMPLETO ({SIGNO}{ESP})?{NUM}{ESP}{SIGNO}{ESP}({NUM}{ESP})?{IMAG}

/*   Ej: 0.13 J */
IMAGINARIO_PURO   ({SIGNO}{ESP})?({NUM}{ESP})?{IMAG}

%%


^{ESP}{COMPLEJO_COMPLETO}{ESP}\r?$   { imprimir_resultado(yytext, "ACEPTA"); }
^{ESP}{IMAGINARIO_PURO}{ESP}\r?$     { imprimir_resultado(yytext, "ACEPTA"); }
^[^\n]+$                             { imprimir_resultado(yytext, "NO ACEPTA"); }
\n                                   { /* Ignorar líneas vacías */ }

%%

int main(int argc, char **argv) {
    // Abrir el archivo de texto
    FILE *archivo = fopen("Entrada.txt", "r");
    if (!archivo) {
        printf("El Archivo no es valido o hay un priblema con: 'Entrada.txt'.\n");
        return 1;
    }
    
    yyin = archivo;
    
    yylex();
    
    fclose(archivo);
    
    return 0;
}
