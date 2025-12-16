/*Escreva um programa que faça o controle das informações relativas aos funcionários de uma
determinada empresa. As informações que devem ser armazenadas são: Nome, Salário, Cargo e
Idade. Defina a estrutura de dados e faça a leitura e exibição dos dados para um funcionário.*/

#include <stdio.h>

struct funcionario{
    char nome[20];
    char cargo[15];
    float salario;
    int idade;
};

int main(){
    struct funcionario f;

    printf("Digite o nome do funcionario: ");
    scanf("%s", f.nome);

    printf("Digite o cargo do funcionario: ");
    scanf("%s", f.cargo);

    printf("Digite o salario deste funcionario: ");
    scanf("%f", &f.salario);

    printf("Digite a idade deste funcionario: ");
    scanf("%d", &f.idade);

    printf("\nDados do funcionario:\n");
    printf("Nome: %s\n", f.nome);
    printf("Cargo: %s\n", f.cargo);
    printf("Salario: %.2f\n", f.salario);
    printf("Idade: %d\n", f.idade);

    return 0;
}
