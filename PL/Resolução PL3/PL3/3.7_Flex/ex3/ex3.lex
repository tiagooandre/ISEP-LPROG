%{

%}

%option nounput
%option noinput

MAT1	[a-zA-Z]{2}-[0-9]{2}-[0-9]{2}
MAT2	[0-9]{2}-[0-9]{2}-[a-zA-Z]{2}
MAT3	[0-9]{2}-[a-zA-Z]{2}-[0-9]{2}
MAT4	[a-zA-Z]{2}-[0-9]{2}-[a-zA-Z]{2}

MAT		({MAT1}|{MAT2}|{MAT3}|{MAT4})

%%

{MAT} {
    printf("Valida. %s", yytext);
}

.* {
    printf("Invalida. %s", yytext);
}

\n {
    printf("\n");
}

%%

int main () {
    yylex();
    return 0;
}