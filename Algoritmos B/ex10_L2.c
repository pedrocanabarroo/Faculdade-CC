/*Faça um programa, com uma função que recebe como parâmetro uma letra e uma string, e
retorne um valor inteiro indicando quantas vezes a letra aparece na string. A função main deve
ler a string, a letra e chamar a função implementada.*/

#include <stdio.h>
#include <locale.h>


char s[50];

int contarLetra(char l){
    int i, q = 0;

    for (i = 0; s[i] != '\0'; i++){
        if(s[i] == l){
            q++;
        }
    }
    return q;
}

int main(){
    char letra;

    setlocale(LC_ALL, "Portuguese");

    printf("Digite uma palavra: ");
    scanf("%s", s);
    printf("Letra: ");
    fflush(stdin);
    scanf("%c", &letra);
    printf("A letra %c ocorre %d vez(es) na palavra %s\n", letra, contarLetra(letra), s);

    return 0;
}
