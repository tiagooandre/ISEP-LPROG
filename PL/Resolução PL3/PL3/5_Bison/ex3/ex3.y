%code requires {
    #define YYSTYPE SValor
    typedef enum {INTEGER, CHAR} ETipo;
    typedef struct {
        int numero;
        char letter;
        ETipo tipo;
    } SValor;
}

%code {
    #include <stdio.h>
    #include "lex.yy.h"
    void yyerror(char *s);
    void compara(SValor, int, SValor);
    int nErr = 0;
}

%token INT LETTER IGUAL MAIOR MENOR MAIOR_IGUAL MENOR_IGUAL DIFERENTE

%start ficheiro

%%
ficheiro : 
        | ficheiro line;

line :  exprs '\n'  {printf("\n");}
        | '\n'
        | error     {yyerror("Erro de sintaxe");} ;

exprs : operand IGUAL operand   { compara($1, IGUAL, $3); $$=$3;}
        | operand MAIOR operand { compara($1, MAIOR, $3); $$=$3;}
        | operand MENOR operand { compara($1, MENOR, $3); $$=$3;}
        | operand MAIOR_IGUAL operand {compara($1, MAIOR_IGUAL, $3); $$=$3; }
        | operand MENOR_IGUAL operand {compara($1, MENOR_IGUAL, $3); $$=$3; }
        | operand DIFERENTE operand {compara($1, DIFERENTE, $3); $$=$3; }
        | exprs IGUAL operand   { compara($1, IGUAL, $3); $$=$3;}
        | exprs MAIOR operand { compara($1, MAIOR, $3); $$=$3;}
        | exprs MENOR operand { compara($1, MENOR, $3); $$=$3;}
        | exprs MAIOR_IGUAL operand {compara($1, MAIOR_IGUAL, $3); $$=$3; }
        | exprs MENOR_IGUAL operand {compara($1, MENOR_IGUAL, $3); $$=$3; }
        | exprs DIFERENTE operand {compara($1, DIFERENTE, $3); $$=$3; }
        ;

operand :   INT
        |   LETTER
        ;

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(char *s) {
    nErr++;
    printf("erro sintatico/semantico: %s\n", s);
}

void compara (SValor v1, int op, SValor v2) {
    int vlogico;
    int op1, op2;
    if (v1.tipo != v2.tipo) {
        printf("Incompativel.");
    } else {
        if (v1.tipo == INTEGER) {
            op1 = v1.numero;
            op2 = v2.numero;
        } else {
            op1 = (int)v1.letter;
            op2 = (int)v2.letter;
        }
    }
    ;
    switch(op) {
        case IGUAL: vlogico = (op1 == op2); break;
        case MAIOR: vlogico = (op1 > op2); break;
        case MENOR: vlogico = (op1 < op2); break;
        case MAIOR_IGUAL: vlogico = (op1 >= op2); break;
        case MENOR_IGUAL: vlogico = (op1 <= op2); break;
        case DIFERENTE: vlogico = (op1 != op2); break;
    }
    printf((vlogico==1)?"Verdadeiro":"Falso");
}