src_name = vivapic
exe_name = viva
CC = gcc

all: viva

viva: ${src_name}.tab.c lex.yy.c
	${CC} ${src_name}.tab.c lex.yy.c vivapic.c -lSDL2 -lm -o ${exe_name}

lex.yy.c: ${src_name}.tab.h ${src_name}.lex
	flex ${src_name}.lex

${src_name}.tab.c ${src_name}.tab.h: vivapic.y
	bison -d ${src_name}.y

clean:
	rm -f ${exe_name} *.tab.h *.tab.c *.yy.c *.o
