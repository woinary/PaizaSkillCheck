#include <stdio.h>

int main(void) {
    int num_unit, unit_length;
    char buf[1000];

    fgets(buf, sizeof(buf), stdin);
    sscanf(buf, "%d\n", &num_unit);
    unit_length = num_unit * 25;
    printf("%d\n", unit_length);
    return 0;
}