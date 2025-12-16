#include <stdio.h>

int potencia(int x, int y){
    if (y == 0)
        return 1;
    else if (y > 0)
        return x * potencia(x, y - 1);
}

int main(){
    int base, expoente, r;

    printf("Qual o valor da base? ");
    scanf("%d", &base);
    printf("Qual o valor do expoente? ");
    scanf("%d", &expoente);

    r = potencia(base, expoente);

    printf("%d^%d = %d\n", base, expoente, r);
}
