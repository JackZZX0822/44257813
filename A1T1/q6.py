import sys
import math

t = float(sys.argv[1])
P = float(sys.argv[2])
r = float(sys.argv[3])
e = math.e
dv = P*e**(r*t)
print('the desired value is', dv)
