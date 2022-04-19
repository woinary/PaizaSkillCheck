#include <stdio.h>
int main(void){
    int i, n;
    char buf[1000];
    char token1[100], token2[100];

    fgets(buf, sizeof(buf), stdin);
    sscanf(buf, "%d\n", &n);
    for (i=0; i<n; i++) {
        fgets(buf, sizeof(buf), stdin);
        sscanf(buf, "%s %s\n", token1, token2);
        printf("hello = %s , world = %s\n" ,token1 ,token2);
    }
    return 0;
}
