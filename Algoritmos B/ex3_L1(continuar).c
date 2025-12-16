/*A turma de Algoritmos e Programação B tem 17 alunos. Para cada aluno, é necessário
armazenar o nome, número de faltas (em horas), os valores das nota 1, nota 2, nota 3 e a média
final. A média das notas é a média aritmética e deve ser calculada. Após fazer a leitura dos
valores, calcule a média das notas, para cada aluno e mostre o resultado final de acordo com as
regras:
 Para ser aprovado, o estudante deve ter 75% de frequência. Caso
contrário, está Reprovado por Frequência.
 Se o estudante tem 75% ou mais de frequência nas aulas, o resultado
é:
◦ Aprovado, se a média final for maior ou igual a 6,0 ou
◦ Reprovado, se a média final for menor que 6,0
 Para calcular a frequência, considere que a disciplina tem 80 horas.*/

 #include <stdio.h>

 struct aluno{
    char nome[30];
    int faltas;
    float nota1;
    float nota2;
    float nota3;
    float media;
    float freq;
 };

 int main(){
    int i;
    struct aluno a[17];


    for (i = 0; i < 3; i++){

        printf("\nDigite as informacoes do aluno %d: \n", i + 1);

        printf("Digite o nome do aluno: ");
        scanf("%s", a[i].nome);
        printf("Digite as faltas do aluno (em horas): ");
        scanf("%d", &a[i].faltas);
        printf("Digite a nota 1 do aluno: ");
        scanf("%f", &a[i].nota1);
        printf("Digite a nota 2 do aluno: ");
        scanf("%f", &a[i].nota2);
        printf("Digite a nota 3 do aluno: ");
        scanf("%f", &a[i].nota3);

        printf("\n");
     }

    for (i = 0; i < 3; i++){
        a[i].media = (a[i].nota1 + a[i].nota2 + a[i].nota3)/3;
        a[i].freq = (float)((80 - a[i].faltas)/80)*100;

        if (a[i].media > 6.0){
            printf("Aluno %s aprovado com nota %.2f!", a[i].nome, a[i].media);
        }else{
            printf("\nAluno %s reprovado com nota %.2f!", a[i].nome, a[i].media);
        }

        if (a[i].freq > 75){
            printf("\nAluno %s aprovado com %.2f% frequencia!", a[i].nome, a[i].freq);
        }else{
            printf("\nAluno %s reprovado com %.2f% frequencia!", a[i].nome, a[i].freq);
        }
    }

    return 0;



 }
