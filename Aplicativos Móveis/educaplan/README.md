# EducaPlan 🎓
> Seu Gerenciador Acadêmico Inteligente

O **EducaPlan** é uma solução completa de Controle de Estudos desenvolvida em Flutter para ajudar estudantes a organizarem sua rotina acadêmica com eficiência e clareza. Com uma interface moderna em estilo Dashboard, o aplicativo permite gerenciar matérias, tarefas e prazos em um único lugar.

## 🚀 Funcionalidades Principais

1. **Visão Geral (Dashboard):** Um painel reativo com métricas em tempo real sobre tarefas pendentes, concluídas e atrasadas.
2. **Minhas Tarefas (CRUD Completo):** Listagem de atividades com busca dinâmica por palavras-chave e filtros por nível de prioridade (Alta, Média e Baixa).
3. **Gerenciamento de Matérias:** Agrupamento automático e inteligente das disciplinas cadastradas para análise de volume de estudo.
4. **Calendário Acadêmico:** Visualização mensal com marcadores reativos nos dias com prazos de entrega e listagem filtrada por data.

## 🛠️ Tecnologias e Arquitetura

O projeto foi construído seguindo boas práticas de desenvolvimento mobile e arquitetura limpa:

- **Flutter**: Framework principal para a construção da interface adaptativa.
- **Drift (SQLite)**: Banco de dados relacional local, reativo e robusto para persistência de dados.
- **Riverpod**: Gerenciamento de estado moderno, utilizado para sincronizar os dados do banco com a UI em tempo real através de Streams.

## 📦 Como Executar o Projeto

1. Clone o repositório:
   ```bash
   git clone [https://github.com/pedrocanabarroo/educaplan.git](https://github.com/pedrocanabarroo/educaplan.git)