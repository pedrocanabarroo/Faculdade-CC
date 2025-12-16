package pkg;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		Aluno a = new Aluno();
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Qual o nome do aluno? ");
		a.setNome(sc.nextLine());
		System.out.println("Qual a primeira nota? ");
		a.setNota1(sc.nextFloat());
		System.out.println("Qual a segunda nota? ");
		a.setNota2(sc.nextFloat());
		
		System.out.println("Nome do aluno: "+a.getNome());
		System.out.println("A média do aluno foi de: "+a.calculaMedia());
		
		
	}
}
