#include <stdio.h>
#include <stdlib.h>

//table of powers is 64 long
int tableofpowers(long long m, long long p, long long e, long long table[]){
	
	int i;
	table[0] = 1;
	table[1] = p%m;

	for(i = 2; i < 65; i++) {
		table[i] = (table[i-1]*table[i-1])%m; 
	}
}

long long encrypt(long long table[], long long exponent, long long m) {
	
	int i;
	long long result = 1;
	for(i = 1; i < 512; i++) {
		if(exponent & 0x01) {
			result = (result*table[i])%m;
		}
		exponent = exponent >> 1;	
	}
	return result;
}



int main() {

	long long E = 17;
	long long D = 2753;
	long long M = 3233;
	long long T = 123;
	long long table[65];

	printf("Initial: %llu\n", T);

	tableofpowers(M, T, E, table);
	long long C = encrypt(table, E, M);
	printf("Encrypted: %llu\n", C);

	tableofpowers(M, C, D, table);
	long long P = encrypt(table, D, M);
	printf("Decrypted: %llu\n", P);

	return 0;
}
