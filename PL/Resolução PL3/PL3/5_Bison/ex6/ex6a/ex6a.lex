%{
    #include "ex6a.tab.h"
    extern int numErros;
%}

%option nounput
%option noinput
%option header-file = "lex.yy.h"

%%
€                   { return EURO; }

/* só aceita as seguintes moedas */
0.01 |
0.02 |
0.05 |
0.10 |
0.20 |
0.50 |
1.00 |
2.00                { yylval = (int)100.0 * atof(yytext); return MOEDA; }

/*uma forma de fazer */
cafe                { yylval = 35; return CAFE; }
pingo               { yylval = 35; return PINGO; }
copo               { yylval = 5; return COPO; }
chocolate               { yylval = 40; return CHOCOLATE; }
cha               { yylval = 35; return CHA; }
leite               { yylval = 30; return LEITE; }

","                 { return yytext[0]; }

[\t\r]              /* ignora */
\n                  { return yytext[0]; }
.                   printf("\nErro lexico: token <%s> desconhecido!", yytext); numErros++;

%%