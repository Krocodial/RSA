#include <stdio.h>
#include <stdlib.h>

int mmm(register unsigned int x, register unsigned int y, register unsigned int p) {
	
	register unsigned int result = 0;
	x = x%p;
	while(y > 0) {
		if(y & 1)
			result = (result + x) % p;
		x = (x*2) % p;
		y = y >> 1;
	}
	return result%p;
}

int mme(register unsigned int x, register unsigned int y, register unsigned int p) {
	
	register unsigned int result = 1;
	x = x % p;
	while(y != 0) {
		if(y & 1)
			result = mmm(result, x, p);
		y = y >> 1;
		x = mmm(x, x, p);
	}
	return result;
}


int main() {

unsigned int T = 123;
unsigned int E = 17;
unsigned int D = 2753;
unsigned int M = 3233;

int C = mme(T, E, M);
int P = mme(C, D, M);

printf("Initial: %d\n", T);
printf("Encrypted: %d\n", C);
printf("Decrypted: %d\n", P);

return 0;
}
