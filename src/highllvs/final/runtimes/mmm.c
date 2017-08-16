#include <stdlib.h>
#include <stdio.h>
/*
-Author: Louis Kraak
-Title: RSA cryptography Montgomery modular multiplication
*/

int determine_length(register int e) {
	register int result = 0;
	while(e){
		result = result + 1;
		e = e >> 1;
	}
	return result;
}

int mmm(unsigned int x, unsigned int y, unsigned int m) {
       	register int n; 
	register int t = 0;
	register int i = determine_length(m);	

	for(; i != 0; i--, x >>= 1) {	
		n = (t&1) + (x&(y&1));
		t = (t + (x&1)*y + n*m)>>2;
	}
	if(t >= m)
		t = t-m;
	return t;

}

int mme(unsigned int x, unsigned int e, unsigned int m) {

	int i = determine_length(m);
	i = (1 << (i*2))%m;
	unsigned int z = mmm(1, i, m);
	unsigned int p = mmm(x, i, m);
	while(e) {
		if(e & 0x1) {
			z = mmm(z, p, m);
		}
		p = mmm(p, p, m);
		e = e >> 1;
	}
	z = mmm(1, z, m);
	return z;
}


int main() {
	int T = 123;
	int E = 17;
	int D = 2753;
	int M = 3233;
	int C, P;

	C = mme(T, E, M);
	D = mme(C, D, M);

	printf("Initial: %d\n", T);
	printf("Encrypted: %d\n", C);
	printf("Decryption: %d\n", D);
	return 0;
}
