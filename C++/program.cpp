#include <iostream>
using namespace std;

int main() {
	// Create Variables
	int range;
	int mark;

	// Get user input
	cout << "range: ";
	cin >> range;
	cout << "mark every: ";
	cin >> mark;

	// Loop
	for (int num = 1; num <= range; num++) {
		// Check if mark is hit
		if (num % mark == 0) {
			cout << num << " <-\n";
		} else {
			cout << num << "\n";
		}
	}
}
