#include <stdio.h>
#include <locale.h>

int main(){

    int maio [31], i, soma = 0;
    int maiorTemp = -99, menorTemp = 99;
    float media;

    setlocale(LC_ALL,"Portuguese");

    printf("MAIO --- TEMPERATURA\n");

    for(i = 0; i < 31; i++){
        printf("Dia %i: ", i+1);
        scanf("%d", &maio[i]);
        soma += maio[i];

        if(maio[i] > maiorTemp)
            maiorTemp = maio[i];

        if(maio[i] < menorTemp)
            menorTemp = maio[i];

    }

    media = (float) soma / i;

    printf("A média da temperatura em maio: %.2f\n", media);
    printf("Maior temperatura: %d\n", maiorTemp);
    printf("Menor temperatura: %d\n", menorTemp);
    printf("Dias com temperatura máxima: \n");
    for(i = 0; i < 31; i++){
        if (maiorTemp == maio[i]){
            printf("Dia %d\n", i+1);
        }
    }

    printf("Dias com temperatura mínima:\n");
    for (i = 0; i < 31; i++){
        if (menorTemp == maio[i]){
            printf("Dia %d\n", i+1);
        }
    }

return 0;
}
