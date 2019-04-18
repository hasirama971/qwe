%{
	unsigned charCount = 0, wordCount = 0, lineCount = 0;

%}
word [^ \t\n]+
eol \n

%%
{word} { wordCount++; charCount += yyleng; }
{eol} {charCount++; lineCount++;}
	charCount++;
%%

main(){
	yyin = fopen("input.txt","r");
	yylex();
	printf("%d %d %d\n",lineCount,wordCount,charCount);
	
}
int yywrap(){
return 1;
}