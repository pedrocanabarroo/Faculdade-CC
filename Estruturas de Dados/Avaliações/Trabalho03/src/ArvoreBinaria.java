class No {
    Figura figura;
    No esquerda, direita;

    public No(Figura figura) {
        this.figura = figura;
        esquerda = direita = null;
    }
}

public class ArvoreBinaria {
    private No raiz;

    public ArvoreBinaria() {
        this.raiz = null;
    }

    // Método de Inserção
    public void inserir(Figura figura) {
        raiz = inserirRecursivo(raiz, figura);
    }

    private No inserirRecursivo(No raiz, Figura figura) {
        if (raiz == null) {
            raiz = new No(figura);
            return raiz;
        }

        if (figura.compareTo(raiz.figura) < 0) {
            raiz.esquerda = inserirRecursivo(raiz.esquerda, figura);
        } else if (figura.compareTo(raiz.figura) > 0) {
            raiz.direita = inserirRecursivo(raiz.direita, figura);
        }
        return raiz;
    }

    // Exibir em ordem
    public void listarEmOrdem() {
        if (raiz == null) {
            System.out.println("Nenhuma figura cadastrada nesta lista.");
            return;
        }
        listarRecursivo(raiz);
    }

    private void listarRecursivo(No raiz) {
        if (raiz != null) {
            listarRecursivo(raiz.esquerda);
            System.out.println(raiz.figura.toString());
            listarRecursivo(raiz.direita);
        }
    }

    // Método de Busca para os Matches
    public boolean contem(Figura figuraBusca) {
        return buscarRecursivo(raiz, figuraBusca) != null;
    }

    private No buscarRecursivo(No raiz, Figura figura) {
        if (raiz == null || (raiz.figura.compareTo(figura) == 0)) {
            return raiz;
        }

        if (raiz.figura.compareTo(figura) > 0) {
            return buscarRecursivo(raiz.esquerda, figura);
        }
        return buscarRecursivo(raiz.direita, figura);
    }
}
