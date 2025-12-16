#include <stdio.h>

struct produto{
    char tipo[50];
    int ano;
};

int main(){
    struct produto a[3];
    int i;
    FILE *arquivo;

    for(i=0; i<3; i++){
        printf("Tipo Produto: ");
        scanf("%s", a[i].tipo);
        printf("Ano: ");
        scanf("%i", &a[i].ano);
        printf("\n");
    }

    printf("Dados:\n");
    for(i=0; i<3; i++){
        printf("%s\n", a[i].tipo);
        printf("%i\n", a[i].ano);
    }

    arquivo = fopen("dados.txt", "w");

    if (!arquivo){
        printf("Erro na abertura do arquivo!!!");
        exit(-1);
    }

    for(i=0; i<3; i++){
        fprintf(arquivo, "%s\n", a[i].tipo);
        fprintf(arquivo, "%i\n", a[i].ano);
    }

    fclose(arquivo);

    return 0;
}

