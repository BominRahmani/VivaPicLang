%{
#include <stdio.h>
#include "vivapic.h"
void yyerror(const char* msg);
setup(); //this calls in the setup from header
int yylex();
%}

%define parse.error verbose
%start statement_list

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
statement_list: statement end
              | statement statement_list
;

statement: vector | color_change | point | circle | block
;

circle: CIRCLE INT INT INT end_statement
        {circle($2,$3,$4);}
;

vector: VECTOR INT INT INT INT end_statement
        {vector($2,$3,$4,$5);}
;

color_change: COLOR_CHANGE INT INT INT end_statement
        {//check for validity of ints
     if($2 < 0 || $3 < 0 || $4 < 0 || $2 >= 256 || $3 >= 256 || $4 >= 256){
     printf("Invalid input");
     }
     else{
     color_change($2,$3,$4);
     }
    }
;

point: POINT INT INT end_statement
    {
         if($2 < 0 || $3 < 0 || $2 >= 512 || $3 >= 384){
      printf("Invalid input");
      }
      else{
      point($2,$3);
      }
   }

;

block: BLOCK INT INT INT INT end_statement
    {block($2,$3,$4,$5);}
;

end_statement: END_STATEMENT
;

end: END
   {finish();}
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



