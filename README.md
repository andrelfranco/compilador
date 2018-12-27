# compilador
Compilador usando o FLEX e o BISON

## Getting Started

### Pre-requisitos

1 - Instalação do FLEX

```
sudo apt-get install flex
```
2 - Instalação do BISON 
```
sudo apt-get install bison
```
### Compilando os Arquivos

Para executar o compilador é necessário compilar os arquivos usando os comandos:

```
bison -obison.c -d compilador.y
flex -oflex.c compilador.l
gcc -c bison.c
gcc -c flex.c
gcc -o compilador.exe flex.o bison.o -lfl -lm
```
### Sintaxe do Interpretador

Operações disponíveis:
  - Somar;
  - Subtrair;
  - Multiplicar;
  - Dividir.

#### Exemplos de uso
- Chamadas Simples
```
somar{1,2}?
subtrair{1,2}?
mutiplicar{1,2}?
dividir{1,2}?
```
- Chamadas Recursivas
  (Dentro dos parâmetros da função é possível chamar outras funções)
```
somar{subtrair{23,20},2}?
subtrair{dividir{20,2},2}?
mutiplicar{subtrair{dividir{20,2},2},2}?
```
