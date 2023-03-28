%{
    #include "ex1.tab.h"
    extern int numErrors;
%}

%option nounput
%option noinput
%option header-file = "lex.yy.h" 

%%
HELLO|Hello|hello           return HELLO;
WORLD|World|world           return WORLD;
[ \t]                       return ESPACO;
.           {printf("Erro léxico: caracter desconhecido %s.\n", yytext);
                numErrors++;
            }
%%