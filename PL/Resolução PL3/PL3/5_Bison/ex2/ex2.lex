%{
    #include "ex2.tab.h"
    extern int numErrors;
%}

%option nounput
%option noinput
%option header-file = "lex.yy.h" 

%%
[ |\t]  ;
\n      return yytext[0];
[0-9]+  {yylval = atoi(yytext); return INT;}                //atoi converte de string para inteiro
=       return IGUAL;
\<      return MENOR;
\>      return MAIOR;
\<=     return MENOR_IGUAL;
\>=     return MAIOR_IGUAL;
\<\>    return DIFERENTE;
.       {printf("Erro léxico: símbolo desconhecido %s\n", yytext);  numErrors++;}
<<EOF>> return 0;
