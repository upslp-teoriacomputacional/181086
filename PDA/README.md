##  Pushdown Automata
### (Last updated: 13-11-2020)
The objective of the programm is to generate a simple DFA, in which only a string consisting of a number from 0 to 9, an operator such as +, -, *, or / and another digit from 0 to 9, is valid. This is made possible because of the matching operators avaliable on Perl.


#### Program to generate a DFA 
  <li>In this code we start by declaring several global variables, this is necesary due to the nature of what we're doing.</li>
  <li>Just like in the NFA program we have four subroutines: 
	<ul> <li>caracter: this subroutine determines the value of the variable simbolo, and wether or not the character sent is a digit or an operator</li>
		<li> encabezado: it only prints on screen the upper part of the table</li>
		<li> contenido: it prints the value of each variable to fill the table</li>
		<li> body: prints lines to make the table prettier</li>
	</ul>
  </li>  
  

#### understanding PDA:

Honestly, this was very hard for me, i thought i understood well enough the subject in hand, that being the way PDA's work. 
But i still had a hard time trying to think of a way to implement it by programming. And to be fair, i don't entirely know if my implementation was accurate.
That being said, i also had a problem with the expression used, because i was thinking it was the same expression for both the NFA program and this one. However that's not the case
In the NFA we did a*ba*, here the expression was anbn which to my understanding would translate to a*b*. That made things a little bit more confusing to me until i realized it was a different expression.

In this particular code i didn't have issues in terms of syntax so i don't have perl code to show in this section. 



## Information

Universidad Politécnica de San Luis Potosí
Written by: Rodrigo Alejandro Ortiz Muñiz - 181086
Professor: Juan Carlos Gonzáles Ibarra
Assignature: Teoría computacional.


## License
[MIT](https://choosealicense.com/licenses/mit/)
