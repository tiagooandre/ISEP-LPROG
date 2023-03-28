%{
    #include <stdio.h>
    #include "ex5.tab.h"
    extern int nErr;
%}

%option nounput
%option noinput
%option header-file = "lex.yy.h"

%%

[a-z]               {yylval.num = yytext[0]-'a'; return ID;}
[A-Z]               {yylval.num = yytext[0]-'A'; return ID;}
[0-9]+              {yylval.real = atof(yytext); return INT;}
[0-9]+\.[0-9]+      {yylval.real = atof(yytext); return REAL;}
\+                  return ADD;
-                   return SUB;
\*                  return PROD;
\/                  return DIV;
\(                  return OPENBR;
\)                  return CLOSEBR;
=                   return IGUAL;
\n                  return yytext[0];

%%