# Don't judge me for playing Cookie Clicker.


while(1){
print"\nHow many buildings do you want to build?\n";
chomp($number = <STDIN>);

if($number =~ /[^\d.]/){
	print"Please type only a number.\n";
	next;
}else{
	for($i = 0; $i < $number; $i++){
		$result += (1.15 ** $i);
	}
	print"What is the price of the building currently?\n";
	chomp($price = <STDIN>);
	if($price =~ /[^\d.]/){
		print"Type only digits, please.\n";
		next;
	}
	print"The price is " . ($result * $price) . "\n";
	$result = 0;
}
}