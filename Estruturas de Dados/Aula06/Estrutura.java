import java.util.ArrayList;
import java.util.Comparator;
import java.util.Random;
import java.util.Scanner;
import java.util.Comparator;

public class Estrutura{

    public static void gerarProcessos(ArrayList<Processo> lista){
        int id;
        String descricao;
        Scanner teclado = new Scanner(System.in);
        Random gerador = new Random ();
        Processo tmp;

        while(true){
            id = gerador.nextInt(500);
            System.out.println("Descricao do Processo: ");
            descricao = teclado.nextLine().toUpperCase();
            if (descricao.equals("SAIR")){
                break;
            }
            tmp = new Processo(id, descricao);
            if (!lista.contains(tmp)){
                lista.add(tmp);
            }
        }
    }

    public static void exibirProcessos(ArrayList<Processo> lista){
        for(Processo p : lista){
            System.out.println(p);
        }
    }

    public static void localizarProcesso(ArrayList<Processo> lista){
        Scanner teclado = new Scanner(System.in);
        String descricao;
        System.out.println("Digite o ID do processo a ser localizado: ");
        int id = teclado.nextInt();
        Processo tmp = new Processo(id, null);
        if (lista.contains(tmp)){
            int index = lista.indexOf(tmp);
            System.out.println("Processo encontrado: " + lista.get(index));
        } else {
            System.out.println("Processo não encontrado.");
        }
    }

    public static void localzarParaRemover(ArrayList<Processo> lista){
        Scanner teclado = new Scanner(System.in);
        String descricao;
        System.out.println("Digite o ID do processo a ser removido: ");
        int id = teclado.nextInt();
        Processo tmp = new Processo(id, null);
        if (lista.contains(tmp)){
            lista.remove(tmp);
            System.out.println("Processo removido.");
        } else {
            System.out.println("Processo não encontrado.");
        }
    }

    public static void main(String[ ] args){

        ArrayList<Processo> lista = new ArrayList<>();
        
        Estrutura.gerarProcessos(lista);
        Estrutura.exibirProcessos(lista);
        Estrutura.localizarProcesso(lista);
        Estrutura.localzarParaRemover(lista);
        Estrutura.exibirProcessos(lista);
    }
}
