import sys
import stdio
import random

a = int(sys.argv[1])
b = int(sys.argv[2])

stdio.writeln(random.randrange(a,b+1))
