#include <stdio.h>

int contar(char *p, char l){
    int qtde = 0;
    for( ;*p != '\0'; p++)
        if(*p == l){
            qtde++;
            *p = 'x';
        }
    return qtde;
}
int main(){
    char palavra[30], letra;
    int q;

    printf("Digite a palavra: ");
    scanf("%s", palavra);
    fflush(stdin);
    printf("Digite a letra: ");
    scanf("%c", &letra);

    q = contar(palavra, letra);

    printf("Quantidade = %d\n", q);
    puts(palavra);
    return 0;
}
