#include <stdio.h>
//Um carro percorreu determinada distância em determinado tempo. Desenvolva o algoritmo para ler
//estes dados e calcular a velocidade média do carro. Sabe-se que a velocidade média é a razão entre a
//distância percorrida e o tempo para percorrê-la.
int main(){

int d,t;
float vm;

printf("A distancia percorrida: ");
scanf("%i", &d);

printf("tempo: ");
scanf("%i", &t);

vm = (float) (d/t);
printf("A velocidade media foi de = %.2f", vm);

return 0;
}
