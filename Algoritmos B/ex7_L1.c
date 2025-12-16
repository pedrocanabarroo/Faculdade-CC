#include <stdio.h>

struct hora{
    int h;
    int min;
    int seg;
};

int main(){
    char stringHora[9];
    char aux[3];
    struct hora horario;

    printf("informe um horario (hh:mm:ss)\n");
    scanf("%s", stringHora);

    aux[0] = stringHora[0];
    aux[1] = stringHora[1];
    aux[2] = '\0';

    horario.h = atoi(aux);

    aux[0] = stringHora[3];
    aux[1] = stringHora[4];

    horario.min = atoi(aux);

    aux[0] = stringHora[6];
    aux[1] = stringHora[7];

    horario.seg = atoi(aux);

    printf("%d hora(s) , %d minuto(s) , %d segundo(s)", horario.h, horario.min, horario.seg);


    return 0;
}
