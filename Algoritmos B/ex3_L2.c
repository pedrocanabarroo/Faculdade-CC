/*Escrever um programa que leia dois números e a seguir realize as operações aritméticas básicas
(+, -, *, /) sobre estes números. Cada uma das operações deve ser implementada em uma função
diferente. */

#include <stdio.h>
#include <locale.h>

float soma(float x, float y){
    return x + y;
}

float sub(float x, float y){
    return x - y;
}

float mult(float x, float y){
    return x * y;
}

float div(float x, float y){
    if (y == 0){
        printf("divisão por zero não existe!!!");
        return 0;
    }
    else{
        return x / y;
    }
    return 1;
}

int main(){

    setlocale(LC_ALL, "Portuguese");

    float a, b;

    printf("Informe dois números: ");
    scanf("%f%f", &a, &b);

    printf("Soma = %f\n", soma(a,b));
    printf("Subtração = %f\n", sub(a,b));
    printf("Multiplicação = %f\n", mult(a,b));
    printf("\nDivisão = %f\n", div(a,b));

    return 0;
}
