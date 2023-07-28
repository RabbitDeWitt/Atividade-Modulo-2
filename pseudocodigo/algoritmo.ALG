Algoritmo "semnome"

// Autor: David Santos de Oliveira Coelho

Const
   QTD_CLIENTES = 5
   QTD_INFO_CLIENTES = 7
   QTD_DESTINOS = 5
   QTD_INFO_DESTINOS = 4

Var
   //Clientes
   clienteID: inteiro
   clientes: vetor[1..QTD_CLIENTES,0..QTD_INFO_CLIENTES] de caracter

   //Destinos
   destinoID: inteiro
   destinos: vetor[1..QTD_DESTINOS,0..QTD_INFO_DESTINOS] de caracter

   //Número da tela para alteração do titulo
   numTela: inteiro

   //Variáveis de loop
   lin, col: inteiro

   //Variáveis para consulta
   nome, sobrenome: caracter

   //Variáveis gerais
   opcao, clientesCadatrados, destinosCadastrados: inteiro
   cadastroConfirmado: logico


   // MENU PRINCIPAL

procedimento exibirMenu()
inicio
   zerarVariaveis()

   cabecalho(opcao)

   escreval("1 - Cadastro de Clientes")
   escreval("2 - Cadastro de Detinos")
   escreval("3 - Lista de Clientes")
   escreval("4 - Consulta de Clientes(Nome)")
   escreval("5 - Consulta de Detinos")
   escreval("6 - Sair")
   escreval("")

   escreval("Digite a opção desejada:")
   leia(opcao)

   numTela <- opcao

   escolha(opcao)
   caso 1
      cadastrarClientes()
   caso 2
      cadastrarDetinos()
   caso 3
      consultarClientes()
   caso 4
      consultarClientesPorNome()
   caso 5
      consultarDestinos()
   caso 6
      interrompa
   outrocaso
      exibirMenu()
   fimescolha
fimprocedimento





// CLIENTES





procedimento cadastrarClientes()
inicio

   se (clienteID <= QTD_CLIENTES) entao
      repita
         cadastroConfirmado <- criarFormularioCliente()
      ate(cadastroConfirmado = verdadeiro)
      clienteID <- clienteID + 1
      exibirMenu()
   senao
      cabecalho(numTela)
      escreval("Todos os clientes já foram cadastrados.")
      navegacao()
   fimse
fimprocedimento

funcao criarFormularioCliente(): logico
inicio
   cabecalho(numTela)

   para col de 1 ate QTD_INFO_CLIENTES faca
      escolha(col)
      caso 1
         escreva("Nome: ")
      caso 2
         escreva("Sobrenome: ")
      caso 3
         escreva("Endereço: ")
      caso 4
         escreva("Data de nascimento: ")
      caso 5
         escreva("Telefone: ")
      caso 6
         escreva("Sexo(M ou F): ")
      caso 7
         escreva("Passaporte Nº: ")
      fimescolha
      leia(clientes[clienteID, col])
   fimpara

   clientes[clienteID, 6] <- maiusc(clientes[clienteID, 6])
   clientes[clienteID, 7] <- maiusc(clientes[clienteID, 7])

   cabecalho(numTela)

   clientes[clienteID, 0] <- numpcarac(clienteID)

   imprimirDadosClientes(clienteID)

   retorne confirmarCadastro()
fimfuncao

procedimento consultarClientes()
inicio
   cabecalho(numTela)

   para lin de 1 ate QTD_CLIENTES faca
      se (caracpnum(clientes[lin, 0]) <> 0) entao
         clientesCadatrados <- clientesCadatrados + 1
      fimse
   fimpara

   para lin de 1 ate clientesCadatrados faca
      imprimirDadosClientes(lin)
   fimpara

   se (clientesCadatrados = 1) entao
      escreval("Cliente cadastrado: ", clientesCadatrados)
   senao
      escreval("Clientes cadastrados: ", clientesCadatrados)
   fimse
   navegacao()
fimprocedimento

procedimento consultarClientesPorNome()
inicio
   cabecalho(numTela)

   escreva("Digite o nome: ")
   leia(nome)
   escreva("Digite o sobrenome: ")
   leia(sobrenome)
   escreval("")

   para lin de 1 ate QTD_CLIENTES faca
      se ((maiusc(clientes[lin, 1]) = maiusc(nome)) e (maiusc(clientes[lin, 2]) = maiusc(sobrenome))) entao
         imprimirDadosClientes(lin)
         clientesCadatrados <- clientesCadatrados + 1
      fimse
   fimpara

   se (clientesCadatrados > 0) entao
      se (clientesCadatrados = 1) entao
         escreval("Registro encontrado: ", clientesCadatrados)
      senao
         escreval("Registros encontrados: ", clientesCadatrados)
      fimse
   senao
      escreval("Nenhum registro foi encontrado.")
   fimse
   navegacao()
fimprocedimento

procedimento imprimirDadosClientes(ID: inteiro)
inicio
   escreval("----------------------------------")
   escreval("ID: ", clientes[ID, 0])
   para col de 1 ate QTD_INFO_CLIENTES faca
      escolha(col)
      caso 1
         escreva("Nome: ")
      caso 2
         escreva("Sobrenome: ")
      caso 3
         escreva("Endereço: ")
      caso 4
         escreva("Data de Nascimento: ")
      caso 5
         escreva("Telefone: ")
      caso 6
         escreva("Sexo: ")
      caso 7
         escreva("Passaporte Nº: ")
      fimescolha
      escreval(clientes[ID, col])
   fimpara
   escreval("----------------------------------")
   escreval("")
fimprocedimento





// DESTINOS





procedimento cadastrarDetinos()
inicio
   cabecalho(numTela)
   se (destinoID <= QTD_DESTINOS) entao
      repita
         cadastroConfirmado <- criarFormularioDestino()
      ate(cadastroConfirmado = verdadeiro)
      destinoID <- destinoID + 1
      exibirMenu()
   senao
      cabecalho(numTela)
      escreval("Todos os destinos já foram cadastrados.")
      navegacao()
   fimse
fimprocedimento

funcao criarFormularioDestino(): logico
inicio
   cabecalho(numTela)

   para col de 1 ate QTD_INFO_DESTINOS faca
      escolha(col)
      caso 1
         escreva("Aeroporto: ")
      caso 2
         escreva("Cidade: ")
      caso 3
         escreva("Estado: ")
      caso 4
         escreva("País: ")
      fimescolha
   fimescolha
   leia(destinos[destinoID, col])
fimpara

cabecalho(numTela)

destinos[destinoID, 0] <- numpcarac(destinoID)

imprimirDadosDestinos(destinoID)

retorne confirmarCadastro()
fimfuncao


procedimento consultarDestinos()
inicio
   cabecalho(numTela)
   para lin de 1 ate QTD_DESTINOS faca
      se (caracpnum(destinos[lin, 0]) <> 0) entao
         destinosCadastrados <- destinosCadastrados + 1
      fimse
   fimpara

   para lin de 1 ate destinosCadastrados faca
      imprimirDadosDestinos(lin)
   fimpara


   se (destinosCadastrados = 1) entao
      escreval("Destino cadastrado: ", destinosCadastrados)
   senao
      escreval("Destinos cadastrados: ", destinosCadastrados)
   fimse

   navegacao()
fimprocedimento

procedimento imprimirDadosDestinos(ID: inteiro)
inicio
   escreval("----------------------------------")
   escreval("ID: ", destinos[ID, 0])
   para col de 1 ate QTD_INFO_DESTINOS faca
      escolha(col)
      caso 1
         escreva("Aeroporto: ")
      caso 2
         escreva("Cidade: ")
      caso 3
         escreva("Estado: ")
      caso 4
         escreva("País: ")
      fimescolha
      escreval(destinos[ID, col])
   fimpara
   escreval("----------------------------------")
   escreval("")
fimprocedimento





//PROCEDIMENTOS GERAIS





procedimento cabecalho(numTela: inteiro)
inicio
   limpatela()
   escreval("==================================")
   escolha(numTela)
   caso 1
      escreval("       CADASTRO DE CLIENTES       ")
   caso 2
      escreval("       CADASTRO DE DESTINOS       ")
   caso 3
      escreval("         LISTA DE CLIENTES        ")
   caso 4
      escreval("       CONSULTA DE CLIENTES       ")
   caso 5
      escreval("       CONSULTA DE DESTINOS       ")
   outrocaso
      escreval("               MENU               ")
   fimescolha
   escreval("==================================")
   escreval("")
fimprocedimento


funcao confirmarCadastro(): logico
var
   opcao: inteiro
inicio
   escreval("----------------------------------")
   escreval("Deseja confirmar?")
   escreval("1 - Sim       2 - Não")
   escreval("----------------------------------")
   leia(opcao)
   escolha(opcao)
   caso 1
      retorne verdadeiro
   caso 2
      retorne falso
   fimescolha
fimfuncao

procedimento navegacao()
inicio
   opcao <- 0
   escreval("")
   escreval("----------------------------------")
   escreval("Deseja?")
   escreval("1 - Voltar     2 - Finalizar")
   escreval("----------------------------------")
   leia(opcao)
   escreval("")

   escolha(opcao)
   caso 1
      exibirMenu()
   caso 2
      interrompa
   fimescolha
fimprocedimento

procedimento zerarVariaveis()
inicio
   clientesCadatrados <- 0
   destinosCadastrados <- 0
   opcao <- 0
   numTela <- 0
   lin <- 0
   col <- 0
   nome <- ""
   sobrenome <- ""
fimprocedimento

Inicio

   clienteID <- 1
   destinoID <- 1
   exibirMenu()

Fimalgoritmo