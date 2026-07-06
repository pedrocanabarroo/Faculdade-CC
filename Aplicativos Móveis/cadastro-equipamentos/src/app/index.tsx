import { useState } from "react";
import {
  Alert,
  FlatList,
  StyleSheet,
  Text,
  TextInput,
  TouchableOpacity,
  View,
} from "react-native";

export default function App() {
  // 1. Definição dos estados (useState) para armazenar os dados do formulário temporariamente
  const [nome, setNome] = useState("");
  const [marca, setMarca] = useState("");
  const [numeroSerie, setNumeroSerie] = useState("");
  const [categoria, setCategoria] = useState("");

  // 2. Estado para armazenar a lista de equipamentos cadastrados em memória
  const [equipamentos, setEquipamentos] = useState([]);

  // 3. Função para salvar os dados do formulário na lista
  const handleCadastrar = () => {
    // Validação para garantir que os 4 campos obrigatórios foram preenchidos
    if (!nome || !marca || !numeroSerie || !categoria) {
      Alert.alert("Aviso", "Preencha todos os campos antes de cadastrar.");
      return;
    }

    // Criação de um objeto representando o novo equipamento com um ID único
    const novoEquipamento = {
      id: Math.random().toString(),
      nome,
      marca,
      numeroSerie,
      categoria,
    };

    // Adiciona o novo equipamento na lista existente
    setEquipamentos([...equipamentos, novoEquipamento]);

    // Limpa os campos do formulário após o cadastro
    setNome("");
    setMarca("");
    setNumeroSerie("");
    setCategoria("");
  };

  // 4. Função para excluir um equipamento específico da lista
  const handleExcluir = (id) => {
    const listaFiltrada = equipamentos.filter((item) => item.id !== id);
    setEquipamentos(listaFiltrada);
  };

  return (
    <View style={styles.container}>
      {/* Título Principal do Sistema */}
      <Text style={styles.tituloSistema}>Cadastro de Equipamentos</Text>

      {/* Formulário com 4 campos */}
      <View style={styles.formulario}>
        <TextInput
          style={styles.input}
          placeholder="Nome (ex: Notebook, Monitor)"
          value={nome}
          onChangeText={setNome}
        />
        <TextInput
          style={styles.input}
          placeholder="Marca (ex: Dell, Logitech)"
          value={marca}
          onChangeText={setMarca}
        />
        <TextInput
          style={styles.input}
          placeholder="Número de Série"
          value={numeroSerie}
          onChangeText={setNumeroSerie}
        />
        <TextInput
          style={styles.input}
          placeholder="Categoria (ex: Periférico, Hardware)"
          value={categoria}
          onChangeText={setCategoria}
        />

        {/* Botão de Salvar/Cadastrar */}
        <TouchableOpacity style={styles.botaoSalvar} onPress={handleCadastrar}>
          <Text style={styles.textoBotaoSalvar}>Cadastrar Equipamento</Text>
        </TouchableOpacity>
      </View>

      <Text style={styles.subtitulo}>Equipamentos Cadastrados</Text>

      {/* Listagem dos itens cadastrados */}
      <FlatList
        data={equipamentos}
        keyExtractor={(item) => item.id}
        renderItem={({ item }) => (
          <View style={styles.cardItem}>
            <View style={styles.infoItem}>
              <Text style={styles.textoItem}>
                <Text style={styles.negrito}>Nome:</Text> {item.nome}
              </Text>
              <Text style={styles.textoItem}>
                <Text style={styles.negrito}>Marca:</Text> {item.marca}
              </Text>
              <Text style={styles.textoItem}>
                <Text style={styles.negrito}>N/S:</Text> {item.numeroSerie}
              </Text>
              <Text style={styles.textoItem}>
                <Text style={styles.negrito}>Categoria:</Text> {item.categoria}
              </Text>
            </View>

            {/* Opção para excluir um item da lista */}
            <TouchableOpacity
              style={styles.botaoExcluir}
              onPress={() => handleExcluir(item.id)}
            >
              <Text style={styles.textoBotaoExcluir}>Excluir</Text>
            </TouchableOpacity>
          </View>
        )}
        ListEmptyComponent={
          <Text style={styles.listaVazia}>Nenhum equipamento na lista.</Text>
        }
      />
    </View>
  );
}

// 5. Organização básica do código e estilização visual
const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingTop: 60,
    paddingHorizontal: 20,
    backgroundColor: "#F0F4F8",
  },
  tituloSistema: {
    fontSize: 24,
    fontWeight: "bold",
    textAlign: "center",
    marginBottom: 20,
    color: "#102A43",
  },
  formulario: {
    marginBottom: 25,
  },
  input: {
    backgroundColor: "#FFFFFF",
    borderWidth: 1,
    borderColor: "#D9E2EC",
    borderRadius: 8,
    padding: 12,
    marginBottom: 12,
    fontSize: 16,
    color: "#334E68",
  },
  botaoSalvar: {
    backgroundColor: "#243B53",
    padding: 15,
    borderRadius: 8,
    alignItems: "center",
    marginTop: 5,
  },
  textoBotaoSalvar: {
    color: "#FFFFFF",
    fontSize: 16,
    fontWeight: "bold",
  },
  subtitulo: {
    fontSize: 18,
    fontWeight: "bold",
    marginBottom: 10,
    color: "#102A43",
  },
  cardItem: {
    backgroundColor: "#FFFFFF",
    padding: 15,
    borderRadius: 8,
    marginBottom: 10,
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
    borderWidth: 1,
    borderColor: "#D9E2EC",
  },
  infoItem: {
    flex: 1,
  },
  textoItem: {
    fontSize: 14,
    color: "#486581",
    marginBottom: 4,
  },
  negrito: {
    fontWeight: "bold",
    color: "#102A43",
  },
  botaoExcluir: {
    backgroundColor: "#D64545",
    paddingVertical: 8,
    paddingHorizontal: 12,
    borderRadius: 6,
  },
  textoBotaoExcluir: {
    color: "#FFFFFF",
    fontWeight: "bold",
    fontSize: 14,
  },
  listaVazia: {
    textAlign: "center",
    color: "#829AB1",
    marginTop: 20,
    fontSize: 16,
  },
});
