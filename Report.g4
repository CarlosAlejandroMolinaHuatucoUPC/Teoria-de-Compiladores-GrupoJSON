grammar Report;

program
    : reporte EOF
    ;

reporte
    : 'report' STRING '{' section+ '}'
    ;

section
    : header
    | body
    | footer
    ;

header
    : 'header' '{' statement+ '}'
    ;

body
    : 'body' '{' statement+ '}'
    ;

footer
    : 'footer' '{' statement+ '}'
    ;

statement
    : print
    | assign
    | conditional
    | loop
    ;

print
    : 'print' '(' expressionList ')' ';'
    ;

assign
    : ID '=' expression ';'
    ;

conditional
    : 'if' '(' expression ')' '{' statement+ '}'
      ('else' '{' statement+ '}')?
    ;

loop
    : 'loop' '(' expression ')' '{' statement+ '}'
    ;

expressionList
    : expression (',' expression)*
    ;

expression
    : comparison
    | functionCall
    | primaryExpression
    ;

comparison
    : primaryExpression (MAYOR | MENOR | IGUAL) primaryExpression
    ;

functionCall
    : primaryExpression '(' expressionList? ')'
    ;

primaryExpression
    : STRING
    | number // Añadido
    | id     // Añadido
    | BOOLEAN
    ;

id: ID ('.' ID | arrayIndex)* ;
number: NUMBER ;
arrayIndex
    : '[' expression ']'
    ;

BOOLEAN : 'true' | 'false';
MENOR: '<' ;
MAYOR: '>' ;
IGUAL: '==' ;
LPAR: '(' ;
RPAR: ')' ;
LBRACK: '[';
RBRACK: ']';
ID : [a-zA-Z_][a-zA-Z0-9_]* ;
NUMBER: [0-9]+ ('.' [0-9]+)? ;
STRING: '"' (~["\r\n])* '"' ;
WS: [ \t\r\n]+ -> skip;
