N = int(input())
offset = int(input(),16)
s = [input() for i in range(N)]

for i in range(N):
  print("$display(\"{name} = MEM['h{addr:08x}] = %h\",Mem.cell['h{addr:08x}]);".format(name=s[i],addr=offset+i*4));
