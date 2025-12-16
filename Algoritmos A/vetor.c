#include <stdio.h>

int main(){

int codigo [10], indice, indiceMaiorPeso;
float peso [10], maiorPeso = 0, somaPesos = 0, media;

printf("Informe os dados (codigo e peso) dos 10 bois: \n");

for(indice = 0; indice <= 9; indice++){
    printf("Codigo: ");
    scanf("%d", &codigo[indice]);
    printf("Peso: ");
    scanf("%f", &peso[indice]);

    if(peso[indice]>maiorPeso){
        maiorPeso = peso[indice];
        indiceMaiorPeso = indice;
    }

    somaPesos += peso[indice];
    media = somaPesos/10;
}

printf("\n \nOs dados informados foram: \n");

for (indice = 0; indice <= 9; indice++){
    printf("Codigo: %d Peso do boi: %.1f\n", codigo[indice], peso[indice]);
}

printf("Maior peso = %f\n", maiorPeso);
printf("Codigo = %d\n",codigo[indiceMaiorPeso]);
printf("A soma dos pesos: %.2f", somaPesos);
printf("\nA media dos pesos: %.2f", media);

return 0;

}







