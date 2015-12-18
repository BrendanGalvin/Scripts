sub fac{
my $n = shift;
return 1 if $n<=0;
return $n * fac($n-1);
}

print"\nType a number. DO IT NOW\n";
while(1){
chomp($input = <STDIN>);
print &fac($input);
}