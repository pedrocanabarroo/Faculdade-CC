import java.io.BufferedReader;
import java.io.FileReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

public class PrincipalClima {
    public static void main(String[] args) {

        //lista para armazenar os objetos da classe Clima
        List<Clima> lista = new ArrayList<>();

        // nome do arquivo a ser lido
        String nomeBase = "base.csv";

        // O try-with-resources já fecha o arquivo automaticamente (igual ao 'with' do Python)
        //abre o arquivo para leitura
        try (BufferedReader leitor = new BufferedReader(
                new FileReader(nomeBase, StandardCharsets.UTF_8))) {
            
            String linha;

            //Lê o arquivo linha por linha
            while ((linha = leitor.readLine()) != null) {

                //divide a linha usando vírgula
                String[] dadosLinha = linha.split(",");
                
                //cria um objeto da classe Clima usando os dados da linha
                Clima objClima = new Clima(dadosLinha[0],dadosLinha[1],dadosLinha[2], dadosLinha[3]);

                // Requer que o método equals() esteja implementado na classe Clima
                //evita a adição de objetos duplicados na lista
                if (!lista.contains(objClima)) {
                    lista.add(objClima);
                }
            }

            //exibe os objetos da lista
            for (Clima item : lista) {
                System.out.println(item);
            }

            //  QUAIS MESES SÃO MAIS QUENTES?

            //lista para armazenar os meses mais quentes encontrados
            List<Clima> mesesMaisQuentes = new ArrayList<>();

            //começa com o menor valor possível para garantir que qualquer temperatura encontrada seja maior
            int maiorValor = Integer.MIN_VALUE;

            //percorre toda a lista
            for (Clima item : lista) {
                
                //converte a temperatura do mês atual para um valor numérico
                int valorTemp = item.getValorTemperatura();

                //compara o valor da temperatura atual com o maior valor encontrado até agora
                if (valorTemp > maiorValor) {
                    maiorValor = valorTemp; //atualiza o maior valor encontrado
                    mesesMaisQuentes.clear(); // Limpa a lista para armazenar apenas os meses mais quentes
                    mesesMaisQuentes.add(item); // Adiciona o mês mais quente encontrado
                } else if (valorTemp == maiorValor) {
                    mesesMaisQuentes.add(item); // Adiciona outros meses que tenham a mesma temperatura mais alta
                }
            }

            //verifica se foram encontrados meses mais quentes e exibe os resultados
            if(!mesesMaisQuentes.isEmpty()) {
                System.out.println("\nMeses mais quentes:\n");

                //mostra os meses mais quentes encontrados
                for (Clima clima : mesesMaisQuentes) {
                    System.out.println(clima);
                }
            } else {

                //caso nenhum mês seja encontrado
                System.out.println("\nNenhum mês encontrado.");

            }

            // System.out.println("\nO mês mais quente é: " + maisQuente.mes + " do ano " + maisQuente.ano);
        
        } catch (Exception e) {

            //caso ocorra algum erro durante a leitura do arquivo
            System.err.println("Ocorreu algum erro... " + e.getMessage());
        }
    }
}
