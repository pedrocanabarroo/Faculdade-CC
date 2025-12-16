#include <stdio.h>

//exercicio 2 - lista 2

float v[15]; //variável global
void mostrarVetor(){
    int a;
    printf("Vetor: \n");
    for (a = 0; a < 15; a++){
        printf("%.0f\t", v[a]);
    }

    return ;
}

void calculo(float x){
    int i;
    for (i = 0; i < 15; i++){
        v[i] = v[i] * x;
    }

    return ;
}

int main(){
    float n;
    int i;

    printf("Digite um número: ");
    scanf("%f", &n);

    //gerando elementos de v
    for (i = 0; i < 15; i++){
        v[i] = rand()%30;
    }

    mostrarVetor();
    calculo(n);
    mostrarVetor();
}
