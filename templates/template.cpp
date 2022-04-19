#include <iostream>
using namespace std;
int main(void){
    int n;
    string token1, token2;

    cin >> n;
    for(int i = 0; i < n; i++) {
        cin >> token1 >> token2;
        cout << "hello = " << token1 << " , world = " << token2 << endl;
    }
    return 0;
}
