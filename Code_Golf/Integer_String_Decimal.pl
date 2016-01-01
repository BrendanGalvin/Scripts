# http://codegolf.stackexchange.com/questions/67739/is-it-an-integer-a-string-or-a-decimal
# Run with -p, like most scripts

chop;$_=!/\D|^0/?"integer":/^\d+\.\d+$/?"decimal":"string"