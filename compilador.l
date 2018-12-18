/* scanner for a toy Pascal-like language */

%{
#include <math.h>
#include "bison.h"
extern YYSTYPE yylval;
%}

%%

[0-9]*\.?[0-9]*       {
                printf( "numero: %s (%d)\n", yytext,
                        atoi( yytext ) );
                return NUM;
                }

somar|subtrair|multiplicar|dividir	        {
                printf( "Função: %s\n", yytext );
                return FUNCAO;
                }

"{"	{
            printf("Parâmetros da funcao: $s \n", yytext);
            return '{';
        }
"}" {
            printf("Parâmetros da funcao: $s \n", yytext);
            return '}';
        }

[ \t\n\r]+	printf("Espaço ou quebra de linha: %s", yytext);

"?"	{
        printf("Final de linha: %s\n", yytext);
        return FIM_LINHA;
    }

"," {
        printf("Separador de parametro: %s\n", yytext);
        return ',';

    }

.	printf( "Unrecognized character: %s\n", yytext );


%%

int main( int argc, char **argv )
{
    ++argv, --argc;
    if ( argc > 0 )
            yyin = fopen( argv[0], "r" );
    else
            yyin = stdin;

    yyparse();
}