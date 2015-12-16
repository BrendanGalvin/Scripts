#http://codegolf.stackexchange.com/questions/66763/russian-roulette-revisited/66780#66780
#Run this with the -n command line option.

$i++;$a=$i>=int(rand(6));print$_=$a?'*BANG!*':'*click*';last if($a)