%{
    #include <stdio.h>
    int numErrors = 0;
    #include "lex.yy.h"
    void yyerror(char *s);
%}

%token HELLO WORLD ESPACO

%%
texto:  texto linha
        | ;

linha: HELLO ESPACO WORLD  {printf("Hello World!!!\n");} ;

%%

int main () {
    yyparse();
    if (numErrors == 0) {
        printf("Frase válida!\n");
    } else {
        printf("Frase inválida.\n");
    }
    return 0;
}

void yyerror(char *s) {
    printf("Erro sintático.%s\n", s);
}