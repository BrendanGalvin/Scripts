# For a Facebook interview, I was once asked to manually format JSON in the language of my choice, and this was roughly
# The result.

sub FormatJSON {
	print"\n\n";
	my @JSON = split("", @_[0]);
	my $i = 0;
	my $flag = 0;
	foreach(@JSON){
		my $character = $_;
		$flag = 1 if $flag == 2;
		if($flag == 0 && $character eq '"') {
			$flag = 2;
		}elsif($flag == 1 && $character eq '"') {
			$flag = 0;
		}
		if($character =~ /\[|\{|\,/ && $flag == 0) {
			$i++ if $character ne ',';
			print $character;
			print"\n";
			for(my $indent = 0; $indent < $i; $indent++) {
				print"\t";
			}
		}elsif($character =~ /\[|\{|\,/ && $flag == 1) {
			print $character;
		}elsif($character =~ /\]|\}/ && $flag == 0){
			$i--;
			print"\n";
			for(my $indent = 0; $indent < $i; $indent++) {
				print"\t";
			}
			print $character;
			print"\n";
			for(my $indent = 0; $indent < $i; $indent++) {
				print"\t";
			}
		}else{
			print $character;
		}
	}
	print"\n\n";
}




while(1){
chomp($input = <STDIN>);
FormatJSON($input);
}