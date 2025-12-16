#include <stdio.h>

int par(int n){
    if(n%2 == 0){
        return 0;
    }
    else{
        return 1;
    }
}

int main(){
    int x;

    printf("Digite um número: ");
    scanf("%d", &x);

    if(par(x) == 0){
        printf("A função par retornou verdadeiro = %d", par(x));
    }
    else{
        printf("A função par retornou falso = %d", par(x));
    }
}
