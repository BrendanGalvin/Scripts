# http://codegolf.stackexchange.com/questions/64198/99-bottles-of-beer
# Run with the -p argument.
# This iteration of it is from the community wiki on Codegolf. It's pretty neat.

@c=(@b=(++$n,bottle.'s'x@-,of,beer),on,the,wall),s//Take one down and pass it around, @c.

@c, @b.
/,until/99\D+/;say$'."Go to the store and buy some more, $&"