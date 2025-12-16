#include <stdio.h>
#include <locale.h>

void bissexto(int ano){
    if (ano % 400 == 0){
        printf("Ano bissexto!");
    }
    else if (ano % 100 == 0){
        printf("Ano não é bissexto!");
    }
    else if(ano % 4 == 0){
        printf("Ano bissexto!");
    }
    else{
        printf("Ano não é bissexto!");
    }
    return ;
}

int main(){
    int a;

    setlocale(LC_ALL,"Portuguese");

    printf("Informe o ano: ");
    scanf("%d", &a);

    bissexto(a);

    return 0;
}
