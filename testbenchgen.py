#1usr/bin/python3.5

import string
import random
import os

fp = open("testbench.txt", "w");

while(os.stat("testbench.txt").st_size < 10000000):
	fp.write(random.choice(string.printable));

fp.close;
