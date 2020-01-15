import random
f=open("tracefile.txt", "a+")
for i in range(250):
  a = random.randint(1,65535)
  b = random.randint(1,65535)
  f.write("{:016b}".format(a)+"{:016b}".format(b)+" "+"{:032b}".format(a*b)+" "+"{:032b}".format(4294967295)+'\n')
