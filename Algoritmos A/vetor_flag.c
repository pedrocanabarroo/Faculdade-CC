#include <stdio.h>
#include <locale.h>

int main(){
setlocale(LC_ALL,"Portuguese");

    int v[10];
    int i, n, flag=1;

    printf("Informe 10 valores inteiros: \n");

    for(i = 0; i <= 9; i++){
        printf("v[%d] = ", i);
        scanf("%i", &v[i]);
    }

    printf("Digite um número para procurar no vetor: ");
    scanf("%i", &n);

    for(i=0;i<10;i++){
        if(v[i]==n)
            flag = 0;
    }

    if(flag==1){
        printf("Valor %d não encontrado", n);
    }
    else{
        printf("Valor %d encontrado", n);
    }
return 0;
}
