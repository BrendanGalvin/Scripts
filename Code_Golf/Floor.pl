# http://codegolf.stackexchange.com/questions/289/shortest-floor-function
# Run with the -p command line argument.

# s/\.\d+//                       This just truncates numbers, it's not really a floor function.

# s/\..+//&&$_<0?$_--:$_   	This floors negative numbers as well.