%{
    #include <stdio.h>
    #include "lex.yy.h"
    int numErrors = 0;
    void yyerror(char *s);
    void pvalue(int n);
%}

%token INT IGUAL MAIOR MENOR MENOR_IGUAL MAIOR_IGUAL DIFERENTE

%%
ficheiro:
            | linha_ficheiro;

linha_ficheiro: expr '\n'       {pvalue($1);}
                | '\n'  ;           //Para não dar erro nas linhas vazias

expr:   expIGUAL | expMAIOR | expMENOR | expMENORIGUAL | expMAIORIGUAL | expDIFERENTE | expWRONG;

expIGUAL:   INT IGUAL INT {$$ = ($1 == $3);};

expMAIOR:   INT MAIOR INT {$$ = ($1 > $3);} ;

expMENOR:   INT MENOR INT {$$ = ($1 < $3);} ;

expMENORIGUAL:  INT MENOR_IGUAL INT {$$ = ($1 <= $3);}  ;

expMAIORIGUAL:  INT MAIOR_IGUAL INT {$$ = ($1 >= $3);}  ;

expDIFERENTE:   INT DIFERENTE INT   {$$ = ($1 != $3);}  ;

operador:   IGUAL | MAIOR | MENOR | MAIOR_IGUAL | MENOR_IGUAL | DIFERENTE   ;

expWRONG:   allWrong    {$$ = 2;}   ;

allWrong: operador | INT | INT INT | operador operador | INT operador | operador INT | operador INT INT | INT INT operador ;

%%
int main () {
    yyparse();
    return 0;
}

void yyerror(char *s) {
    numErrors++;
    printf("Erro semântico - %s\n", s);
}

void pvalue(int n) {
    switch(n) {
        case 0:
            printf(" - Falso. \n");
            break;
        
        case 1:
            printf(" - Verdadeiro. \n");
            break;
        
        case 2:
            printf(" - Erro de Sintaxe. \n");
            break;
    }
}