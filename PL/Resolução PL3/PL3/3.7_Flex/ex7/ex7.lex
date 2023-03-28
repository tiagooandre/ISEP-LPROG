%{

%}

%option nounput
%option noinput

DIG     [0-9]
DEC     -?{DIG}+[.]{DIG}+
ERROR   -?{DIG}+

%%

{DEC}   {printf("O decimal que apareceu foi: %s\n", yytext);}
{ERROR} {printf("Não é um número decimal.\n");}
.       {;}

%%

int main() {
    yylex();
    return 0;
}