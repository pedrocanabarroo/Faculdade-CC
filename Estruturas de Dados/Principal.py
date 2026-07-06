from clima import Clima

lista = []

linha = "2020, Janeiro, Quente, Pouca"
dadosLinha = linha.split(", ")

obj_clima = Clima(dadosLinha[0], dadosLinha[1], dadosLinha[2], dadosLinha[3])

if obj_clima not in lista:
    lista.append(obj_clima)

linha = "2020, Janeiro, Frio, Pouca"
dadosLinha = linha.split(", ")

obj_clima = Clima(dadosLinha[0], dadosLinha[1], dadosLinha[2], dadosLinha[3])

if obj_clima not in lista:
    lista.append(obj_clima)

for c in lista:
    print(c)