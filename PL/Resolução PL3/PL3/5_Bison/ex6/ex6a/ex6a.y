%{
    #include "lex.yy.h"
    void yyerror(const char *s);
    int numErros = 0;
    void dar_troco(int troco);
    char nome_prod[30];
%}

%token EURO
%token CHA LEITE CAFE PINGO COPO CHOCOLATE

%define parse.trace

%token MOEDA

%%
inicio :
        | inicio pedido ;

pedido :    produto ',' dinheiro '\n'       {if ($1 <= $3) { dar_troco($3-$1);} else {printf("Dinheiro insuficiente!\n");}}
        |   error '\n'                      {yyerrok;}              /* força mensagem de erro */
        ;

dinheiro :  EURO MOEDA                      { $$ = $2; }
        |   dinheiro ',' EURO MOEDA         { $$ = $1 + $4; };

produto :   CHA                             { strcpy(nome_prod, "Chá"); }
        |   LEITE                             { strcpy(nome_prod, "Leite"); }
        |   CAFE                             { strcpy(nome_prod, "Café"); }
        |   PINGO                             { strcpy(nome_prod, "Pingo"); }
        |   CHOCOLATE                             { strcpy(nome_prod, "Chocolate"); }
        |   COPO                             { strcpy(nome_prod, "Copo"); }
        ;

%%

int main() {
    yydebug = 1;
    printf("Máquina de vending do CPC \n");
    yyparse();
}

void dar_troco(int troco) {
    int moedas[] = {200, 100, 50, 20, 10, 5, 2, 1};
    int curr = 0;
    printf("%s", nome_prod);
    while ((troco > 0) && (curr >= 7)) {
        while (troco >= moedas[curr]) {
            troco -= moedas[curr];
            printf(",€%d.%02d", moedas[curr]/100, moedas[curr]%100);
        };
        curr++;
    }
    printf("\n");
}