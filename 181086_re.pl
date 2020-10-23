#!/usr/bin/perl

#/-----------------------------------------------\
#| 181086_conjuntos.pl                           |
#| Rodrigo Alejandro Ortiz Muñiz                 |
#| Universidad Politécnica de San Luis Potosí	 |
#| Profesor: Juan Carlos Gonzáles Ibarra         |
#| Descripción: Un programa para generar algo    |
#| parecido a un compilador en la manera de      |
#| evaluar texto introducido para comprobar una  |
#| sintaxis adecuada.                            |
#\-----------------------------------------------/

#use strict;
#use warnings;

#tokens is an array or list, everything will be added to tokens
my @tokens = ();
#the source code string is separated into words using spaces as criteria
my @source_code = split /\s+/,'int result = 100;';
print "\n\n";
#for every word in the source_code array we'll be checking if it matches a certain regex
for my $word (@source_code){
	#in this part we don't use regex, it's not really needed
	if($word eq 'int' or $word eq 'str' or $word eq 'bool' ){
		push(@tokens,"[['DATATYPE', '",$word,"'], ");
	}else{
		#from here on, it's needed to use regex to determine if the string matches
		if($word =~ /[a-z]/ or $word =~ /[A-Z]/){
			push(@tokens,"['IDENTIFIER', '",$word,"'], ");
		}else{
			if($word =~ /\+|\-|\*|\/|\=/){
				push(@tokens,"['OPERATOR', '",$word,"'], ");
			}else{
				if($word =~ /[0-9]/){
					#the string is reversed, and if ';' is in the beggining of the string,
					# which would mean it's in the end of the normal string, the last character is removed
					# that last character would be the ';'
					if(index(reverse($word),';') == 0){
						chop($word);
						push(@tokens,"['INTEGER', '",$word,"'], ");
						push(@tokens,"['END_STATEMENT', ';']]");
					}else{
						push(@tokens,"['INTEGER', '",$word,"']]");
					}
				}					
			}
		}
	}
}
print @tokens;

#this is just the implementation of the following subroutine
if(variablePROLOG("Hola")){
	print("\n\n\n'Hola' is a PROLOG variable");
}


#the subroutine variablePROLOG is to be able to know if a string is an actual PROLOG variable, if it matches accordingly
sub variablePROLOG{
	my ($word)=@_;
	if(($word[0]=~/^[a-zA-Z]$/ and $word[0]=~/[A-Z]/) or $word[0]=="_"){
		my $drow = reverse($word);
		chop($drow);
		$word= reverse($drow);
		while($word and ($word[0]=~ /^[A-Za-z0-9]$/ or $word[0]=="_")){
			$drow = reverse($word);
			chop($drow);
			$word= reverse($drow);
			if($word==""){
				return 1;
				#if i remember correctly, every actual value means TRUE on perl ...
			}
		}
	}
	#... and only nothing and undef values mean FALSE
	return undef;
}

