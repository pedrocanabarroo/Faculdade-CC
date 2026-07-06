public class Figura implements Comparable<Figura> {
    private String nomeSelecao;
    private int numeroFigura;
    private String descricao;
    private int quantidade;
    private boolean rara;

    public Figura(String nomeSelecao, int numeroFigura, String descricao, int quantidade, boolean rara) {
        this.nomeSelecao = nomeSelecao;
        this.numeroFigura = numeroFigura;
        this.descricao = descricao;
        this.quantidade = quantidade;
        this.rara = rara;
    }

    public String getNomeSelecao() { 
        return nomeSelecao; 
    }
    public int getNumeroFigura() { 
        return numeroFigura; 
    }
    public String getDescricao() { 
        return descricao; 
    }
    public int getQuantidade() { 
        return quantidade; 
    }
    public boolean isRara() { 
        return rara; 
    }

    // Formato para salvar no CSV
    public String toCSV() {
        return nomeSelecao + ";" + numeroFigura + ";" + descricao + ";" + quantidade + ";" + rara;
    }

    @Override
    public String toString() {
        return String.format("[%s - %02d] %s (Qtd: %d) %s", 
                nomeSelecao, numeroFigura, descricao, quantidade, rara ? "[RARA]" : "");
    }

    @Override
    public int compareTo(Figura outra) {
        int comparacaoSelecao = this.nomeSelecao.compareToIgnoreCase(outra.nomeSelecao);
        if (comparacaoSelecao == 0) {
            return Integer.compare(this.numeroFigura, outra.numeroFigura);
        }
        return comparacaoSelecao;
    }
}
