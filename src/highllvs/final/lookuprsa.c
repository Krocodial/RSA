#include <stdio.h>
#include <stdlib.h>

//table of powers is 64 long
int tableofpowers(int m, int p, int e, int table[]){
	
	int i;
	table[0] = 1;
	table[1] = p;

	for(i = 2; i < 65; i++) {
		table[i] = (table[i-1]*table[i-1])%m; 
	}

	//for(i=0; i < 65; i++) {
	//	printf("%d, ", table[i]);
	//}

}

int encrypt(int table[], int exponent, int m) {
	
	int i;
	int result = 1;
	for(i = 1; i < 64; i++) {
		if(exponent & 0x01) {
			result = (result*table[i])%m;
			printf("%d ---> %d\n", i, result);
		}
		exponent = exponent >> 1;	
	}
	return result;
}

int main() {
unsigned int table[65];
tableofpowers(3233, 855, 2753, table);
unsigned int C = encrypt(table, 2753, 3233);
printf("Encrypted: %d\n", C);
return 0;
}
