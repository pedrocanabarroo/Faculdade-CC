/*A loja VendeTudo possui 50 clientes. O gerente, para cada cliente, necessita armazenar o nome,
cidade onde mora, o total da compra e o mês que o cliente comprou. Desenvolva o programa
para ler e mostrar os dados.*/

#include <stdio.h>

struct clientes{
    char nome[30];
    char cidade[30];
    int mes;
    float totalGasto;
};

int main(){
    struct clientes c[50];
    int i;

    for (i = 0; i < 50; i++){
        printf("Digite os dados do cliente %d: \n", i + 1);

        printf("Nome do cliente: ");
        scanf("%s", c[i].nome);

        printf("Digite onde o cliente reside: ");
        scanf(" %s", c[i].cidade);

        printf("Digite o mes em que o cliente gastou: ");
        scanf("%d", &c[i].mes);

        printf("Digite o total gasto por esse cliente: ");
        scanf("%f", &c[i].totalGasto);

        printf("\n");
    }

    printf("\nDados do cliente:\n");
    for (i = 0; i < 50; i++){
        printf("Cliente %d: \n", i + 1);
        printf("Nome: %s\n", c[i].nome);
        printf("Cidade: %s\n", c[i].cidade);
        printf("Mes: %d:\n", c[i].mes);
        printf("Total: %.2f:\n", c[i].totalGasto);

        printf("\n");
    }

    return 0;

}

