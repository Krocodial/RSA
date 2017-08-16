#include <stdio.h>
#include <stdlib.h>

int determinelength(register long long e) {	
	register int num;
	while(e) {
		num++;
		e = e >> 1;
	}
	return num;
}



void tableofpowers(register long long m, long long p, long long e, register long long table[]){
	
	register int i;
	table[0] = 1;
	table[1] = p;
		
	//Software pipelining will not work here
	register int val;
	for(i = 2; i <= e; i++) {
		table[i] = (table[i-1]*table[i-1])%m; 
	}
}

long long crypt(long long table[], register long long exponent, register long long m) {
	
	register int i = 1;
	//register usage for critical variables
	register long long result = 1;
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

	long long T = 123;
	long long E = 17;
	long long D = 2753;
	long long M = 3233;
	long long table[512];

	printf("Initial: %llu\n", T);
	
	int size = determinelength(E);
	tableofpowers(M, T, size, table);
	long long C = crypt(table, E, M);
	
	size = determinelength(D);
	tableofpowers(M, C, size, table);
	long long P = crypt(table, D, M);

	printf("Encrypted: %llu\n", C);
	printf("Decrypted: %llu\n", P);

	return 0;
}
