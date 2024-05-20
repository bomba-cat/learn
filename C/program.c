#include<stdio.h>

int main() {
	// Create variables
	int range;
	int mark;

	// Get user input
	printf("range: ");
	scanf("%d", &range);

	printf("mark every: ");
	scanf("%d", &mark);

	// Loop
	for (int num = 1; num <= range; num++){
		// Check if number hit the mark
		if (num % mark == 0){
			printf("%d <--\n", num);
		} else {
			printf("%d\n", num);
		}
	}

	return 0;
}
