#!/usr/bin/perl

#/-----------------------------------------------\
#| 181086_NFA.pl                                 |
#| Rodrigo Alejandro Ortiz Muñiz                 |
#| Universidad Politécnica de San Luis Potosí	 |
#| Profesor: Juan Carlos Gonzáles Ibarra         |
#| Descripción: Un programa para utilizar        |
#| y crear un autómata finito que satisfaga la   |
#| expresión regular a*ba*                       |
#\-----------------------------------------------/

#use strict;
#use warnings;
#it starts essentially the same as the last program.
our $simbolo = "";
our $Fin = "";
our $estado = 0;
#it is necessary for us to use this two variables in a global scale

#i moved these 3 subroutines above to be able to check the caracter subroutine without too much trouble.
sub encabezado{
	print("\n|  Edo. Actual	|Caracter| Simbolo 	| Edo. Sig   | ");
	body();
}	
sub contenido{
	my ($estadosig, $character, $simbolo, $estado) = @_;
	print ("\n|	",$_[0],"	| ",$_[1],"	 | ",$_[2],"		|  ",$_[3],"	     | ");
	body();
}
sub body{
	print("\n+---------------+--------+--------------+------------+");
}


#the first change we notice is that the regex' are no longer numbers and operators
sub caracter{
	$simbolo = "";
	$Fin = "";
	my ($char)=@_;	
	if($_[0] =~/a/){	
		$simbolo = "a";
		return 0;
	}else{
		if($_[0]=~/b/){
				$simbolo = "b";
				return 1;
		}
		else{	# if it's neither a nor b the character will not be valid
				$simbolo = "No valido";
				return 2;
				exit();
		}
	}
	
}
#MAIN
#this table is another change made to the last program, it is essentially all we need, 2 means error and 0 and 1 are valid states.
my @tabla= ([0,1,2],[1,2,2]);
my $estado=0;
$simbolo="";
print ("+-------------------------------------+\n|    Ingrese una cadena a evaluar:    |\n+-------------------------------------+");
print("\n");
my $cadena = <STDIN>;
chomp $cadena;
my @chararray = split //,$cadena;
body();
encabezado();
for my $character (@chararray){	
	my $estadosig = $estado;	
	my $charcaracter=caracter($character);	
	$estado=$tabla[$estado][$charcaracter];	
	#this one validates that there's no mor than 1 b 
	if($estado==2){
		print("\n|       ",$estadosig,"       | ",$character,"      | ",$simbolo,"		|  ",$estado,"         |");
		body();
		print("\n|              Cadena No Valida                      |\n+----------------------------------------------------+");
        exit();
	}
	#i implement this bit because for some reason, the above "else" case where i used exit() doesn't always work, this one validates that strings like a-b or a_b are not valid
	if($charcaracter==3){
		print("\n|       ",$estadosig,"       | ",$character,"      | ",$simbolo,"		|  ",$estado,"         |");
		body();
		print("\n|              Cadena No Valida                      |\n+----------------------------------------------------+");
        exit();
	}
	contenido($estadosig,$character,$simbolo,$estado);
}

#the last state is 1, so if the ending state is 1 it's valid.
if($estado==1){
    print("\n|	",$estado,"       |        |Fin de Cadena |            |");
    body();
    print("\n|                Cadena Valida                       |\n+----------------------------------------------------+");
}




