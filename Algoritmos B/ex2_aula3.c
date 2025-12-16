#include <stdio.h>
#define pi 3.14159

void linha(){
    printf("=============================================================\n");
    return ;
}

float funcaoArea(float r){
    return pi * r * r;
}

float funcaoPerimetro(float r){
    return 2 * pi * r;
}

int main(){
    float raio, raio2;
    float area, area2;
    float perimetro, perimetro2;

    linha();
    printf("Cálculo da Área e do Perímetro de um Círculo.\n");
    linha();
    printf("Insira o valor do raio do círculo: ");
    scanf("%f%f", &raio, &raio2);
    area = funcaoArea(raio);
    printf("Area = %f\n", area);
    printf("Area = %f\n", funcaoArea(raio2));
    perimetro = funcaoPerimetro(raio);
    printf("Perimetro = %f\n");
    linha();

    return 0;
}
