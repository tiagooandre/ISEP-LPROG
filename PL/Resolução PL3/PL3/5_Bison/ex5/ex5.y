%code {
    #include "lex.yy.h"
    void yyerror(char *s);
    int nErr = 0;
    float memoria[26] = {0};
    float calcula(floast, int, float);
    void setValor(int, float);
    float getValor(int);
}

%union {
    float real;
    int num;
};

%token <real> INT REAL ADD SUB PROD DIV OPENBR CLOSEBR IGUAL
%token <num> ID
%type <real> e s

/* grammar with operator precedence */
%left ADD SUB
%left PROD DIV

/* grammar with operator precedence */

%start FULL

%%
FULL :  |
        FULL s '\n'                 { printf("Result = %.5f\n", $2); }
        ;

s :     ID IGUAL e                  { setValor($1, $3); $$ = $3; }
        | e
        ;

e :     e ADD e                     { $$ = calcula($1, ADD, $3); }
        | e SUB e                     { $$ = calcula($1, SUB, $3); }
        | e PROD e                     { $$ = calcula($1, PROD, $3); }
        | e DIV e                     { $$ = calcula($1, DIV, $3); }
        | SUB e                     { $$ = -$2; }
        | OPENBR e CLOSEBR                    { $$ = $2; }
        | ID                     { $$ = getValor($1); }
        | INT | REAL
        ;

%%

int main() {
    yyparse();
    return 0;
}

void setValor(int x, float y) {
    memoria[x] = y;
}

float getValor(int x) {
    return(memoria[x]);
}

float calcula (float v1, int op, float v2) {
    float aux;
    switch(op) {
        case ADD:
            aux = v1 + v2;
            break;
        case SUB:
            aux = v1 - v2;
            break;
        case PROD:
            aux = v1 * v2;
            break;
        case DIV:
            aux = v1 / v2;
            break;
    }
    return aux;
}