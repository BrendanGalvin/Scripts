# This was an initial proof-of-concept that I made when I wanted to take a mathematical approach to building
# decks in my favorite Trading Card Game, Yu-Gi-Oh.

use Math::BigInt;

for(my $lines = 0; $lines <= 50; $lines++){
print"\n";
}
Routine();


sub Routine
{
	LOOP:while(1){
		my @indeck;
		my $flag = 0;
		print"\n\n Type -only- the letter that represents your choose (case insensitive).\n\n";
		print"Would you like to:\na: Find out the probability of drawing a specific number of cards?\n  (For example, choose this option if you wish to know the odds of drawing\n   cards of a single card-type from the deck, i.e. the odds of drawing \n   at least two hearts)";
		#print"\n\nb: Find the probability of drawing several different cards from a deck?\n  (For example, choose this option if you wish to know the odds of drawing\n   at least one Blue-Eyes White Dragon and at least one Spellbinding Circle,\n   but don't care about other cards drawn)";
		chomp($choice = <STDIN>);

		if($choice =~ /a/){
			print"\nHow many cards are in the deck, total? ";
			chomp(my $decksize = <STDIN>);
			print"\nHow many of the card that you're searching for, are in the deck? ";
			chomp(my $indeck = <STDIN>);
			push(@indeck, $indeck);
			print"\nHow many of those $indeck cards are you hoping to draw, at least? ";
			chomp(my $cards = <STDIN>);
			if($cards > $indeck){
				print"\nYou can't draw more cards than are in the deck.\n\n";
				next LOOP;
			}
			print"\nHow many cards are being drawn (i.e. to your hand) for this search? ";
			chomp(my $drawn = <STDIN>);
			
			@chance = &hypergeometrics($decksize,$cards,$drawn,$indeck);
			my $size = @chance;
			my $total = $chance[0];
			my $total2 = 0;
			for(my $counter = 0; $counter < $size; $counter++){
				$total2 += $chance[$counter] if($counter > 0);
			}
			print"\n$total% is the chance of drawing $cards of the card(s),\n$total2% is the chance to draw " . ($cards + 1) . " or more cards.\n\n\n";
		}
		
	}
}


sub hypergeometrics
{
	my @prob;
	my ($decksize, $cards, $drawn, $indeck) = @_;
	$counter2 = $drawn - $cards;
	$counter2 = $indeck if($counter2 > $indeck);
	for(my $counter = 0; $counter <= $counter2; $counter++){
		$prob[$counter] = (&combinations($indeck,$cards) * &combinations($decksize-$indeck,$drawn-$cards)) / &combinations($decksize,$drawn);
		$prob[$counter] = $prob[$counter] * 100;
		$cards++;
	}
	return @prob;

}

#X = $indeck
#N = $cards
#Y = $decksize
#Z = $drawn


sub combinations
{
	my ($x, $y) = @_;
	$combinations = &factorial($x) / (&factorial($y) * &factorial($x-$y));
	return $combinations;
}



sub factorial
{
	my $factorial = 1;
	my ($number) = @_;
	foreach(1..$number)
	{
		$factorial = $factorial*$_;
	}
	return $factorial;
}