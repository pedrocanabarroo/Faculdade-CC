/*Desenvolva um programa para ler as notas 1, 2 e 3 de um estudante. Em uma função, calcule a
média aritmética do estudante.*/

#include <stdio.h>
#include <locale.h>

float media(float x, float y, float z){
    return (x + y + z)/3;
}

int main(){

    setlocale(LC_ALL, "Portuguese");

    float n1, n2, n3;

    printf("Informe a nota 1: ");
    scanf("%f", &n1);
    printf("Informe a nota 2: ");
    scanf("%f", &n2);
    printf("Informe a nota 3: ");
    scanf("%f", &n3);

    printf("A média aritmética das notas do estudante é: %f", media(n1,n2,n3));

    return 0;
}
