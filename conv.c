#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int func(int a);
int main() {

	char array[20] = "hey there big guy";
	char after[20];
	int i;

	for(i = 0; i < strlen(array); i++)
		after[i] = array[i];
	printf("\n");


	int a;	
	char tmp[20];
	for(i = 0; i < 15; i++) {
		a = after[i];
		printf("%d,", a);
		a = func(a);
		tmp[i] = a;
		after[i] = a;
		//after[i] = a;
	}
	printf("\n");

	for(i = 0; i < 15; i++)
                printf("%d,", after[i]);
         printf("\n");

	for(i = 0; i < 15; i++)
                printf("%d,", tmp[i]);
	 printf("\n");

	printf("%c\n", 97);

	return 0;
}

int func(int a) {
	return a + 50;
}
