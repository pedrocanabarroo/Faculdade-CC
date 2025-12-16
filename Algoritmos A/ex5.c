#include <stdio.h>
int main(){
//Ler numero de eleitores, votos brancos, nulos e válidos
//% votos brancos, % votos nulos, % votos válidos

//declaração das variaveis
int eleitores, v_brancos, v_nulos, v_validos;
float p_brancos, p_nulos, p_validos;


printf("Numero de eleitores: ");
scanf("%i", &eleitores);

printf("Votos validos: ");
scanf("%i", &v_validos);

p_validos = (float) (v_validos*100/eleitores);
printf("Percentual de votos validos = %.2f \n", p_validos);

printf("Votos nulos: ");
scanf("%i", &v_nulos);

p_nulos = (float) (v_nulos*100/eleitores);
printf("Percentual de votos nulos = %.2f \n", p_nulos);

printf("Votos brancos: ");
scanf("%i", &v_brancos);

p_brancos = (float) (v_brancos*100/eleitores);
printf("Percentual de votos brancos = %.2f \n", p_brancos);

return 0;
}

