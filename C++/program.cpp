#include <iostream>
using namespace std;

int main() {
	// Create Variables
	int range;
	int mark;

	cout << "range: ";
	cin >> range;
	cout << "mark every: ";
	cin >> mark;

	for (int num = 1; num <= range; num++) {
		if (num % mark == 0) {
			cout << num << " <-\n";
		} else {
			cout << num << "\n";
		}
	}
}
