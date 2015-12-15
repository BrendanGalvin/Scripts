#http://codegolf.stackexchange.com/questions/64198/99-bottles-of-beer

$b=" bottles of beer";
$B=" bottle of beer";
$w=" on the wall";
for($i=99;$i>1;$i--){
print"$i$b$w, $i$b.\nTake one down and pass it around, ".($i-1)."$b$w.\n\n";
}
print"1$B$w, 1$B.\nGo to the store and buy some more, 99$b$w.";