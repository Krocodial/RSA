#include <stdio.h>
#include <stdlib.h>
#include <string.h>


unsigned int lookup[10175];
unsigned int lookupdec[10175];

void encrypt(FILE *input) {//, int PQ, int E, FILE *outenc) {
		FILE *output;
		output = fopen("encrypted.enc", "w");
		unsigned int val;
		unsigned char msb;
		unsigned char lsb;
		//for each char, convert to int through the lookup, then write as 2 chars.
				
			val = fgetc(input);
			while(val != EOF){
				val = lookup[val];
				
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

void decrypt() {//, int PQ, int D, FILE *outplain) {	
	FILE *input;
	FILE *output;
	input = fopen("encrypted.enc", "r");
        output = fopen("plaintext.txt", "w");
	unsigned int msb;
	unsigned int lsb;
	unsigned int val;

	msb = fgetc(input);
	while(msb != EOF){
		lsb = fgetc(input);	
		val = 0;
		
		val |= (msb << 8) | lsb;

		fputc(lookupdec[val], output);

		msb = fgetc(input);
	}

	
        fclose(input);
        fclose(output);
}

//int lookup[10175];

int main(int argc, char **argv) {
	//intitialize our values
	//In an actual rsa alg, use long long data type
	//int E = 17;
	//int D = 2753;
	//int Q = 53;
	//int P = 61;
	//int PQ = 3233;
	int i;
	//Read in the lookup table that we generated offline
	FILE *lookuptable;	
	if((lookuptable = fopen("lookup.txt", "rb")) == NULL) {
		printf("lookup table not found\n");
		return 1;
	}

	for(i = 0; i < 10175; i++) {
		fscanf(lookuptable, "%d", &lookup[i]);
	}
	
	//Read in our lookup table to decrypt

	FILE *lookuptabledec;
        if((lookuptabledec = fopen("lookupdec.txt", "r")) == NULL) {
                printf("decryption lookup table not found\n");
                return 1;
        }

        for(i = 0; i < 10175; i++) {
                fscanf(lookuptabledec, "%d", &lookupdec[i]);
        }
	//open our plaintext file and create our newly encrypted file		
	FILE *inplain;
	
	
	if((inplain = fopen("file.txt", "r")) == NULL) {
		printf("file.txt not found");
		return 1;
	}
	encrypt(inplain);
	decrypt();

	/*if(argc == 3) {
		if((inplain = fopen(argv[2], "r")) == NULL) {
                	printf("failed, file does not exist\n");
                	return 1;
		}
		if(strcmp(argv[1], "encrypt") == 0) {
			encrypt(inplain);
		} else {
			decrypt(inplain);
		}
        } else {
			printf("Usage: ./executable encrypt/decrypt file.ext\n");
			return 1;
	}
	*/
	
	
	
	return 0;

}
