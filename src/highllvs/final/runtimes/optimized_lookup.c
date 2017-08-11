#include <stdio.h>
#include <stdlib.h>

//table of powers is 64 long
void tableofpowers(register long long m, long long p, long long e, register long long table[]){
	
	register int i;
	table[0] = 1;
	table[1] = p%m;

	//Software pipelining will not work here
	register int last = table[2];
	for(i = 2; i < 65; i++) {
		last = table[i-1];
		table[i] = (last*last)%m; 
	}
}

long long encrypt(long long table[], register long long exponent, register long long m) {
	
	register int i;
	//register usage for critical variables
	register long long result = 1;
	//grafting/loop unrolling
	for(i = 1; i < 512; i+=2) {
		//specific boolean expression
		if(exponent & 1) {
			result = (result*table[i])%m;
		}
		exponent = exponent >> 1;	

		if(exponent & 1) {
                        result = (result*table[i+1])%m;
                }
                exponent = exponent >> 1;

	}
	return result;
}



int main() {

	long long T = 123;
	long long E = 17;
	long long D = 2753;
	long long M = 3233;
	long long table[65];

	printf("Initial: %llu\n", T);

	tableofpowers(M, T, E, table);
	long long C = encrypt(table, E, M);

	tableofpowers(M, C, D, table);
	long long P = encrypt(table, D, M);

	printf("Encrypted: %llu\n", C);
	printf("Decrypted: %llu\n", P);

	return 0;
}
