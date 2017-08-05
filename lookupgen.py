#!/usr/bin/python3.5

fp = open("lookup.txt", "w");
fpp = open("lookupdec.txt", "w");

lookup = [];
lookupdec = [];

for i in range(10175):
	if(i%1000 == 0):
		print(i);
	lookup.append((i**17)%3233);
for i in lookup:
	fp.write(str(i) + '\n');

for i in range(10175):
	if(i%1000 == 0):
		print(i);
	lookupdec.append((i**2753)%3233);
for i in lookupdec:
	fpp.write(str(i) + '\n');


string = ";sldkjfhlsdjfo lk;sdjf ;ilsdj 34534 .].;'.][.";

enc = "";
dec = "";

print(ord('a'));

for i in string:
	enc = enc + chr(lookup[ord(i)]);
for i in enc:
	dec = dec + chr(lookupdec[ord(i)]);
print(string);
print(enc);
print(dec);


#fp.write(str(lookup));

#print(lookup);
