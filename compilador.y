%{
#define YYSTYPE double
#include <stdio.h>
%}

%token FUNCAO
%token NUM
%token FIM_LINHA

%%


EXPRESSAO: NUM
		|	FUNCAO '{' NUM ',' NUM '}' FIM_LINHA
		|	FUNCAO '{' EXPRESSAO ',' NUM '}' FIM_LINHA
		|	FUNCAO '{' NUM ',' EXPRESSAO '}' FIM_LINHA
		|	FUNCAO '{' EXPRESSAO ',' EXPRESSAO '}' FIM_LINHA
;

%%

void yyerror (char const *s) {
	fprintf (stderr, "%s\n", s);
}