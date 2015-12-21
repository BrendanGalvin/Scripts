#This is a simple perl script to list -all- possible combinations of letters, for a guessing game my friend and I played. It does not list the same combination twice.

chomp($input = <STDIN>);
@letters = split("", $input);


%combinations = ();

foreach $letter(@letters){
	foreach $letter2(@letters){
		if($letter2 eq $letter){
			next;
		}
		foreach $letter3(@letters){
			if($letter3 eq $letter or $letter3 eq $letter2){
				next;
			}
			if(exists $combinations{"$letter$letter2$letter3"}){
				next;
			}
			print"$letter$letter2$letter3 ";
			$combinations{"$letter$letter2$letter3"} = 1;
		}
		print"\n";
	}
}