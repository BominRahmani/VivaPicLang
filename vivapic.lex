%{
#include "vivapic.h"
#include "vivapic.tab.h"
#include <stdio.h>
%}

%option noyywrap
%%
end          {return END; }
;            {printf("END_STATEMENT\n"); return END_STATEMENT; }
point        {printf("POINT"); return POINT; }
vector       {printf("VECTOR"); return VECTOR; }
circle       {printf("CIRCLE"); return CIRCLE; }
block        {printf("BLOCK"); return BLOCK; }
color_change {printf("COLOR_CHANGE"); return COLOR_CHANGE; }
[0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]        {yylval.i = atoi(yytext); printf("INT"); return INT; }
[ \t\n]       ;//ignore spaces when matched
.             {printf("invalid input");}

%%
