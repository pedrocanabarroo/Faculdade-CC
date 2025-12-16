#include <stdio.h>
int main (){

int n1, n2;
float media;

printf("Nota 1: ");
scanf("%i", &n1);

printf("Nota 2: ");
scanf("%i", &n2);

media = (float) (n1+n2)/2;
printf("A media foi de = %.2f", media);

return 0;
}
