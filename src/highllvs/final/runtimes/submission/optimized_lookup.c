#include <stdio.h>
#include <stdlib.h>

int determinelength(register int e) {	
	register int num = 0;
	while(e) {
		num++;
		e = e >> 1;
	}
	return num;
}



void tableofpowers(register int m, int p, int e, register int table[]){
	
	register int i;
	table[0] = 1;
	table[1] = p;
		
	//Software pipelining will not work here
	//register int val;
	for(i = 2; i < e; i++) {
		table[i] = (table[i-1]*table[i-1])%m; 
	}
}

long long crypt(int table[], register int exponent, register int m) {
	
	register int i = 1;
	//register usage for critical variables
	register int result = 1;
	//grafting/loop unrolling
	while(exponent) {
		if(exponent & 1)
			result = (result*table[i])%m;
		exponent = exponent >> 1;
		i++;
	}
	return result; 
}



int main() {

	int T = 123;
	int E = 17;
	int D = 2753;
	int M = 3233;
	int table[512];

	//printf("Initial: %llu\n", T);
	
	int size = determinelength(E);
	tableofpowers(M, T, size, table);
	int C = crypt(table, E, M);
	
	size = determinelength(D);
	tableofpowers(M, C, size, table);
	int P = crypt(table, D, M);

	//printf("Encrypted: %llu\n", C);
	//printf("Decrypted: %llu\n", P);

	return 0;
}
