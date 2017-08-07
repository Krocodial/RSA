#include <stdio.h>
#include <stdlib.h>

int mmm(unsigned int x, unsigned int y, unsigned int p) {
	
	unsigned int result = 0;
	x = x%p;
	while(y > 0) {
		printf("y = %d, x = %d, result = %d\n", y, x, result);
		if(y%2 == 1)
			result = (result + x) % p;
		x = (x*2) % p;
		y /= 2;
	}
	return result%p;
}

int mme(unsigned int x, unsigned int y, unsigned int p) {
	
	unsigned int result = 1;
	x = x % p;
	while(y > 0) {
		if(y & 1)
			result = (result*x) % p;//result = mmm(result, x, p);
		y = y >> 1;
		x = (x*x) % p;//mmm(x, x, p);
	}
	return result;
}


int main() {

unsigned int E = 17;
unsigned int D = 2753;
unsigned int T = 123;
unsigned int M = 3233;

printf("Initial: %d\n", T);
int C = mme(T, E, M);
printf("Encrypted: %d\n", C);
int P = mme(C, D, M);
printf("Decrypted: %d\n", P);

return 0;
}
