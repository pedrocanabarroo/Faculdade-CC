# Estruturas de Dados em Java

Este documento explica as principais estruturas da biblioteca de coleções do Java: List, ArrayList, LinkedList, HashSet, TreeSet, HashMap e TreeMap.

---

## 📌 1. List

`List` é uma **interface** que representa uma coleção ordenada (sequência).

### Características:
- Permite elementos duplicados
- Mantém a ordem de inserção
- Permite acesso por índice

### Implementações comuns:
- ArrayList
- LinkedList

---

## 📌 2. ArrayList

`ArrayList` é uma implementação da interface `List` baseada em **array dinâmico**.

### Características:
- Acesso rápido por índice (O(1))
- Inserções/remoções no meio são mais lentas (O(n))
- Tamanho ajustável automaticamente

### Exemplo:
```java
List<String> lista = new ArrayList<>();
lista.add("A");
lista.add("B");
````

---

## 📌 3. LinkedList

`LinkedList` é uma implementação da interface `List` baseada em **lista encadeada**.

### Características:

* Inserções e remoções rápidas (O(1)) nas extremidades
* Acesso por índice mais lento (O(n))
* Pode ser usada como fila ou pilha

### Exemplo:

```java
List<String> lista = new LinkedList<>();
lista.add("A");
lista.add("B");
```

---

## 📌 4. HashSet

`HashSet` é uma implementação da interface `Set`, baseada em **tabela hash**.

### Características:

* Não permite elementos duplicados
* Não mantém ordem
* Operações rápidas (O(1) em média)

### Exemplo:

```java
Set<String> conjunto = new HashSet<>();
conjunto.add("A");
conjunto.add("B");
```

---

## 📌 5. TreeSet

`TreeSet` é uma implementação da interface `Set` baseada em **árvore (Red-Black Tree)**.

### Características:

* Não permite duplicados
* Mantém os elementos ordenados
* Operações O(log n)

### Exemplo:

```java
Set<String> conjunto = new TreeSet<>();
conjunto.add("B");
conjunto.add("A"); // ficará ordenado
```

---

## 📌 6. HashMap

`HashMap` é uma implementação da interface `Map`, baseada em **tabela hash**.

### Características:

* Armazena pares chave-valor
* Chaves únicas
* Não mantém ordem
* Alta performance (O(1) em média)

### Exemplo:

```java
Map<String, Integer> mapa = new HashMap<>();
mapa.put("A", 1);
mapa.put("B", 2);
```

---

## 📌 7. TreeMap

`TreeMap` é uma implementação da interface `Map` baseada em **árvore (Red-Black Tree)**.

### Características:

* Mantém as chaves ordenadas
* Não permite chaves duplicadas
* Operações O(log n)

### Exemplo:

```java
Map<String, Integer> mapa = new TreeMap<>();
mapa.put("B", 2);
mapa.put("A", 1); // ficará ordenado
```

---

## 🧠 Resumo Geral

| Estrutura  | Tipo      | Ordenação | Duplicados | Performance              |
| ---------- | --------- | --------- | ---------- | ------------------------ |
| List       | Interface | Sim       | Sim        | Depende da implementação |
| ArrayList  | Lista     | Sim       | Sim        | Acesso rápido            |
| LinkedList | Lista     | Sim       | Sim        | Inserção rápida          |
| HashSet    | Conjunto  | Não       | Não        | Muito rápido             |
| TreeSet    | Conjunto  | Sim       | Não        | Log(n)                   |
| HashMap    | Mapa      | Não       | Chave não  | Muito rápido             |
| TreeMap    | Mapa      | Sim       | Chave não  | Log(n)                   |

---

## ✅ Quando usar?

* Use **ArrayList** → quando precisar de acesso rápido por índice
* Use **LinkedList** → quando houver muitas inserções/remoções
* Use **HashSet** → quando precisar evitar duplicados rapidamente
* Use **TreeSet** → quando precisar de ordenação automática
* Use **HashMap** → para acesso rápido por chave
* Use **TreeMap** → quando precisar de mapa ordenado

---

```
