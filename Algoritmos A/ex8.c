#include <stdio.h>
#include <math.h>
//Escrever um algoritmo para ler as dimensões de uma cozinha (comprimento, largura e altura), calcular e
//escrever a quantidade de caixas de azulejos para azulejar todas as paredes (considere que não será
//descontada a área ocupada por portas e janelas). Cada caixa de azulejos possui 1,5 metros quadrados.
int main(){

    float comprimento, largura, altura;
    float area_total, caixas_azulejos;

    printf("Digite o comprimento da cozinha (em metros): ");
    scanf("%f", &comprimento);

    printf("Digite a largura da cozinha (em metros): ");
    scanf("%f", &largura);

    printf("Digite a altura da cozinha (em metros): ");
    scanf("%f", &altura);

    area_total = 2 * (comprimento * altura) + 2 * (largura * altura);

    caixas_azulejos = area_total / 1.5;

    int caixas_necessarias = (int)ceil(caixas_azulejos);

    printf("A quantidade de caixas de azulejos necessárias é: %d\n", caixas_necessarias);

    return 0;
}
