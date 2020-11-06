## Deterministic Finite Automata
### (Last updated: 05-10-2020)
The objective of the programm is to generate a simple DFA, in which only a string consisting of a number from 0 to 9, an operator such as +, -, *, or / and another digit from 0 to 9, is valid. This is made possible because of the matching operators avaliable on Perl.


#### Program to generate a DFA 
  <li>In this code we start by declaring two global variables, this are necesary due to the nature of what we're doing.</li>
  <li>We have four subroutines: 
	<ul> <li>caracter: this subroutine determines the value of the variable simbolo, and wether or not the character sent is a digit or an operator</li>
		<li> encabezado: it only prints on screen the upper part of the table</li>
		<li> contenido: it prints the value of each variable to fill the table</li>
		<li> body: prints lines to make the table prettier</li>
	</ul>
  </li>  
  

#### using match in perl:

Truth be told, this was one of the hardest programs i've made, not because is complex, but because all the information about the proper syntax to use the match operator in perl and its options and modifiers is confusing to the extreme. 

even though the official site says that you need to use something like
```perl
$character =~ m/[0-9]/
```

what you actually need to use is 

```perl
$character =~ m/^[0-9]*$/
```
which one can only guess by experimenting using each of the modifiers known to man, such as p, m, d, s, ^ and so on.

That doesn't come close to the absoute horror that is understanding the way metacharacters work, since + is a metacharacter if we use 
```perl
$character =~ /+/
```
the program wont know what we're trying to say, because + is used in other ways, so we need to add a \ before
```perl
$character =~ /\+/
```
which can get really confusing when you add | to represent OR and several other operators
```perl
$character =~ /\+|\-|\*|\//
```

Using the match operator properly was by far the greatest challenge in the development of this code.



## Information

Universidad Politécnica de San Luis Potosí
Written by: Rodrigo Alejandro Ortiz Muñiz - 181086
Professor: Juan Carlos Gonzáles Ibarra
Assignature: Teoría computacional.


## License
[MIT](https://choosealicense.com/licenses/mit/)