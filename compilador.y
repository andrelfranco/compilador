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
		| EXPRESSAO FIM_LINHA NEWLINE { printf("Resultado = %f\n", $$);}
		| QUIT NEWLINE  { printf("Arquivo Aceito!\n"); exit(0);}
;

EXPRESSAO: NUM {$$ = $1;}
		|	SOMAR '{' EXPRESSAO ',' EXPRESSAO '}' {$$ = $3 + $5;} 
		|	SUBTRAIR '{' EXPRESSAO ',' EXPRESSAO '}' {$$ = $3 - $5;}
		|	MULTIPLICAR '{' EXPRESSAO ',' EXPRESSAO '}' {$$ = $3 * $5;}
		|	DIVIDIR '{' EXPRESSAO ',' EXPRESSAO '}' {$$ = $3 / $5;}
;


%%

void yyerror (char const *s) {
	fprintf (stderr, "%s\n", s);
}