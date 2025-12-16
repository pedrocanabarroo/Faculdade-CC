#include <stdio.h>
#include <locale.h>

int main(){

    int legenda[5], votos[5], i, vencedor = 0, iVencedor, totalVotos = 0;
    float percentual[5];

    setlocale(LC_ALL,"Portuguese");

    printf("Informe o número de cada candidato: ");
    for (i = 0; i < 5; i++){
        scanf("%i", &legenda[i]);
    }

    printf("Votos: \n");
    for (i = 0; i < 5; i++){
        scanf("%i", &votos[i]);
        if(votos[i] > vencedor){
            vencedor = votos[i];
            iVencedor = i;
        }
        totalVotos += votos[i];
    }

    for (i = 0; i < 5; i++){
        percentual[i] = (float)votos[i]/totalVotos * 100;
    }

    printf("Legenda\tQuantidade de votos\tPercentual\n");
    for (i = 0; i < 5; i++){
        printf("%d \t %d \t\t\t %.2f%%\n", legenda[i], votos[i], percentual[i]);
    }

    printf("Vencedor: \n");
    printf("Legenda: %d --- Quantidade de votos: %d --- Percentual %.2f\n", legenda[iVencedor], votos[iVencedor], percentual[iVencedor]);

return 0;
}
