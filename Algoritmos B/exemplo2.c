#include <stdio.h>

struct TipoAluno{
    char matricula[11];
    char nome[30];
    int anoIngresso;
    float mediaVestibular;
};

int main(){
    struct TipoAluno alunos[5];
    int i;

    for (i = 0; i < 5; i++){
        printf("Digite os dados do aluno %d: \n", i + 1);

        printf("Matricula (maximo de 10 caracteres): ");
        scanf("%s", alunos[i].matricula);

        printf("Digite o nome do aluno: ");
        scanf(" %s", alunos[i].nome);

        printf("Digite o ano de ingresso do aluno: ");
        scanf("%d", &alunos[i].anoIngresso);

        printf("Digite a media do vestibular deste aluno: ");
        scanf("%f", &alunos[i].mediaVestibular);

        printf("\n");
    }

    printf("\nDados do aluno:\n");
    for (i = 0; i < 5; i++){
        printf("Aluno %d: \n", i + 1);
        printf("Matricula: %s\n", alunos[i].matricula);
        printf("Nome: %s\n", alunos[i].nome);
        printf("Ano de Ingresso: %d:\n", alunos[i].anoIngresso);
        printf("Media do vestibular: %.2f:\n", alunos[i].mediaVestibular);

        printf("\n");
    }

    return 0;

}
