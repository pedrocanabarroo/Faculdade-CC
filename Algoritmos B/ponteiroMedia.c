#include <stdio.h>

int main(){
   int a, b, media;
   float *pa, *pb, *pmedia;

   pa = &a;
   pb = &b;
   pmedia = &media;

   printf("Digite a nota 1: ");
   scanf("%f", pa);
   printf("Digite a nota 2: ");
   scanf("%f", pb);

   *pmedia = (*pa + *pb)/2;

   printf("media = %.2f", *pmedia);
}
