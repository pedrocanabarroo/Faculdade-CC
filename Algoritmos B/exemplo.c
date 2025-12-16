#include <stdio.h>

struct tipo_aluno{
    char matricula[11];
    char nome[30];
    int anoIngresso;
    float mediaVestibular;
};

int main(){
    struct tipo_aluno aluno;

    printf("Digite a matricula do aluno: ");
    scanf("%s", aluno.matricula);

    printf("Digite o nome do aluno: ");
    scanf(" %s", aluno.nome);

    printf("Digite o ano de ingresso do aluno: ");
    scanf("%d", &aluno.anoIngresso);

    printf("Digite a media do vestibular: ");
    scanf("%f", &aluno.mediaVestibular);

    printf("\nDados do aluno: \n");
    printf("Matricula: %s\n", aluno.matricula);
    printf("Nome: %s\n", aluno.nome);
    printf("Ano de Ingresso: %d\n", aluno.anoIngresso);
    printf("Media do Vestibular: %.2f\n", aluno.mediaVestibular);

    return 0;

}
