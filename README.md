## Tables of truth 
### (Last updated: 20-09-2020)
The objective of the programm is to generate tables of truth for the operators OR, AND, NOT and XOR, also known as exclusive OR
It accomplishes that by using for loops, the list containing the boolean values, or in this case, the 0 and 1, is used for this process. 
every sequence of embeded for's runs by the list and takes its elements as an input that is used to provide an output depending on the operator used


#### Program to generate tables of truth for the operators OR, AND, NOT and Exclusive OR
  <li>In this code we start by declaring a list that according to my research is actually a way to declare a regular array in perl</li>
  <li> This list has two elements, 0 and 1, while in the source code from python the values were false and true, both booleans
  in perl we don't have those boolean values, and almost any value is considered true, therefore we need a false value, that being 0</li>
  
##### using a new kind of for

Before doing this, i never knew there was a different structure of the for instruction, other than foreach. 
In this code, however, i had a hard time getting the python instruction 
```python
for x in booleanos
```
used to run by each element of the list.
I understood the way it worked, but didn't know the right syntax, fortunately, i found out that the correct instruction 
to replace those python lines from the source code was:

```perl
for $x (@booleanos)
```
this instruction let me adapt the python source code correctly. This was by far the greates issue i had while doing this programm



#### OR, AND, NOT and XOR:

The general layout of every one of the tables was as follows: 

```perl
print("\n\nTruth table for OR: \n");
print("| x\t| y\t| x or y|\n");
print('-------------------------');
print("\n");
for $x (@booleanos){
	for $y (@booleanos){
		print("| ",$x);
		print("\t| ");
		print($y);
		print("\t| ");
		### print(  The desired operator  );
		print("\t|\n");
	}
}
```
in the line where the desired operator should be printed is the one that changes most of the time.

for OR it would be: 
```perl
print($x or $y);
```

for AND it would be: 
```perl
print($x and $y);
```

for XOR it would be: 
```perl
print($x ^ $y);
```

The NOT table was very different, instead of using a for with an embeded for in it, we only use one
also, in the source code there was only the need of directly printing everything, like in the previous examples.
in perl however, when the program should return a 0 or a false value, it doesn't seem to return anything, at least not in a printable way, that's what happened in the NOT table
the way i managed to solve this so every result was to be printed i used an if structure:
```perl
print("\n\nTruth table for NOT: \n");
print("| x\t| not x |\n");
print('-----------------');
print("\n");
for $x (@booleanos){
		print("| ",$x);
		print("\t| ");
		if((not $x)== 0){
			print(0);
		}else{
			print(not $x);
		}
		print("\t| \n");
}
```
one thing to note on the program's output is that the tables are filled with ones and zeroes, instead of "true" and "false" values
in a way, this is perl's version of that.
It would have been much harder to try to use strings for true and false. In the exclusive OR and the NOT tables there would have been several errors.
This would be due to perl's impossibility of determining if a value is false or true, not even the string "false" is false, almost everything is considered true, only a 0 or an undefined value are false.



## Information

Universidad Politécnica de San Luis Potosí
Written by: Rodrigo Alejandro Ortiz Muñiz - 181086
Professor: Juan Carlos Gonzáles Ibarra
Assignature: Teoría computacional.


## License
[MIT](https://choosealicense.com/licenses/mit/)