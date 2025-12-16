/*Faça um programa que lê uma string, letra por letra, e ao final da execução mostra a string completa. Antes
de começar a ler as letras de string, peça para o usuário informar o tamanho da string e aloque
dinamicamente um vetor com o tamanho necessário.*/

#include <stdio.h>
#include <stdlib.h>

void lerString(char *str, int t){
	int i = 0;
	printf("Digite a string letra por letra: \n");
	while(i < t){
		fflush(stdin);
		scanf("%c", &str[i]);
		i++;
	}	
	str[t] = '\0'; //*(str+t) = '\0';
	
	return ;
}

int main(){
	int tamanho;
	char *s;
	
	printf("Tamanho da string: ");
	scanf("%d", &tamanho);
	
	//alocação dinâmica de memória
	
	s = (char*)malloc(tamanho+1);
	if(!s){
		printf("Erro na alocação dinâmica!");
		exit(-1);
	}
	
	lerString(s, tamanho);
	printf("%s", s);
	free(s);
	return 0;
	
}
