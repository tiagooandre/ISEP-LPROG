%{

%}

%option nounput
%option noinput

DIG     [0-9]
INT     -?{DIG}+
ERROR   {INT}[.]{INT}

%%

{INT}   {printf("O inteiro que apareceu foi: %s\n", yytext);}
{ERROR} {printf("Não é um número inteiro.\n");}
.       {;}

%%

int main () {
    yylex();
    return 0;
}