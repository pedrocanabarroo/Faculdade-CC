#include <stdio.h>
#include <math.h>

struct ponto{
    int x;
    int y;
};

int main(){
    struct ponto p1, p2;
    float distancia;

    printf("Coordenadas x e y do ponto 1:\n");
    scanf("%d%d", &p1.x, &p1.y);

    printf("Coordenadas x e y do ponto 2:\n");
    scanf("%d%d", &p2.x, &p2.y);

    distancia = sqrt(pow(p2.x - p1.x, 2) + pow(p2.y - p1.y, 2));

    printf("A distancia entre os pontos = %.2f", distancia);

return 0;


}
