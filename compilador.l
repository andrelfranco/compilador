/* scanner for a toy Pascal-like language */

%{
#include <math.h>
#include "bison.h"
extern YYSTYPE yylval;
%}

%%

[0-9]*\.?[0-9]*       {
	sscanf(yytext, "%lf", &yylval);
	return NUM;
}

somar           {return SOMAR;}
subtrair        {return SUBTRAIR;}
multiplicar     {return MULTIPLICAR;}
dividir         {return DIVIDIR;}


"{" {return '{';}
"}" {return '}';}

"?" {return FIM_LINHA;}

"," {return ',';}

[\n] {return NEWLINE;}

"exit"      {return QUIT;}

.   ;


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