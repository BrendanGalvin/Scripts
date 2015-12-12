# A quicksort algorithm implemented in Perl.
# I don't recall if I wrote this, or if I got it from somewhere to learn about the algorithm.

sub quick_sort {
	my @a = @_;
	return @a if @a < 2;
	my $p = splice (@a, int($#a / 2), 1);
	return quick_sort(grep $_ < $p, @a), $p, quick_sort(grep $_ >= $p, @a);
}

sub query{
print"Enter a list of numbers, separated by commas (e.g. 2,5,1,7): ";
my @a = split(",", <STDIN>);
@a = quick_sort(@a);
chomp(@a);
print "@a\n";
query();
}

query();