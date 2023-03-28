%{
 int aCount=0; 
%} 
%option nounput  
%option noinput  
%%
a  aCount++; 
%%
             int main()
             {
              yylex( ) ;
              printf("Number of 'a's: %d\n" , aCount);
	      return 0;  
	      }
