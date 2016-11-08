use Math::Trig;

sub sigma{
	my ($z, $n, $expression) = @_;
	$expression =~ s/z/\$z/ig;
	$result = 0;
	for($j = $z; $j <= $n; $j++){
		$z = $j;
		$result += eval($expression);
	}
	return $result;
}


while(1){
	print "Type the initial value of 'z', the maximum value of 'z', and the expression to be summed, separated by commas. ";
	chomp($input = <STDIN>);
	($z, $n, $expression) = split(/,/g, $input);
	$result = sigma($z, $n, $expression);
	print "\n\nThe result is $result.\n";
}