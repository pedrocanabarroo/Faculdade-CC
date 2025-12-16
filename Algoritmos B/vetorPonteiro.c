#include <stdio.h>

void lerVetor(int *p){
    int i;
    for(i = 0; i < 5; i++)
        scanf("%d", p+i);
    return ;
}

void mostrarVetor(int *x){
    int i;
    for(i = 0; i < 5; i++)
        printf("%d\t", *(x+i));
    return ;
}

void somarVetores(int *v1, int *v2, int *v3){
    int i;
    for(i = 0; i < 5; i++)
        *(v3+i) = *(v1+i) + *(v2+i);
    return ;

}

int main(){
    int v[5], t[5], s[5];

    printf("Insira os dados do primeiro vetor: ");
    lerVetor(v);
    printf("Insira os dados do segundo vetor: ");
    lerVetor(t);
    printf("\nVetor 1: ");
    mostrarVetor(v);
    printf("\nVetor 2: ");
    mostrarVetor(t);
    somarVetores(v,t,s);
    printf("\nSoma dos vetores 1 e 2: ");
    mostrarVetor(s);
}
