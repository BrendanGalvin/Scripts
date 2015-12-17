# http://codegolf.stackexchange.com/questions/66763/russian-roulette-revisited/66780#66780
# Run this with the -n command line option.
# Thanks to Dom Hastings for his suggestions to get the byte count down!
# Check the link above for the history of edits to this solution.

$_=0|rand 7-$.<++$i?die"*BANG!*":"*click*"