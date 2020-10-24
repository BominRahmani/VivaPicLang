%{
#include <stdio.h>
#include "vivapic.h"
void yyerror(const char* msg);
setup(); //this calls in the setup from header
int yylex();
%}

%define parse.error verbose
%start color_change | vector | point | circle | block

%union{
    int i;
    float f;
    }

%token COLOR_CHANGE
%token END_STATEMENT
%token END
%token POINT
%token VECTOR
%token CIRCLE
%token BLOCK
%token INT
%token FLOAT

%type<i> INT
%type<f> FLOAT

%%

POINT: INT INT
     | FLOAT FLOAT
;
VECTOR: INT INT INT INT 
    {vector($1,$2,$3,$4);}
;
CIRCLE: INT INT INT
    {circle($1,$2,$3);}
;
BLOCK: INT INT INT INT
     {block($1,$2,$3,$4);}
;
COLOR_CHANGE: INT INT INT
    {color_change($1,$2,$3);}
;
END_STATEMENT: END
;
%%

int main(int argc, char** argv){
printf("oh boy here we go");
yyparse();
return 0;
}

void yyerror(const char* msg){
fprintf(stderr, "ERROR! %s\n", msg);
}



