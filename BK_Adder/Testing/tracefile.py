import random
f=open("tracefile.txt", "a+")
for i in range(50000):
  a = random.randint(1,2147483648)
  b = random.randint(1,2147483648)
  f.write("{:032b}".format(a)+"{:032b}".format(b)+" "+"{:032b}".format(a+b)+" "+"{:032b}".format(4294967295)+'\n')
