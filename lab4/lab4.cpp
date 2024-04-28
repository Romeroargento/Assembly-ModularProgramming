#include <iostream>
using namespace std;

extern "C" float* FuncValue(int n, float* x);

int main() {
    int n,i,k;
    float* xi;
    float* yi;
    cout << "Input n: ";
    cin >> n;
    cout << "n = " << n << endl;

    xi = new float[n];

    for (i = 0; i < n; i++) {
        cout << "Input x" << i+1 << ": ";
        cin >> xi[i];
    }

    for (i = 0; i < n; i++) {
        cout << "x" << i + 1 << " = " << xi[i] << endl;
    }
    
    yi = FuncValue(n, xi);

    for (k = 0; k < n; k++) {
        cout << "y" << k + 1 << "(" << xi[k] << ")" << " = " << yi[k] << endl;
    }

    return 0;
}

