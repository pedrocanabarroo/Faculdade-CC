//Uma loja vende bicicletas com um acréscimo de 50% sobre o preço de custo. Ela paga a cada vendedor
//2 salários mínimos mensais, mais uma comissão de 15% sobre o preço de custo de cada bicicleta
//vendida, dividida igualmente entre eles. Desenvolva um algoritmo que leia o número de empregados da
//loja, o valor do salário mínimo, o preço de custo de cada bicicleta e o número de bicicletas vendidas,
//calcule e mostre: o salário que cada empregado receberá e o lucro líquido da loja.
#include <stdio.h>

int main() {
    int numEmpregados, numBicicletasVendidas;
    float salarioMinimo, precoCusto, comissaoPorVendedor, lucroBruto, lucroLiquido, salarioEmpregado;

    // Leitura dos dados
    printf("Digite o numero de empregados da loja: ");
    scanf("%d", &numEmpregados);

    printf("Digite o valor do salario minimo: ");
    scanf("%f", &salarioMinimo);

    printf("Digite o preco de custo de cada bicicleta: ");
    scanf("%f", &precoCusto);

    printf("Digite o numero de bicicletas vendidas: ");
    scanf("%d", &numBicicletasVendidas);

    // Cálculo do preço de venda de cada bicicleta (com 50% de acréscimo)
    float precoVenda = precoCusto * 1.50;

    // Cálculo da comissão por vendedor (15% sobre o preço de custo de cada bicicleta)
    comissaoPorVendedor = precoCusto * 0.15;

    // Cálculo do lucro bruto da loja
    lucroBruto = (precoVenda - precoCusto) * numBicicletasVendidas;

    // Cálculo da comissão total dividida igualmente entre os vendedores
    float comissaoTotal = comissaoPorVendedor * numBicicletasVendidas;

    // Cálculo do salário de cada empregado
    salarioEmpregado = salarioMinimo * 2 + comissaoTotal / numEmpregados;

    // Cálculo do lucro líquido da loja (descontando os custos com salários e comissões)
    lucroLiquido = lucroBruto - (numEmpregados * salarioMinimo * 2) - comissaoTotal;

    // Exibição dos resultados
    printf("\nSalario de cada empregado: R$ %.2f\n", salarioEmpregado);
    printf("Lucro liquido da loja: R$ %.2f\n", lucroLiquido);

    return 0;
}








