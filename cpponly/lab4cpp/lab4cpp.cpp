#include <iostream>
#include <math.h>
#include <chrono>
using namespace std;

int main() {
    int i, k;
    int n = 1000000;
    float x;
    float y;
    float f = 0;
    cout << "n = " << n << endl;

    cout << "Input x: ";
    cin >> x;

    auto start = chrono::high_resolution_clock::now();

    for (i = 0; i < n; i++) {
        f = fabsf(1 / tanf(x) - sinf(x));
    }

    cout << "result: " << f << endl;

    auto end = chrono::high_resolution_clock::now();
    chrono::duration<double> duration = end - start;
    cout << "Execution Time: " << duration.count() << " seconds" << endl;

    return 0;
}