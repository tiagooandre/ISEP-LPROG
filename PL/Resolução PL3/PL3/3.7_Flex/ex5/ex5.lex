%{

%}

%option nounput
%option noinput

NAT     [0-9]+

%%

{NAT}   {printf("Num. Natural: %s\n", yytext);}
.       {;}

%%

int main() {
    yylex();
    return 0;
}