programa
{
    inclua biblioteca Util --> U
    inclua biblioteca Texto --> t

    const cadeia borda[3][7]={
        {"▄", "▄", "▀", "▀", "▀", "▄", "█"},
        {"┌", "┐", "└", "┘", "─", "─", "│"},
        {"╔", "╗", "╚", "╝", "═", "═", "║"}
    }

    funcao janela(cadeia texto[], inteiro forma){
        inteiro tam = U.numero_elementos(texto), x=0, largura = 0
        para(x = 0; x<tam; x++){
            se(largura < t.numero_caracteres(texto[x])){
                largura = t.numero_caracteres(texto[x])
            }
        }
        escreva(borda[forma][0])
        para(x = 0; x<largura; x++){
            escreva(borda[forma][5])
        }
        escreva(borda[forma][1], "\n")

        para(x=0; x<tam; x++){
            escreva(borda[forma][6], texto[x])
            inteiro caracteres = t.numero_caracteres(texto[x])
            enquanto(caracteres<largura){
                escreva(" ")
                caracteres++
            }
            escreva(borda[forma][6],"\n")
        }
        
        escreva(borda[forma][2])
        para(x = 0; x<largura; x++){
            escreva(borda[forma][4])
        }
        escreva(borda[forma][3], "\n")
    }

    funcao inicio()
    {
        inteiro opcao = 0
        
        faca
        {
            limpa()

            cadeia tituloMenu[] = {"Seja Bem-Vindo"}
            cadeia opcoesMenu[] = {
                "[1] Analisa Números",
                "[2] Dia/Mês",
                "[3] Siglas/Estados",
                "[4] Extenso 0-1000",
                "[5] Jogo do Sorteio",
                "[6] Sorteia Nomes",
                "[7] Fim"
                }
            cadeia rodapeMenu[] = {"Digite a sua opção: "}
            
            janela(tituloMenu, 0)
            janela(opcoesMenu, 2)
            janela(rodapeMenu, 1)
            
            leia (opcao)

            escolha (opcao)
            {
                caso 1 :
                    AnaliseNumeros()
                    pare

                caso 2 :
                    DataExtenso()
                    pare

                caso 3 :
                    EstadosSiglas()
                    pare

                caso 4 : 
                    NumeroExtenso()
                    pare

                caso 5 :
                    JogoAdivinhacao()
                    pare

                caso 6 :
                    SorteioNomes()
                    pare

                 caso 7 :
                    limpa()
                    cadeia mensagemFim[] = {
                        "Espero que tenha se divertido e",
                        "esteja satisfeito com os programas!",
                        "Até mais! :)"
                    }
                    janela(mensagemFim, 2)
                    U.aguarde(2000)
                    pare

                caso contrario :
                    cadeia msgErro[] = {"Opção inválida!"}
                    janela(msgErro, 0)
                    U.aguarde (1500)
                    pare
            }
         
        } enquanto (opcao != 7)
    }

    funcao AnaliseNumeros()
    {
        inteiro indice = 0, vetor[10], par = 0, impar = 0, maior = -1, menor = 999999999
        inteiro posicaoMaior = 0, posicaoMenor = 0
        cadeia ordem = "", desejaContinuar = ""

        faca
        {
            limpa()
            
            cadeia tituloEntrada[] = {"Análise de Números", "Informe dez números:"}
            janela(tituloEntrada, 0)
            
            para (indice = 0; indice < 10; indice++)
            {
                escreva(borda[2][6] + " " + (indice + 1) + "º : ")
                leia(vetor[indice])

                se (vetor[indice] % 2 == 0) {
                    par++
                }
                senao {
                    impar++
                }

                se (vetor[indice] > maior) {
                    maior = vetor[indice]
                    posicaoMaior = indice + 1
                }
                se (vetor[indice] < menor) {
                    menor = vetor[indice]
                    posicaoMenor = indice + 1
                }
            }

            real somatoria = 0.0
            para (indice = 0; indice < 10; indice++) {
                somatoria += vetor[indice]
            }
            real mediaAritimetica = somatoria / 10

            limpa()
            
            cadeia tituloResultado[] = {"Resultados da Análise"}
            janela(tituloResultado, 0)
            
            cadeia resultadoParesImpares[1]
            se (par == 0) {
                resultadoParesImpares[0] = "Dentre os números informados, nenhum é par e 10 são ímpares."
            }
            senao se (impar == 0) {
                resultadoParesImpares[0] = "Dentre os números informados, 10 são pares e nenhum é ímpar."
            }
            senao se (par == 1) {
                resultadoParesImpares[0] = "Dentre os números informados, apenas 1 é par e 9 são ímpares."
            }
            senao se (impar == 1) {
                resultadoParesImpares[0] = "Dentre os números informados, 9 são pares e apenas 1 é ímpar."
            }
            senao {
                resultadoParesImpares[0] = "Dentre os números informados, " + par + " são pares e " + impar + " são ímpares."
            }
            janela(resultadoParesImpares, 1)
            U.aguarde(1000)
            
            cadeia resultadoMaior[] = {"O maior número informado é: " + maior + " (Posição: " + posicaoMaior + "º)"}
            cadeia resultadoMenor[] = {"O menor número informado é: " + menor + " (Posição: " + posicaoMenor + "º)"}
            janela(resultadoMaior, 1)
            U.aguarde(1000)
            janela(resultadoMenor, 1)
            U.aguarde(1000)
            
            cadeia resultadoSoma[] = {"A somatória de todos os números é: " + somatoria}
            cadeia resultadoMedia[] = {"A média aritmética é: " + mediaAritimetica}
            janela(resultadoSoma, 1)
            U.aguarde(1000)
            janela(resultadoMedia, 1)
            U.aguarde(1000)

            cadeia tituloOrdenacao[] = {"Ordenação dos Números"}
            cadeia opcoesOrdenacao[] = {
                "Deseja ver os números ordenados em qual ordem?",
                "[C] Crescente",
                "[D] Decrescente"
            }
            janela(tituloOrdenacao, 0)
            janela(opcoesOrdenacao, 1)
            
            escreva(borda[1][6] + " Opção: ")
            leia(ordem)

            inteiro i, j, temp
            para (i = 0; i < 9; i++) {
                para (j = 0; j < 9 - i; j++) {
                    se (((ordem == "C" ou ordem == "c") e vetor[j] > vetor[j + 1]) ou 
                        ((ordem == "D" ou ordem == "d") e vetor[j] < vetor[j + 1])) {
                        temp = vetor[j]
                        vetor[j] = vetor[j + 1]
                        vetor[j + 1] = temp
                    }
                }
            }

            limpa()
            
            cadeia tituloOrdenado[1]
            se (ordem == "C" ou ordem == "c") {
                tituloOrdenado[0] = "Números ordenados em ordem crescente:"
            }
            senao {
                tituloOrdenado[0] = "Números ordenados em ordem decrescente:"
            }
            janela(tituloOrdenado, 0)
            
            cadeia numerosOrdenados[1]
            cadeia listaNumeros = ""
            para (indice = 0; indice < 10; indice++) {
                listaNumeros += vetor[indice] + " "
            }
            numerosOrdenados[0] = listaNumeros
            janela(numerosOrdenados, 1)
            U.aguarde(1000)

            cadeia opcaoContinuar[] = {"Deseja continuar?", "[Sim/Não]"}
            janela(opcaoContinuar, 2)
            
            escreva(borda[2][6] + " Resposta: ")
            leia(desejaContinuar)

            se (desejaContinuar == "sim" ou desejaContinuar == "Sim" ou desejaContinuar == "SIM" ou 
                desejaContinuar == "s" ou desejaContinuar == "ss" ou desejaContinuar == "SS" ou 
                desejaContinuar == "Ss") {
                par = 0
                impar = 0
                maior = -1
                menor = 999999999
                posicaoMaior = 0
                posicaoMenor = 0
                ordem = ""
            }

        } enquanto (desejaContinuar == "sim" ou desejaContinuar == "Sim" ou desejaContinuar == "SIM" ou 
                   desejaContinuar == "s" ou desejaContinuar == "ss" ou desejaContinuar == "SS" ou 
                   desejaContinuar == "Ss")

        limpa()
        cadeia mensagemDespedida[] = {"Entendo.", "Até a próxima! :)"}
        janela(mensagemDespedida, 2)
        U.aguarde(1000)
    }

    funcao DataExtenso()
    {
        cadeia diaSemana[8] = {"","Domingo","Segunda-Feira","Terça-Feira","Quarta-Feira","Quinta-Feira","Sexta-Feira","Sábado"}
        cadeia diaMes[13] = {"","Janeiro","Fevereiro","Março","Abril","Maio","Junho","Julho","Agosto","Setembro","Outubro","Novembro","Dezembro"}
        cadeia desejaContinuar = ""
        inteiro numeroSemana, numeroMes, dia
        
        faca
        {
            limpa()
            cadeia titulo[] = {"Conversor de Data para Extenso"}
            janela(titulo, 0)
            
            faca
            {
                cadeia mensagemDiaSemana[] = {"Informe um número para consultar o dia da semana (1-7):"}
                janela(mensagemDiaSemana, 1)
                escreva(borda[1][6] + " ")
                leia(numeroSemana) 
                
                se (numeroSemana <= 0 ou numeroSemana > 7)
                {
                    limpa()
                    cadeia erro[] = {"DIA INVÁLIDO >:("}
                    janela(erro, 0)
                    U.aguarde(1500)
                    limpa()
                }
            } enquanto (numeroSemana <= 0 ou numeroSemana > 7)
            
            faca
            {
                cadeia mensagemMes[] = {"Agora, informe um número para consultar o mês (1-12):"}
                janela(mensagemMes, 1)
                escreva(borda[1][6] + " ")
                leia(numeroMes)

                se (numeroMes <= 0 ou numeroMes > 12)
                {
                    limpa()
                    cadeia erro[] = {"MÊS INVÁLIDO >:("}
                    janela(erro, 0)
                    U.aguarde(1500)
                    limpa()
                }
            } enquanto (numeroMes <= 0 ou numeroMes > 12)
            
            faca
            {
                cadeia mensagemDia[] = {"Informe o dia do mês (1-31):"}
                janela(mensagemDia, 1)
                escreva(borda[1][6] + " ")
                leia(dia)
                
                se (dia <= 0 ou dia > 31)
                {
                    limpa()
                    cadeia erro[] = {"DIA DO MÊS INVÁLIDO >:("}
                    janela(erro, 0)
                    U.aguarde(1500)
                    limpa()
                }
            } enquanto (dia <= 0 ou dia > 31)
            
            limpa()
            
            cadeia resultado[] = {
                "Data completa:",
                diaSemana[numeroSemana] + ", " + dia + " de " + diaMes[numeroMes]
            }
            janela(resultado, 2)
            U.aguarde(3000)
            
            cadeia continuar[] = {"Deseja continuar?", "[Sim/Não]"}
            janela(continuar, 1)
            escreva(borda[1][6] + " ")
            leia(desejaContinuar)
            limpa()
            
        } enquanto (desejaContinuar == "sim" ou desejaContinuar == "Sim" ou desejaContinuar == "SIM" ou 
                   desejaContinuar == "s" ou desejaContinuar == "ss" ou desejaContinuar == "SS" ou 
                   desejaContinuar == "Ss")
        
        cadeia despedida[] = {"Entendo.", "Até a próxima! :)"}
        janela(despedida, 2)
        U.aguarde(1000)
    }

    funcao EstadosSiglas()
    {
        cadeia siglas[27] = {
            "AC", "AL", "AP", "AM", "BA", "CE", "DF", "ES", "GO", "MA",
            "MT", "MS", "MG", "PA", "PB", "PR", "PE", "PI", "RJ", "RN",
            "RS", "RO", "RR", "SC", "SP", "SE", "TO"
        }
        
        cadeia estados[27] = {
            "Acre", "Alagoas", "Amapá", "Amazonas", "Bahia", "Ceará",
            "Distrito Federal", "Espírito Santo", "Goiás", "Maranhão",
            "Mato Grosso", "Mato Grosso do Sul", "Minas Gerais", "Pará",
            "Paraíba", "Paraná", "Pernambuco", "Piauí", "Rio de Janeiro",
            "Rio Grande do Norte", "Rio Grande do Sul", "Rondônia", "Roraima",
            "Santa Catarina", "São Paulo", "Sergipe", "Tocantins"
        }
        
        cadeia entrada = "", desejaContinuar = ""
        logico encontrado
        
        faca {
            encontrado = falso
            limpa()
            
            cadeia titulo[] = {"Consulta de Estados e Siglas"}
            janela(titulo, 0)
            
            cadeia instrucao[] = {
                "Digite o nome do estado (com a letra inicial maiúscula)",
                "ou a sigla (em maiúsculo):"
            }
            janela(instrucao, 1)
            escreva(borda[1][6] + " ")
            leia(entrada)
            
            para (inteiro i = 0; i < 27; i++) {
                se (entrada == siglas[i]) {
                    cadeia resultado[] = {
                        "A sigla " + siglas[i] + " corresponde",
                        "ao estado de " + estados[i]
                    }
                    janela(resultado, 2)
                    encontrado = verdadeiro
                    pare
                }
            }

            se (nao encontrado) {
                para (inteiro i = 0; i < 27; i++) {
                    se (entrada == estados[i]) {
                        cadeia resultado[] = {
                            "O estado de " + estados[i],
                            "tem a sigla " + siglas[i]
                        }
                        janela(resultado, 2)
                        encontrado = verdadeiro
                        pare
                    }
                }
            }
            
            se (nao encontrado) {
                cadeia erro[] = {"Estado ou sigla inválida."}
                janela(erro, 0)
            }
            
            U.aguarde(2000)
            
            cadeia continuar[] = {"Deseja continuar?", "[Sim/Não]"}
            janela(continuar, 1)
            escreva(borda[1][6] + " ")
            leia(desejaContinuar)
            
        } enquanto (desejaContinuar == "sim" ou desejaContinuar == "Sim" ou desejaContinuar == "SIM" ou 
                   desejaContinuar == "s" ou desejaContinuar == "S" ou desejaContinuar == "ss" ou desejaContinuar == "SS" ou 
                   desejaContinuar == "Ss")
        
        limpa()
        cadeia despedida[] = {"Entendo.", "Até a próxima! :)"}
        janela(despedida, 2)
        U.aguarde(1500)
    }

    funcao NumeroExtenso()
    {
        cadeia unidade[] = {"Zero", "Um", "Dois", "Três", "Quatro", "Cinco", "Seis", "Sete", "Oito", "Nove", "Dez", "Onze", "Doze", "Treze", "Quatorze", "Quinze", "Dezesseis", "Dezessete", "Dezoito", "Dezenove"}
        cadeia dezena[] = {"", "", "Vinte", "Trinta", "Quarenta", "Cinquenta", "Sessenta", "Setenta", "Oitenta", "Noventa"}
        cadeia centena[] = {"", "Cento", "Duzentos", "Trezentos", "Quatrocentos", "Quinhentos", "Seiscentos", "Setecentos", "Oitocentos", "Novecentos"}
        inteiro num, numeroEsquerda, numeroMeio, numeroDireita
        cadeia extenso = "", desejaContinuar = ""

        faca
        {
            limpa()
            
            cadeia titulo[] = {"Conversor de Números para Extenso"}
            janela(titulo, 0)

            faca
            {
                cadeia instrucao[] = {"Digite um número de 0-1000:"}
                janela(instrucao, 1)
                escreva(borda[1][6] + " ")
                leia(num)

                se (num < 0 ou num > 1000)
                {
                    cadeia erro[] = {"Número inválido! Digite entre 0 e 1000."}
                    janela(erro, 0)
                    U.aguarde(1500)
                    limpa()
                }
            } enquanto (num < 0 ou num > 1000)

            se (num < 20)
            {
                extenso = unidade[num]
            }
            senao se (num < 100)
            {
                numeroEsquerda = num / 10
                numeroDireita = num % 10
                extenso = dezena[numeroEsquerda]

                se (numeroDireita > 0)
                {
                    extenso += " e " + unidade[numeroDireita]
                }
            }
            senao se (num == 100)
            {
                extenso = "Cem"
            }
            senao se (num < 1000)
            {
                numeroEsquerda = num / 100
                numeroMeio = num / 10 % 10
                numeroDireita = num % 10

                extenso = centena[numeroEsquerda]

                se (numeroMeio == 0 e numeroDireita == 0)
                {
                }
                senao se (numeroMeio > 1 e numeroDireita > 0)
                {
                    extenso += " e " + dezena[numeroMeio] + " e " + unidade[numeroDireita]
                }
                senao se (numeroMeio > 1 e numeroDireita == 0)
                {
                    extenso += " e " + dezena[numeroMeio]
                }
                senao se (numeroMeio < 2)
                {
                    numeroDireita = num % 100
                    extenso += " e " + unidade[numeroDireita]
                }
            }
            senao 
            {
                extenso = "Mil"
            }

            limpa()
            cadeia resultado[] = {"Número por extenso:", extenso}
            janela(resultado, 2)
            U.aguarde(2000)

            cadeia continuar[] = {"Deseja continuar?", "[Sim/Não]"}
            janela(continuar, 1)
            escreva(borda[1][6] + " ")
            leia(desejaContinuar)
            
        } enquanto (desejaContinuar == "sim" ou desejaContinuar == "Sim" ou desejaContinuar == "SIM" ou 
                   desejaContinuar == "s" ou desejaContinuar == "S" ou desejaContinuar == "ss" ou desejaContinuar == "SS" ou 
                   desejaContinuar == "Ss")
        
        limpa()
        cadeia despedida[] = {"Entendo.", "Até a próxima! :)"}
        janela(despedida, 2)
        U.aguarde(1500)
    }

    funcao JogoAdivinhacao()
    {
        cadeia nivel = "", desejaContinuar = ""
        inteiro tentativasMaximas = 0, numeroSorteado = 0, palpite = 0, tentativasRestantes = 0
        inteiro tentativas[100]
        inteiro contadorTentativas = 0
        logico acertou = falso

        faca {
            limpa()
            
            faca {
                cadeia menuNivel[] = {
                    "Escolha o nível:",
                    "1- Números de 1-10 (tentativas ilimitadas)",
                    "2- Números de 1-50 (15 tentativas)",
                    "3- Números de 1-100 (10 tentativas)"
                }
                janela(menuNivel, 0)
                escreva(borda[0][6] + " ")
                leia(nivel)
                
                se (nivel == "1") {
                    tentativasMaximas = -1
                    numeroSorteado = U.sorteia(1, 10)
                    pare
                } senao se (nivel == "2") {
                    tentativasMaximas = 15
                    numeroSorteado = U.sorteia(1, 50)
                    pare
                } senao se (nivel == "3") {
                    tentativasMaximas = 10
                    numeroSorteado = U.sorteia(1, 100)
                    pare
                }
                cadeia erro[] = {"Opção inválida. Digite 1, 2 ou 3."}
                janela(erro, 0)
                U.aguarde(2000)
                limpa()
            } enquanto (verdadeiro)

            tentativasRestantes = tentativasMaximas
            contadorTentativas = 0
            acertou = falso
            limpa()

            enquanto ((tentativasRestantes > 0 ou tentativasMaximas == -1) e nao acertou) {
                cadeia cabecalho[1]
                se (tentativasMaximas == -1) {
                    cabecalho[0] = "Tentativa " + (contadorTentativas+1)
                } senao {
                    cabecalho[0] = "Tentativa " + (contadorTentativas+1) + " de " + tentativasMaximas
                }
                janela(cabecalho, 1)
                
                cadeia instrucao[] = {"Digite seu palpite:"}
                janela(instrucao, 1)
                escreva(borda[1][6] + " ")
                leia(palpite)
                
                tentativas[contadorTentativas] = palpite
                contadorTentativas++

                se (palpite == numeroSorteado) {
                    acertou = verdadeiro
                    limpa()
                    cadeia acerto[] = {
                        "Parabéns! Você acertou!",
                        "Número de tentativas: " + contadorTentativas,
                        "O número era: " + numeroSorteado
                    }
                    janela(acerto, 2)
                    U.aguarde(2000)
                } senao {
                    limpa()
                    cadeia dica[1]
                    se (palpite < numeroSorteado) {
                        dica[0] = "Dica: É maior que " + palpite
                    } senao {
                        dica[0] = "Dica: É menor que " + palpite
                    }
                    janela(dica, 1)
                    
                    se (tentativasMaximas != -1) {
                        tentativasRestantes--
                        cadeia tentativasMsg[] = {"Tentativas restantes: " + tentativasRestantes}
                        janela(tentativasMsg, 1)
                    }
                    U.aguarde(2000)
                    limpa()
                }
            }

            se (nao acertou) {
                cadeia fimJogo[] = {
                    "Fim das tentativas!",
                    "O número era: " + numeroSorteado
                }
                janela(fimJogo, 0)
                U.aguarde(2000)
            }

            limpa()
            cadeia historico[1]
            cadeia listaTentativas = "Histórico: "
            para (inteiro i = 0; i < contadorTentativas; i++) {
                listaTentativas += tentativas[i] + " "
            }
            historico[0] = listaTentativas
            janela(historico, 1)
            U.aguarde(2000)

            cadeia continuar[] = {"Deseja continuar?", "[Sim/Não]"}
            janela(continuar, 1)
            escreva(borda[1][6] + " ")
            leia(desejaContinuar)

        } enquanto (desejaContinuar == "sim" ou desejaContinuar == "Sim" ou desejaContinuar == "SIM" ou 
                   desejaContinuar == "s" ou desejaContinuar == "ss" ou desejaContinuar == "SS" ou 
                   desejaContinuar == "Ss")
        
        limpa()
        cadeia despedida[] = {"Entendo.", "Até a próxima! :)"}
        janela(despedida, 2)
        U.aguarde(2000)
    }

    funcao SorteioNomes()
    {
        cadeia nomes[10], duplas[5][2]
        inteiro indicesSorteados[10]
        cadeia opcao, desejaContinuar
        inteiro totalSorteados = 0

        limpa()
        cadeia titulo[] = {"Sorteio de Nomes"}
        janela(titulo, 0)

        cadeia instrucao[] = {"Digite 10 nomes:"}
        janela(instrucao, 1)
        para (inteiro i = 0; i < 10; i++) {
            cadeia prompt[] = {"Nome " + (i+1) + ":"}
            janela(prompt, 1)
            escreva(borda[1][6] + " ")
            leia(nomes[i])
            indicesSorteados[i] = 0
        }

        faca {
            limpa()
            
            faca {
                cadeia menuOpcao[] = {
                    "Escolha o tipo de sorteio:",
                    "1 - Sorteio Individual",
                    "2 - Sorteio em Duplas"
                }
                janela(menuOpcao, 0)
                escreva(borda[0][6] + " ")
                leia(opcao)
                
                se (opcao != "1" e opcao != "2") {
                    cadeia erro[] = {"Opção inválida. Digite 1 ou 2."}
                    janela(erro, 0)
                    U.aguarde(1500)
                    limpa()
                }
            } enquanto (opcao != "1" e opcao != "2")

            para (inteiro i = 0; i < 10; i++) {
                indicesSorteados[i] = 0
            }
            totalSorteados = 0

            limpa()
            
            se (opcao == "1") {
                cadeia cabecalho[] = {"Nomes sorteados:"}
                janela(cabecalho, 0)
                
                enquanto (totalSorteados < 10) {
                    inteiro sorteado = U.sorteia(0, 9)
                    se (indicesSorteados[sorteado] == 0) {
                        cadeia resultado[] = {(totalSorteados+1) + "º: " + nomes[sorteado]}
                        janela(resultado, 1)
                        indicesSorteados[sorteado] = 1
                        totalSorteados++
                        U.aguarde(500)
                    }
                }
            }
            senao {
                cadeia cabecalho[] = {"Duplas formadas:"}
                janela(cabecalho, 0)
                
                para (inteiro d = 0; d < 5; d++) {
                    inteiro m1 = -1
                    faca {
                        m1 = U.sorteia(0, 9)
                    } enquanto (indicesSorteados[m1] == 1)
                    indicesSorteados[m1] = 1
                    totalSorteados++

                    inteiro m2 = -1
                    faca {
                        m2 = U.sorteia(0, 9)
                    } enquanto (indicesSorteados[m2] == 1)
                    indicesSorteados[m2] = 1
                    totalSorteados++

                    duplas[d][0] = nomes[m1]
                    duplas[d][1] = nomes[m2]
                    cadeia duplaInfo[] = {"Dupla " + (d+1) + ": " + duplas[d][0] + " e " + duplas[d][1]}
                    janela(duplaInfo, 1)
                    U.aguarde(500)
                }
            }

            cadeia continuar[] = {"Deseja continuar?", "[Sim/Não]"}
            janela(continuar, 1)
            escreva(borda[1][6] + " ")
            leia(desejaContinuar)
            
        } enquanto (desejaContinuar == "sim" ou desejaContinuar == "Sim" ou desejaContinuar == "SIM" ou 
                   desejaContinuar == "s" ou desejaContinuar == "S" ou desejaContinuar == "ss" ou desejaContinuar == "SS" ou 
                   desejaContinuar == "Ss")

        limpa()
        cadeia despedida[] = {"Entendo.", "Até a próxima! :)"}
        janela(despedida, 2)
        U.aguarde(1500)
    }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 26802; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */