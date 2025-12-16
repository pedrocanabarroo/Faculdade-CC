#include <stdio.h>

int m[6][6];

void lerLinha(){
    int j;
    printf("Insira os elementos da 1ª linha: \n");
    for(j = 0; j < 6; j++){
        scanf("%d", &m[0][j]);
    }
    return ;
}

void preencherMatriz(){
    int i, j;
    for (i = 1; i < 6; i++){
        for(j = 0; j < 6; j++){
            m[i][j] = m[0][j] * (i+1);
        }
    }
    return ;
}

void mostrarMatriz(){
    int i, j;
    printf("------ Matriz ------\n");
    for(i = 0; i < 6; i++){
        for(j = 0; j < 6; j++){
            printf("%d\t", m[i][j]);
        }
        printf("\n");
    }
    return ;
}

int main(){
    lerLinha();
    preencherMatriz();
    mostrarMatriz();
}
