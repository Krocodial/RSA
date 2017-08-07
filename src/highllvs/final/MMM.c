#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void Test();
int mmm(unsigned int x, unsigned int y, unsigned int p);
/* Iterative Function to calculate (x^y)%p in O(log y) */

//This is done, call mmm() on multiply.
int mme(unsigned int x, unsigned int y, unsigned int p) {
        unsigned int res = 1;
        x = x%p;

        while(y > 0) {
                if(y & 1)
                        res = mmm(res, x, p);//(res*x) % p;

                y = y >> 1;
                x = mmm(x, x, p);
//		printf("%d\n", res);
        }
	return res;
}

int mmm(unsigned int x, unsigned int y, unsigned int p) {
	unsigned int result = 0;
	x = x % p;
	while(y > 0) {
		if(y%2 == 1)
			result = (result + x) % p;
		x = (x*2)%p;
		y /= 2;
	}
	return result%p;
}

void encrypt(FILE *input, unsigned int E, unsigned int PQ) {
		FILE *output;
		output = fopen("encrypted.enc", "w");
		unsigned int val;
		unsigned char msb;
		unsigned char lsb;
		//for each char, convert to int through the lookup, then write as 2 chars.
				
			val = fgetc(input);
			while(val != EOF){
				val = mme(val, E, PQ);
				//val = lookup[val];
				
				msb = 0;
				lsb = 0;
				
				msb |= (val >> 8);
				lsb |= (val);

				fputc(msb, output);
				fputc(lsb, output);
				val = fgetc(input);
				
			}

		fclose(input);
		fclose(output);
}

void decrypt(unsigned int D, unsigned int PQ) {//, int PQ, int D, FILE *outplain) {	
	FILE *input;
	FILE *output;
        output = fopen("plaintext.txt", "w");
	input = fopen("encrypted.enc", "r");
	unsigned int msb;
	unsigned int lsb;
	unsigned int val;

	msb = fgetc(input);
	while(msb != EOF){
		lsb = fgetc(input);	
		val = 0;
		
		val |= (msb << 8) | lsb;

		fputc(mme(val, D, PQ), output);

		msb = fgetc(input);
	}	
        fclose(input);
        fclose(output);
}

//int lookup[10175];
void testActual(unsigned char *E){
	 printf("%s\n", *E);
}

int main(int argc, char **argv) {
	unsigned char E[1024];
	unsigned char D[1024];
	unsigned char PQ[1024];
	
	E = [0x3e, 0x33, 0x93, 0x00];
	int KEY_SIZE = 1024;

//	memcpy(E, &key, KEY_SIZE);

	//*E = 1908743058934;
	//*D = 29384;
	//*PQ = 298307487;
	
	//testActual(E);	

	//Test();	
	
	return 0;
}

void Test() {
	int E = 17;
	int D = 2753;
        //int Q = 53;
        //int P = 61;
        int PQ = 3233;

	FILE *input = fopen("test.txt", "r");

	encrypt(input, E, PQ);	
	printf("encryption run succesfully, find file 'encrypted.enc'\n");
	decrypt(D, PQ);
	printf("decryption run succesfully, find plaintext file 'plaintest.txt'\n");
}

