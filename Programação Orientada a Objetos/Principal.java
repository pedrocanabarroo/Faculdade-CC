package pkg;

public class Principal {

	public static void main(String[] args) {
		Pessoa p = new Pessoa("Pedro", 22, "123456789");
		int idade, ano;
		idade = p.getIdade();
		ano = 2025 - idade;
		p.apresentaDados();
		System.out.println("Ano de nascimento: "+ano);
		p.setIdade(-29);
		p.setNome("Rodrigo");
		p.apresentaDados();
		
		System.out.println("Nome: "+p.getNome());
		System.out.println("Idade: "+p.getIdade());
		System.out.println("CPF: "+p.getCpf());
		
	}

}
