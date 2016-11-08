# A very quick and dirty solution to what I just learned is called the "FizzBuzz problem". The problem sounds silly.
# But maybe there really are coders who can't figure out the problem?
# This is also not the only way to solve the problem.

for($input = 0; $input < 101; $input++){
$flag = 0;
print "\n";
if($input % 3 == 0){
print "Fizz";
$flag = 1;
}
if($input % 5 == 0){
print "Buzz";
$flag = 1;
}
print $input if $flag == 0;
}