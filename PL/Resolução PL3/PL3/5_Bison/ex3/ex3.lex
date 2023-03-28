%{
    #include "ex3.tab.h"
%}

%option nounput
%option noinout
%option header-file="lex.yy.h"

%%
[0-9]+      {yylval.numero = atoi(yytext); yylval.tipo = INTEGER; return INT;}
[a-zA-Z]    {yylval.letter = yytext[0]; yylval.tipo = CHAR; return LETTER;}

=           return IGUAL;
\<          return MENOR;
\>          return MAIOR;
\<=         return MENOR_IGUAL;
\>=         return MAIOR_IGUAL;
\<\>        return DIFERENTE;
\n          return yytext[0];

%%