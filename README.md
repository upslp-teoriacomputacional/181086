## Regular expressions
### (Last updated: 23-10-2020)
The objective of this program is to practice the use of regular expressions in our assigned programming language

#### Program to evaluate a string in a similar way to how compilers do.
In this program, a string, which in this case is 'int result = 100;', is going to be separated and each word will be checked to see if they match a certain regular expression. 
  <li>We have four essential regex patterns: 
	<ul> 
		<li>/[a-z]/ : this will check if the word contains lower case letters </li>
		<li>/[A-Z]/ : this will check if the word contains upper case letters </li>
		<li>/\+|\-|\*|\/|\=/ : this will check if the word is an operator </li>
		<li>/[0-9]/ : this will check if the word contains numbers from 0 to 9</li>
	</ul>
  </li>  
  

#### using more complex regex patterns:

you can combine some of the other patterns to make the program check if a string contains a more specific set of characters
for instance: 

```perl
$word=~ /^[A-Za-z0-9]$/
```
this will check if the string contains upper or lower letters and numers from 0 to 9
in other words, if the string is alphanumeric.


## Information

Universidad Politécnica de San Luis Potosí
Written by: Rodrigo Alejandro Ortiz Muñiz - 181086
Professor: Juan Carlos Gonzáles Ibarra
Assignature: Teoría computacional.


## License
[MIT](https://choosealicense.com/licenses/mit/)