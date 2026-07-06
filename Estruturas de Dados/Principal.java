import java.util.ArrayList;

public class Principal {
    public static void main(String[] args) {
        ArrayList<Clima> lista = new ArrayList<>();

        String linha = "2020,Janeiro,Quente,muita";
        String dadosLinha[] = linha.split(",");
        Clima objClima = new Clima(dadosLinha[0], dadosLinha[1], dadosLinha[2], dadosLinha[3]);
        if (lista.contains(objClima)){
            lista.add(objClima);
        }

        linha = "2020,Janeiro,Frio,Pouca";
        dadosLinha = linha.split(",");
        objClima = new Clima(dadosLinha[0], dadosLinha[1], dadosLinha[2], dadosLinha[3]);
        if (lista.contains(objClima)){
            lista.add(objClima);
        }
        
        for (Clima c : lista){
            System.out.println(c);
        }
    }
}
