#include <stdio.h>
#include <locale.h>
int v[10]; //variável global

void mostrarPares(){
    int i;
    printf("Elementos Pares\n");
    for (i = 0; i < 10; i++){
        if(v[i]%2 == 0){
            printf("%d na posição %d\n", v[i], i);
        }
    }

    return ;
}

int main(){

    setlocale(LC_ALL,"Portuguese");

    int i;

    printf("Digite 10 números inteiros: \n");
    for(i = 0; i < 10; i++){
        scanf("%i", &v[i]);
    }

    mostrarPares();

    return 0;
}
