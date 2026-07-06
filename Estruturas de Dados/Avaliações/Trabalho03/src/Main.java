import java.io.*;
import java.util.Scanner;

public class Main {
    private static ArvoreBinaria arvore_repetidas_pessoais = new ArvoreBinaria();
    private static ArvoreBinaria arvore_desejadas_pessoais = new ArvoreBinaria();
    
    // Caminhos apontando para a pasta que você criou
    private static final String ARQUIVO_REPETIDAS = "dados/repetidas_pedro.csv";
    private static final String ARQUIVO_DESEJADAS = "dados/desejadas_pedro.csv";

    public static void main(String[] args) {

        // Inicialização: carregar arquivos pessoais para as árvores assim que inicia
        carregarArquivoParaArvore(ARQUIVO_REPETIDAS, arvore_repetidas_pessoais);
        carregarArquivoParaArvore(ARQUIVO_DESEJADAS, arvore_desejadas_pessoais);

        Scanner scanner = new Scanner(System.in);
        int opcao;

        do {
            System.out.println("\n--- GERENCIADOR DE FIGURINHAS DA COPA 2026 ---");
            System.out.println("1 - Cadastrar figuras repetidas pessoais");
            System.out.println("2 - Listar figuras repetidas pessoais");
            System.out.println("3 - Cadastrar figuras desejadas pessoais");
            System.out.println("4 - Listar figuras desejadas pessoais");
            System.out.println("5 - Carregar figuras repetidas OUTRO (verificar match de desejadas)");
            System.out.println("6 - Carregar figuras desejadas OUTRO (verificar match de repetidas)");
            System.out.println("7 - Sair");
            System.out.print("Escolha uma opção: ");
            
            opcao = lerInteiro(scanner);

            switch (opcao) {
                case 1:
                    cadastrarFigura(scanner, ARQUIVO_REPETIDAS, arvore_repetidas_pessoais);
                    break;
                case 2:
                    System.out.println("\n-- Suas Figuras Repetidas --");
                    arvore_repetidas_pessoais.listarEmOrdem();
                    break;
                case 3:
                    cadastrarFigura(scanner, ARQUIVO_DESEJADAS, arvore_desejadas_pessoais);
                    break;
                case 4:
                    System.out.println("\n-- Suas Figuras Desejadas --");
                    arvore_desejadas_pessoais.listarEmOrdem();
                    break;
                case 5:
                    processarArquivoOutro(scanner, arvore_desejadas_pessoais, true);
                    break;
                case 6:
                    processarArquivoOutro(scanner, arvore_repetidas_pessoais, false);
                    break;
                case 7:
                    System.out.println("Saindo do programa. Rumo ao Hexa!");
                    break;
                default:
                    System.out.println("Opção inválida!");
            }
        } while (opcao != 7);

        scanner.close();
    }

    private static void cadastrarFigura(Scanner scanner, String nomeArquivo, ArvoreBinaria arvore) {
        System.out.print("Nome da Seleção: ");
        String selecao = scanner.nextLine();
        
        System.out.print("Número da Figura: ");
        int numero = lerInteiro(scanner);
        
        System.out.print("Descrição (Jogador, Brasão, Bandeira): ");
        String descricao = scanner.nextLine();
        
        System.out.print("Quantidade: ");
        int quantidade = lerInteiro(scanner);
        
        System.out.print("É rara? (true/false): ");
        boolean rara = Boolean.parseBoolean(scanner.nextLine());

        Figura novaFigura = new Figura(selecao, numero, descricao, quantidade, rara);
        
        // Adiciona na árvore em memória e salva no CSV
        arvore.inserir(novaFigura);
        salvarNoArquivo(nomeArquivo, novaFigura);
        System.out.println("Figura cadastrada com sucesso!");
    }

    private static void salvarNoArquivo(String caminhoArquivo, Figura figura) {
        try (PrintWriter pw = new PrintWriter(new FileWriter(caminhoArquivo, true))) {
            pw.println(figura.toCSV());
        } catch (IOException e) {
            System.out.println("Erro ao salvar figura: " + e.getMessage());
        }
    }

    private static void carregarArquivoParaArvore(String caminhoArquivo, ArvoreBinaria arvore) {
        File file = new File(caminhoArquivo);
        if (!file.exists()) return;

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String linha;
            while ((linha = br.readLine()) != null) {
                String[] dados = linha.split(";");
                if (dados.length == 5) {
                    Figura f = new Figura(
                        dados[0], 
                        Integer.parseInt(dados[1]), 
                        dados[2], 
                        Integer.parseInt(dados[3]), 
                        Boolean.parseBoolean(dados[4])
                    );
                    arvore.inserir(f);
                }
            }
        } catch (IOException | NumberFormatException e) {
            System.out.println("Erro ao carregar o arquivo " + caminhoArquivo + ": " + e.getMessage());
        }
    }

    private static void processarArquivoOutro(Scanner scanner, ArvoreBinaria arvoreComparacao, boolean buscandoDesejadas) {
        System.out.print("Digite o caminho do arquivo CSV do OUTRO (ex: dados/repetidas_joao.csv): ");
        String caminho = scanner.nextLine();
        File file = new File(caminho);

        if (!file.exists()) {
            System.out.println("Arquivo não encontrado! Certifique-se de digitar a pasta e o .csv");
            return;
        }

        System.out.println("\nAnalisando o arquivo: " + caminho);
        System.out.println("---------------------------------------------------");
        
        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String linha;
            boolean encontrouAlgo = false;

            while ((linha = br.readLine()) != null) {
                String[] dados = linha.split(";");
                if (dados.length == 5) {
                    Figura figuraOutro = new Figura(
                        dados[0], Integer.parseInt(dados[1]), dados[2], 
                        Integer.parseInt(dados[3]), Boolean.parseBoolean(dados[4])
                    );
                    
                    System.out.println("Analisando: " + figuraOutro.toString());

                    // Verifica o Match na sua árvore
                    if (arvoreComparacao.contem(figuraOutro)) {
                        encontrouAlgo = true;
                        if (buscandoDesejadas) {
                            System.out.println("  ---> [MATCH!] Esta é uma figura que VOCÊ DESEJA!");
                        } else {
                            System.out.println("  ---> [MATCH!] O outro deseja esta figura que VOCÊ TEM REPETIDA!");
                        }
                    }
                }
            }
            if (!encontrouAlgo) {
                System.out.println("\nNenhum match encontrado para troca :(");
            }
        } catch (IOException | NumberFormatException e) {
            System.out.println("Erro ao processar arquivo: " + e.getMessage());
        }
        System.out.println("---------------------------------------------------");
    }

    private static int lerInteiro(Scanner scanner) {
        while (true) {
            try {
                return Integer.parseInt(scanner.nextLine());
            } catch (NumberFormatException e) {
                System.out.print("Por favor, digite um número válido: ");
            }
        }
    }
}
