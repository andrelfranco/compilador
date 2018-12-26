%{
#define YYSTYPE double
#include <stdio.h>
%}

%token NUM
%token FIM_LINHA
%token NEWLINE QUIT
%token SOMAR SUBTRAIR MULTIPLICAR DIVIDIR

%start calc

%%

calc:
		| calc line
;

line: NEWLINE { printf("NOVA LINHA!\n"); }
		| EXPRESSAO FIM_LINHA NEWLINE { printf("NOVA LINHA!\n");}
		| QUIT NEWLINE  { printf("Arquivo Aceito!\n"); exit(0);}
;

EXPRESSAO: NUM
		|	SUM 
		|	SUB
		|	MULT
		|	DIV
;

SUM: SOMAR '{' EXPRESSAO ',' EXPRESSAO '}' 
;

SUB: SUBTRAIR '{' EXPRESSAO ',' EXPRESSAO '}' 
;

MULT: MULTIPLICAR '{' EXPRESSAO ',' EXPRESSAO '}' 
;

DIV: DIVIDIR '{' EXPRESSAO ',' EXPRESSAO '}' 
;

%%

void yyerror (char const *s) {
	fprintf (stderr, "%s\n", s);
}