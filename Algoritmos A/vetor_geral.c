#include <stdio.h>
#include <locale.h>

int main(){
setlocale(LC_ALL,"Portuguese");

    int v[10];
    int i;

    printf("Informe 10 valores inteiros: \n");

    for(i = 0; i <= 9; i++){
        printf("v[%d] = ", i);
        scanf("%i", &v[i]);
    }

    printf("Vetor na ordem inversa de indíces: \n");

    for(i = 9; i >= 0; i--){
        printf("v[%d] = %d\n", i, v[i]);
    }


return 0;




}
