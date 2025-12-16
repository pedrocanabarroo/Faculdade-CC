#include <stdio.h>
#include <locale.h>

int main(){

int n, x;

setlocale(LC_ALL,"Portuguese");

//printf("Digite um número para calcular a tabuada: ");
//scanf("%i", &n);

for (n = 1; n <= 10; n++){
    printf("TABUADA DO %d\n", n);
    for (x = 1; x <= 10; x++){
    printf("%d * %d = %d\n", x, n, x*n);
    }
}


return 0;

}
