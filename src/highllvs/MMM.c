#include <stdio.h>
#include <stdlib.h>
#include <string.h>


//unsigned int lookup[10175];
//unsigned int lookupdec[10175];
void Test();
int mmm(unsigned int x, unsigned int y, unsigned int p);
/* Iterative Function to calculate (x^y)%p in O(log y) */
int power(int x, unsigned int y, int p)
{
    int res = 1;      // Initialize result
 
    x = x % p;  // Update x if it is more than or 
                // equal to p
 
    while (y > 0)
    {
        // If y is odd, multiply x with result
        if (y & 1)
            res = (res*x) % p;
 
        // y must be even now
        y = y>>1; // y = y/2
        x = (x*x) % p; 
	//printf("%d\n", res); 
    }
    return res;
}


//This is done, call mmm() on multiply.
int mme(unsigned int x, unsigned int y, unsigned int p) {
        unsigned int res = 1;
        x = x%p;

        while(y > 0) {
                if(y & 1)
                        res = mmm(res, x, p);//(res*x) % p;

                y = y >> 1;
                x = mmm(x, x, p);
		printf("%d\n", res);
        }
	return res;
}

int mmm(unsigned int x, unsigned int y, unsigned int p) {
	unsigned int Z, T, tmp;
	T = 0;
	unsigned int R = 65536;
	int i;
	/*for(i = 0; i < 16; i++){
		tmp = (T & 0x01) + (x & (y & 0x01));
		T = (T + (x & 0x01)*22 + tmp*p)/2;
		x = x >> 1;
		printf("%d\n", T);	
	}
	if(T >= p)
		T = T - p;
	Z = T;*/
	int result = 0;
	x = x % p;
	while(y > 0) {
		if(y%2 == 1)
			result = (result + x) % p;
		x = (x*2)%p;
		y /= 2;
	}
	return result%p;
	
	
	//printf("\n");
	//return Z;
	//printf("%d\n", T);
	
}

void encrypt(FILE *input, unsigned int E, unsigned int PQ) {//, int PQ, int E, FILE *outenc) {
		unsigned char line[200];
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
	unsigned char line[200];
	unsigned char outline[200];
        int i;
                //fgets(line, 200, input);
        int len;// = strlen(line);
	unsigned int msb;
	unsigned int lsb;
	unsigned int val;
	unsigned int combval;
	int j;

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

int main(int argc, char **argv) {
	Test();	
	return 0;
}

void Test() {
	int E = 17;
	int D = 2753;
        int Q = 53;
        int P = 61;
        int PQ = 3233;

	FILE *input = fopen("test.txt", "r");

	encrypt(input, E, PQ);	
	printf("encryption run succesfully, find file 'encrypted.enc'\n");
	decrypt(D, PQ);
	printf("decryption run succesfully, find plaintext file 'plaintest.txt'\n");
}

