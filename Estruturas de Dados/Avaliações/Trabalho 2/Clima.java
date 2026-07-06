public class Clima{
    public String ano;
    public String mes;
    public String temperatura;
    public String precipitacao;

    public Clima(String ano, String mes, String temperatura, String precipitacao) {
        this.ano = ano;
        this.mes = mes;
        this.temperatura = temperatura;
        this.precipitacao = precipitacao;
    }

    @Override
    public String toString() {
        return "Dados climaticos(Ano: " + this.ano + ", Mês: " + this.mes + ", Temperatura: " + this.temperatura + ", Precipitação: " + this.precipitacao + ")";
    }
    //reescrevemos toString para exibir um objeeto completo da classe 
    @Override
    public boolean equals(Object obj) {
        Clima c = (Clima) obj;
        return (this.ano.equals(c.ano) && this.mes.equals(c.mes));
        //estamos dizendo quem são as chaves primárias (aquelas que não podem se repetir)
        //reescrevemos o metodo equals para definir os atributos identificadores
    }

    // método para converter a temperatura em um valor numérico

    public int getValorTemperatura(){
        String temp = this.temperatura.toLowerCase();
        if(temp.equals("frio")){
            return 1;
        } else if(temp.equals("morno")){
            return 2;
        } else if(temp.equals("quente")){
            return 3;
        } else {
            return 0; // valor padrão para casos não reconhecidos
        }
    }
    
}
