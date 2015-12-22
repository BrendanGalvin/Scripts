# http://codegolf.stackexchange.com/questions/67357/output-the-alphabet-the-alphabet-or-just-a-character
# I did not post this, as I was trying to shorten another user's answer - the general idea here is not my design.
# I was trying to see if, with the -p command line argument, we could eliminate the 'print' statement from Kenney's answer on the URL.
# However it is actually larger than his answer due to the necessity of the 'join' statement. Oh well.

$_=join'',/[a-z]/?a..z:/[A-Z]/?A..Z:$_