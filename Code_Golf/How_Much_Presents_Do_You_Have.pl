# http://codegolf.stackexchange.com/questions/67027/how-much-presents-did-you-get-for-christmas/67060#67060

@a=$_=~/(\d+,*)/g;
$_=0;
@n = map(split(/\D/),@a);
for($i=0;$i<$#n;$i+=3){
$x=$n[$i];
$n[$i+1]==0?$_+=1420/339*$x**3:$_+=($x*$n[$i+1]*$n[$i+2]);
}

# Golfed version:

# @a=$_=~/(\d+,*)/g;$_=0;@n = map(split(/\D/),@a);for($i=0;$i<$#n;$i+=3){$x=$n[$i];$n[$i+1]==0?$_+=1420/339*$x**3:$_+=($x*$n[$i+1]*$n[$i+2]);}