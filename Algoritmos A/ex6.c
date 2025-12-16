#include <stdio.h>
//Um motorista de taxi deseja calcular o rendimento de seu carro na praça. Escreva um algoritmo para ler
//o valor do litro do combustível (em R$), a marcação do odômetro no início do dia, a marcação do
//odômetro no final do dia, o número de litros de combustível gasto e o valor total (R$) recebido dos
//passageiros. Calcule e escreva a média do consumo em Km/l e o lucro líquido do dia.
#include <stdio.h>

int main() {
    // Declaração das variáveis
    float valor_litro_combustivel, marca_inicio_odometro, marca_fim_odometro;
    float litros_gastos, valor_total_passageiros;
    float distancia_percorrida, consumo_medio, custo_combustivel, lucro_liquido;

    // Passo 1: Ler os dados de entrada
    printf("Digite o valor do litro do combustivel (R$): ");
    scanf("%f", &valor_litro_combustivel);

    printf("Digite a marcacao inicial do odometro (Km): ");
    scanf("%f", &marca_inicio_odometro);

    printf("Digite a marcacao final do odometro (Km): ");
    scanf("%f", &marca_fim_odometro);

    printf("Digite o numero de litros de combustivel gasto: ");
    scanf("%f", &litros_gastos);

    printf("Digite o valor total recebido dos passageiros (R$): ");
    scanf("%f", &valor_total_passageiros);

    // Passo 2: Calcular a distância percorrida
    distancia_percorrida = marca_fim_odometro - marca_inicio_odometro;

    // Passo 3: Calcular o consumo médio (Km/l)
    consumo_medio = distancia_percorrida / litros_gastos;

    // Passo 4: Calcular o custo com combustível
    custo_combustivel = litros_gastos * valor_litro_combustivel;

    // Passo 5: Calcular o lucro líquido
    lucro_liquido = valor_total_passageiros - custo_combustivel;

    // Passo 6: Exibir os resultados
    printf("\nConsumo medio do carro: %.2f Km/l\n", consumo_medio);
    printf("Lucro liquido do dia: R$ %.2f\n", lucro_liquido);

    return 0;
}


