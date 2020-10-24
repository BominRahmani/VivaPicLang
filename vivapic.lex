%{
#include <stdio.h>
#include "vivapic.h"

%}
%option noyywrap
%%
end      {return END; }
;        {printf("END_STATEMENT\n"); return END_STATEMENT; }
point       {printf("POINT"); return POINT; }
vector      {printf("VECTOR"); return VECTOR; }
circle      {printf("CIRCLE"); return CIRCLE; }
block       {printf("BLOCK"); return BLOCK; }
color_change {printf("COLOR_CHANGE"); return COLOR_CHANGE; }
[0-9]       {printf("INT"); return INT; }
[+-]?([0-9]*[.])?[0-9]+       {printf("FLOAT"); return FLOAT; }
[ \t\n]       ;//ignore spaces when matched
.             {printf("invalid input");}

%%


int main(int argc, char **argv){
yylex();
}
