#include <stdio.h>

struct endereco{
    char rua[40];
    int nro;
    char complemento[20];
    char CEP[10];
    char cidade[30];
    char estado[3];
};

struct pessoa{
    char nome[60];
    struct endereco e;
};

int main(){
    struct pessoa a;

    printf("Informe o nome: ");
    fgets(a.nome, 60, stdin);
    printf("Rua: ");
    fgets(a.e.rua, 40, stdin);
    printf("Numero: ");
    scanf("%d", &a.e.nro);
    printf("Complemento: ");
    fflush(stdin);
    fgets(a.e.complemento, 20, stdin);
    printf("CEP: ");
    fgets(a.e.CEP, 10, stdin);
    printf("Cidade: ");
    fgets(a.e.cidade, 30, stdin);
    printf("Estado: ");
    fgets(a.e.estado, 3, stdin);

    puts(a.nome);
    puts(a.e.rua);
    printf("numero %d\n", a.e.nro);
    puts(a.e.complemento);
    puts(a.e.CEP);
    puts(a.e.cidade);
    puts(a.e.estado);

    return 0;

}
