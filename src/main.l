%{
#include <stdio.h>
unsigned int i=0;
%}

%%
[^ \@\t\n\.\-][A-z0-9\.\-\_]*[^ \.\-]@[^ \.\-][A-z0-9\.]*[^ \-]$ {
	printf("%s\n", yytext);
}

[^ \@\t\n\.\-][A-z0-9\.\-\_]*[^ \.\-]@[^ \.\-][A-z0-9\.]*[\.\?\!]  {
for (i=0; i<yyleng-1; i++){
	printf("%c", yytext[i]);
}
printf ("\n");
}

[^ \@\t\n\.\-][A-z0-9\.\-\_]*[^ \.\-]@[^ \.\-][A-z0-9\.]*[\-\_\+]  ;



[^ \@\t\n\.\-][A-z0-9\.\-\_]*[^ \.\-]@[^ \.\-][A-z0-9\.]* {	
	printf("%s\n", yytext);
}

\n ;
. ;

%%

int main() {
  yylex();
  return 0;
}
