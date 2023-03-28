%{
    int numAlgarismos = 0;
    int numLetras = 0;
    int numSpaces = 0;
    int numLinhas = 0;
    int numOthers = 0;
    
%}

%option nounput
%option noinput

ALG     [0-9]
LET     [A-Za-z]

%%
{ALG}   {numAlgarismos++;}
{LET}   {numLetras++;}
[ \t]   {numSpaces++;}
\n      {numLinhas++;}
.       {numOthers++;}
%%

int main() {
    yylex();
    printf("Num. de Algarismos: %d\n", numAlgarismos);
    printf("Num. de Letras: %d\n", numLetras);
    printf("Num. de Spaces: %d\n", numSpaces);
    printf("Num. de Linhas: %d\n", numLinhas);
    printf("Num. de Others: %d\n", numOthers);
    return 0;
}