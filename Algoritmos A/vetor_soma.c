#include <stdio.h>

int main(){

    int N = 10, a[N], b[N], c[N];
    int i, par[N], qPar = 0, j=0;

    printf("Informe o vetor A: ");
    for(i=0; i<N;i++){
        printf("a[%d] = ", i);
        scanf("%d", &a[i]);
    }

    printf("Informe o vetor B: ");
    for(i=0; i<N;i++){
        printf("b[%d] = ", i);
        scanf("%d", &b[i]);
    }

    printf("C = A + B\n");
    for(i=0;i<N;i++){
        c[i] = a[i]+b[i];
        printf("c[%d] = %d\n", c[i]);
    }

    //mostrar os elementos pares do vetor A
    printf("Elementos pares em A: \n");
    for(i=0; i<N; i++){
        if(a[i]%2==0){
           //printf("%d \t", a[i]);
            qPar++;
            b[j] = a[i];
            j++;
        }
    }

    //encontrar os valores negativos de A e armazená-los em um novo vetor.

return 0;
}
