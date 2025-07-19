#include <stdio.h>
#include <stdlib.h>

// Declaration of the is_prime function written in assembly
extern int is_prime(int n);

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <positive_integer>\n", argv[0]);
        return 1;
    }

    int n = atoi(argv[1]);
    if (n < 2) {
        printf("Number of prime numbers between 0 and %d is: 0\n", n);
        return 0;
    }

    int count = 0;
    for (int i = 2; i <= n; i++) {
        if (is_prime(i)) {
            count++;
        }
    }

    printf("Number of prime numbers between 0 and %d is: %d\n", n, count);
    return 0;
}
