# I think I have a problem.
# http://codegolf.stackexchange.com/questions/59464/print-like-this/59471#59471

@a=split(" ",lc(<>));while($i<=$#a/2){@a[$i*2]=uc(@a[$i*2]);$i++;}print(join(" ", @a));