-- =============================================================================
-- Migration 030 — OBMEP Nível 2 · 2ª Fase · 2021–2025
-- Questões abertas (texto) + soluções (texto)
-- Imagens não cadastradas (referenciadas no enunciado onde aplicável)
-- =============================================================================
-- DOWN: DELETE FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano BETWEEN 2021 AND 2025;
-- =============================================================================

-- ─── QUESTÕES ─────────────────────────────────────────────────────────────────

INSERT INTO questao (olimpiada, nivel, fase, ano, numero, enunciado, tipo, publico_alvo, topico, tem_resolucao_texto, status_cadastro)
VALUES

-- 2021 -------------------------------------------------------------------------
('obmep','nivel_2',2,2021,1,
$e$Gabriel gosta de preencher quadriculados 3 × 3 com números de forma que quaisquer três deles, alinhados na horizontal, vertical ou diagonal, tenham a seguinte propriedade: o número central deve ser a média aritmética dos seus dois vizinhos.

a) Complete o preenchimento do quadriculado abaixo, iniciado por Gabriel.

[Figura: quadriculado 3 × 3 parcialmente preenchido por Gabriel, com alguns números já indicados (entre eles 2, 14, 10, 18) e as demais casas em branco para o aluno completar]

b) Preencha o quadriculado abaixo seguindo a mesma instrução indicada anteriormente.

[Figura: outro quadriculado 3 × 3, com um conjunto diferente de números já preenchidos (entre eles 7, 9, 20, 17) e as demais casas em branco para o aluno completar]

c) Qual será a soma dos nove números do quadriculado abaixo após Gabriel terminar de preenchê-lo?

[Figura: terceiro quadriculado 3 × 3, com algumas casas já preenchidas (entre elas 14, 22, 30) e as demais casas em branco]$e$,
'aberta','EFAF','Lógica','sim','publicado'),
('obmep','nivel_2',2,2021,2,
$e$Joãozinho fez todas as divisões possíveis com dois números diferentes pertencentes ao conjunto {1, 2, 3, 4, 5, 6, 7, 8, 9}. Por exemplo, com os números 2 e 5, ele fez as seguintes divisões: 2/5 (obteve como resultado 0,4) e 5/2 (obteve como resultado 2,5).

a) Em quantas divisões Joãozinho obteve como resultado um número inteiro?

b) Em quantas divisões Joãozinho obteve como resultado um número maior do que 0,5?

c) Quantos resultados diferentes foram obtidos por Joãozinho?$e$,
'aberta','EFAF','Aritmética','sim','publicado'),
('obmep','nivel_2',2,2021,3,
$e$Julieta calcula as somas do tipo

9 + 99 + 999 + ⋯ + 999⋯9 (n "noves")

da seguinte maneira: ela pensa no número 111⋯1 (n "uns"), multiplica-o por 10 e subtrai n. Por exemplo,

9 + 99 + 999 + 9999 + 99999 = 111110 – 5 = 111105 (5 "uns").

a) Calcule a soma 9 + 99 + 999 + ⋯ + 999⋯9 (7 "noves") da mesma maneira que Julieta.

b) Quantos algarismos 0 há no resultado da soma 9 + 99 + 999 + ⋯ + 999⋯9 (2021 "noves")?

c) Explique por que a maneira como Julieta calcula essas somas é correta.$e$,
'aberta','EFAF','Aritmética','sim','publicado'),
('obmep','nivel_2',2,2021,4,
$e$Maria pinta, em seu caderno, figuras formadas por trapézios e hexágonos. Cada hexágono pode ser pintado de azul, bege ou cinza, e cada trapézio, de azul ou preto. Polígonos com um lado em comum não podem ter a mesma cor. A figura ao lado é um exemplo de uma pintura feita por Maria.

[Figura: exemplo de pintura de Maria — um hexágono e um trapézio adjacentes, coloridos de forma a ilustrar a regra de cores diferentes em lados em comum]

a) De quantas maneiras Maria pode pintar a figura abaixo?

[Figura 1: um hexágono com um trapézio adjacente (compartilhando um lado), a serem coloridos seguindo as regras do enunciado]

b) De quantas maneiras Maria pode pintar a figura abaixo?

[Figura 2: um hexágono central com três trapézios adjacentes (cada um compartilhando um lado com o hexágono), a serem coloridos seguindo as regras do enunciado]

c) De quantas maneiras Maria pode pintar a figura abaixo?

[Figura 3: figura composta por dois hexágonos e três trapézios numerados (regiões 1 a 5), dispostos de modo que vários polígonos compartilham lados entre si, a serem coloridos seguindo as regras do enunciado]$e$,
'aberta','EFAF','Combinatória','sim','publicado'),
('obmep','nivel_2',2,2021,5,
$e$A figura ao lado mostra um hexágono regular ABCDEF e os pontos médios P, Q, R, S e T dos lados AB, CD, DE, EF e FA, respectivamente.

[Figura: hexágono regular ABCDEF com os pontos médios P (de AB), Q (de CD), R (de DE), S (de EF) e T (de FA) marcados, e os triângulos AST, FTS, APR e PBQ destacados]

a) Se a área do triângulo AST for igual a 1 cm², qual será a área do triângulo FTS?

b) Qual é a razão entre as áreas dos triângulos APR e PBQ?

c) Qual é a razão entre as áreas sombreada e não sombreada na figura abaixo?

[Figura: hexágono regular ABCDEF com os triângulos APR, PBQ, AST e FTS sombreados (área sombreada) e o restante do hexágono em branco (área não sombreada)]$e$,
'aberta','EFAF','Geometria','sim','publicado'),
('obmep','nivel_2',2,2021,6,
$e$Cinco pedras, A, B, C, D e E, estão dispostas como na figura. Kiko, o sapo simpático, pula de uma pedra para outra somente se elas estiverem ligadas por um segmento. Assim, ele pode pular, partindo de A, para B ou D, mas não para E ou C. Por exemplo, começando em A e terminando em D, ele pode realizar o seguinte passeio de 5 pulos: A → B → E → D → C → D.

[Figura: diagrama com cinco pedras A, B, C, D e E e segmentos ligando os pares de pedras entre os quais Kiko pode pular, formando o grafo de movimentos do sapo]

a) Quantos são os passeios de três pulos que Kiko pode fazer começando em A e terminando em B?

b) Kiko quer fazer um passeio de 1001 pulos, começando em A. Em quais pedras ele poderá terminar esse passeio? Justifique sua resposta.

c) Quantos são os passeios de 2020 pulos que Kiko pode fazer começando em A e terminando em C?$e$,
'aberta','EFAF','Combinatória','sim','publicado'),

-- 2022 -------------------------------------------------------------------------
('obmep','nivel_2',2,2022,1,
$e$Na barraca de pescaria da festa junina da escola, os peixes valem 1 ponto, 2 pontos ou 3 pontos, e há 10 peixes de cada valor. Após ser pescado, o peixe é devolvido ao tanque. Sem conhecer os valores dos peixes, cada participante pesca três deles e, dependendo dos pontos, ganha um prêmio, conforme o quadro abaixo.

[Tabela: Total de pontos x Prêmio — 3: chapéu; 4: cuscuz; 5: bolo; 6: pamonha; 7: pipoca; 8: doce; 9: lenço]

a) Maria ganhou um doce. Quais são os valores dos peixes que ela pescou?

b) Preencha a tabela abaixo com as seis possibilidades diferentes de se ganhar uma pipoca.

[Tabela: colunas 1º Peixe, 2º Peixe, 3º Peixe, a preencher com as seis possibilidades de se obter 7 pontos]

c) Qual é o prêmio que sai com a maior frequência (maior quantidade de possibilidades)? Justifique sua resposta.$e$,
'aberta','EFAF','Combinatória','sim','publicado'),
('obmep','nivel_2',2,2022,2,
$e$A figura mostra o tabuleiro de um jogo em que o participante começa na casa 0. Em cada jogada ele lança um dado, com faces numeradas de 1 a 6, e anda o número de casas indicadas pelo dado. Quando, em uma jogada, ele termina em uma das casas especiais em amarelo, ele vai imediatamente para a casa apontada pela seta. Por exemplo, se na primeira jogada o participante obtém um 5, ele vai parar na casa 13.

[Figura: tabuleiro do jogo numerado de 0 a 31, com casas especiais em amarelo (entre elas as casas 5, 11 e 19) que possuem setas indicando para qual casa o jogador deve ir; a casa 5 tem seta indicando avanço para a casa 13, e a casa 11 tem seta indicando retorno para a casa 3]

a) Se em suas três primeiras jogadas o participante obtiver 6, 5 e 2, em que casa ele vai parar?

b) Descreva uma maneira de chegar à casa 25 em apenas quatro jogadas.

[Tabela: 1ª Jogada, 2ª Jogada, 3ª Jogada, 4ª Jogada, a preencher com os valores obtidos no dado em cada jogada]

c) Explique por que é impossível chegar à casa 25 em apenas três jogadas.$e$,
'aberta','EFAF','Lógica','sim','publicado'),
('obmep','nivel_2',2,2022,3,
$e$Janaína cortou uma cartolina retangular de 16 cm de comprimento e 6 cm de largura em quatro triângulos retângulos iguais, conforme mostra a figura.

[Figura: cartolina retangular de 16 cm por 6 cm, dividida em quatro triângulos retângulos iguais]

a) Qual é a área de cada um desses triângulos?

Em seguida, Janaína usou os quatro triângulos para montar um quadrado com um buraco no seu interior, conforme mostrado na figura.

[Figura: quadrado montado com os quatro triângulos, com um buraco quadrado no interior, indicado por "?"]

b) Qual é a área do buraco?

c) Quanto mede o lado do quadrado que Janaina montou?$e$,
'aberta','EFAF','Geometria','sim','publicado'),
('obmep','nivel_2',2,2022,4,
$e$A calculadora de Joana possui duas teclas especiais:
● A tecla [A] acrescenta o algarismo 3 à direita do número que está no visor.
● A tecla [S] troca o número no visor pela soma de seus algarismos.

a) Partindo do número 99, se Joana apertar as teclas [A] [S] [A] [S], nessa ordem, qual número aparecerá?

b) Mostre como Joana pode obter o número 2022 a partir do 99 usando apenas as teclas [A] e [S].

c) Explique por que Joana nunca vai obter o número 22 a partir do 99 usando apenas as teclas [A] e [S].$e$,
'aberta','EFAF','Números','sim','publicado'),
('obmep','nivel_2',2,2022,5,
$e$Marco preenche quadriculados 3 × 3 com os números 1, 2, 3, 4, 5, 6, 7, 8 e 9, sem repetir nenhum deles.

a) Marco preencheu um quadriculado de forma que os quatro números escritos no quadrado 2 × 2 destacado têm a menor soma possível. Qual é a soma dos cinco números escritos fora desse quadrado?

[Figura: quadriculado 3 x 3 com um quadrado 2 x 2 destacado, indicado como "Menor soma possível"]

b) Marco conseguiu preencher outro quadriculado de modo que a soma dos números escritos em um dos quadrados 2 × 2 destacados é 21 e, no outro, 26. As duas figuras abaixo são representações desse mesmo quadriculado. Qual é o menor número que Marco pode ter escrito na casa central do quadriculado?

[Figura: duas representações do mesmo quadriculado 3 x 3, cada uma com um quadrado 2 x 2 destacado — um com soma 21 e outro com soma 26]

c) Marco conseguiu preencher um terceiro quadriculado de modo que as somas dos números escritos nos quatro quadrados 2 × 2 destacados são 18, 25, 21 e 24. Além disso, a soma dos números escritos nos quatro cantos do quadriculado 3 × 3 é 16. As quatro figuras abaixo são representações desse mesmo quadriculado. Qual foi o número que Marco escreveu na casa central?

[Figura: quatro representações do mesmo quadriculado 3 x 3, cada uma com um quadrado 2 x 2 destacado — com somas 18, 25, 21 e 24, respectivamente]$e$,
'aberta','EFAF','Lógica','sim','publicado'),
('obmep','nivel_2',2,2022,6,
$e$Duas companhias aéreas, CONTI e TRACE, conectam 10 capitais da América do Sul. O diagrama apresenta alguns voos realizados pelas companhias, sendo CONTI representada por uma linha contínua vermelha e TRACE por uma linha tracejada azul.

[Figura: diagrama com as 10 capitais — Caracas, Bogotá, Quito, Lima, La Paz, Santiago, Buenos Aires, Assunção, Montevideo e Brasília — conectadas por linhas representando voos das companhias CONTI (linha contínua vermelha) e TRACE (linha tracejada azul)]

Os voos estão planejados do seguinte modo:
● dadas duas capitais quaisquer, apenas uma das companhias realiza voos diretos entre elas, em ambos os sentidos;
● entre Brasília e La Paz não é possível fazer viagens usando apenas a CONTI, mesmo fazendo conexões em outras capitais.

a) Qual das companhias faz voos diretos entre Santiago e Brasília? Justifique sua resposta.

b) Explique por que é possível viajar entre Buenos Aires e Brasília usando apenas a empresa TRACE.

c) Dadas duas capitais quaisquer, explique por que sempre é possível viajar entre elas usando apenas a companhia TRACE, fazendo no máximo uma conexão em La Paz ou Brasília.$e$,
'aberta','EFAF','Combinatória','sim','publicado'),

-- 2023 -------------------------------------------------------------------------
('obmep','nivel_2',2,2023,1,
$e$Aninha tem nove cartões numerados de 1 a 9. Ela forma sequências com esses cartões colocando alguns deles lado a lado. Uma sequência de Aninha é chamada de especial quando, para quaisquer dois cartões vizinhos, o número de um deles é múltiplo do número do outro.

[Figura: três exemplos de sequências de cartões em caixas — "Sequência especial" mostrando os cartões 3 e 9; "Sequência especial" mostrando os cartões 2, 6, 1 e 5; "Sequência não especial" mostrando os cartões 4, 2 e 3]

a) Apresente uma sequência especial com sete cartões começando com 6 e 2.

b) Apresente uma sequência especial com oito cartões.

c) Apresente uma sequência especial com três cartões em que apareçam os cartões 5 e 7.

d) Explique por que é impossível formar uma sequência especial com os nove cartões.$e$,
'aberta','EFAF','Lógica','sim','publicado'),
('obmep','nivel_2',2,2023,2,
$e$Carlinhos fez todas as adições possíveis com três parcelas diferentes, em que cada parcela é um número de três algarismos iguais, sempre colocando as parcelas em ordem crescente. Por exemplo, 222 + 555 + 888 e 444 + 777 + 888 foram adições feitas por Carlinhos. Ele não fez a adição 222 + 888 + 555, pois as parcelas não estão em ordem crescente, nem a adição 444 + 444 + 777, pois nela existem parcelas iguais.

a) Escreva uma adição que Carlinhos fez em que o resultado é 1332.

b) Escreva todas as adições que Carlinhos fez em que o resultado é 2109.

c) Explique por que 2109 é o único resultado das adições que Carlinhos fez em que o algarismo das dezenas é diferente do algarismo das centenas.$e$,
'aberta','EFAF','Números','sim','publicado'),
('obmep','nivel_2',2,2023,3,
$e$Marco ganhou dois tapetes retangulares medindo 2 metros de largura por 7 metros de comprimento cada um. Inicialmente, Marco colocou os dois tapetes de modo a encaixá-los exatamente sobre o piso de uma sala quadrada, conforme mostrado na figura.

[Figura: sala quadrada com dois tapetes retangulares (um na horizontal e outro na vertical) sobrepostos no centro, formando uma cruz; a região de sobreposição central e as áreas não cobertas (cantos) são destacadas em cores diferentes]

a) Qual é a área do piso da sala não coberta pelos tapetes?

Depois, Marco resolveu tirar os tapetes dessa sala e colocá-los em um quarto retangular, conforme indicado na figura. A linha tracejada é uma diagonal comum a ambos os tapetes. Todos os vértices dos tapetes estão sobre o contorno do piso.

[Figura: quarto retangular contendo dois tapetes retangulares inclinados e sobrepostos, dispostos de modo que seus vértices tocam o contorno do piso; uma linha tracejada indica uma diagonal comum aos dois tapetes]

b) Qual é a área do piso do quarto?

c) Explique por que a área do piso do quarto não coberta pelos tapetes é igual à área da sobreposição dos tapetes.$e$,
'aberta','EFAF','Geometria','sim','publicado'),
('obmep','nivel_2',2,2023,4,
$e$Isabel faz pulseiras com bolinhas pretas e brancas igualmente espaçadas entre si. Girar ou refletir a pulseira não produz uma pulseira diferente. A figura mostra uma mesma pulseira em três posições diferentes sobre uma mesa.

[Figura: três representações de uma mesma pulseira circular com 6 bolinhas (algumas pretas, algumas brancas), relacionadas por setas indicando "Girar" e "Refletir", mostrando que são a mesma pulseira em posições diferentes]

a) Com duas bolinhas pretas e duas brancas, Isabel consegue fazer apenas duas pulseiras diferentes. Represente essas pulseiras na figura abaixo pintando as bolinhas pretas.

[Figura: dois círculos, cada um com quatro bolinhas (circunferências) igualmente espaçadas, para o aluno pintar de preto as bolinhas conforme as duas pulseiras possíveis]

b) Quantas pulseiras diferentes Isabel pode fazer usando três bolinhas pretas e três bolinhas brancas?

c) Quantas pulseiras diferentes Isabel pode fazer usando quatro bolinhas pretas e quatro bolinhas brancas?$e$,
'aberta','EFAF','Combinatória','sim','publicado'),
('obmep','nivel_2',2,2023,5,
$e$Zequinha quer colorir os inteiros positivos de branco ou preto, obedecendo às regras abaixo:

● se n é inteiro, então n e n + 5 devem ter a mesma cor;
● se a e b são inteiros e n = ab for branco, então pelo menos um dos fatores a ou b deve ser branco.

a) Explique por que se o 38 for branco, o 3 também deve ser branco.

b) Explique por que se o 4 for branco, o 2 também deve ser branco.

c) Explique por que se o 1 for branco, o 4 também deve ser branco.

d) Explique por que o 2 e o 3 sempre devem ter a mesma cor.$e$,
'aberta','EFAF','Números','sim','publicado'),
('obmep','nivel_2',2,2023,6,
$e$Jade possui um tabuleiro 6 x 6 e 12 peças em formato de L, como na figura. Cada peça cobre três quadradinhos do tabuleiro. Ela coloca as peças no tabuleiro sem sobreposição.

[Figura: peça em formato de L cobrindo três quadradinhos de um tabuleiro quadriculado]

a) Jade já colocou algumas peças no tabuleiro abaixo. Termine de colocar as peças que faltam, de maneira a cobrir todas as casas do tabuleiro.

[Figura: tabuleiro 6 x 6 quadriculado com algumas peças em L já posicionadas (desenhadas em azul), faltando completar a cobertura total do tabuleiro]

b) Jade colocou 2 peças no tabuleiro como na figura. Coloque mais 4 peças nesse tabuleiro de modo que seja impossível colocar uma sétima peça.

[Figura: tabuleiro 6 x 6 quadriculado com 2 peças em L já posicionadas (desenhadas em azul) na parte superior, para o aluno completar com mais 4 peças]

c) Explique por que, qualquer que seja a maneira que Jade colocar 5 peças no tabuleiro, sempre será possível colocar mais uma.$e$,
'aberta','EFAF','Combinatória','sim','publicado'),

-- 2024 -------------------------------------------------------------------------
('obmep','nivel_2',2,2024,1,
$e$Ana e Pedro cortam pedaços de papel que estão em uma cesta.

● Sempre que Ana pega um pedaço, corta em cinco pedaços e devolve todos eles para a cesta.
● Sempre que Pedro pega um pedaço, corta em três pedaços e devolve todos eles para a cesta.

Inicialmente há três pedaços de papel na cesta.

a) Quantos pedaços de papel ficarão na cesta depois de Ana e Pedro pegarem um pedaço cada um e devolverem os pedaços cortados para a cesta?

b) Descreva uma maneira de Ana e Pedro pegarem, cortarem e devolverem todos os pedaços de papel da cesta para que, a partir dos três pedaços iniciais, a cesta fique com 11 pedaços.

c) Explique por que, a partir dos três pedaços iniciais, a cesta nunca ficará com 2024 pedaços após Ana e Pedro devolverem todos os pedaços cortados para a cesta.$e$,
'aberta','EFAF','Aritmética','sim','publicado'),
('obmep','nivel_2',2,2024,2,
$e$Em uma brincadeira, Euclides escolhe um número natural, coloca esse número no topo do tabuleiro ao lado e realiza o seguinte procedimento:

● divide o número escolhido por 3 e anota o quociente e o resto;
● se o resto for 0 coloca o quociente logo abaixo do número;
● se o resto for 1 coloca o quociente deslocando uma casa para a direita;
● se o resto for 2 coloca o quociente deslocando duas casas para a direita.

A seguir, ele repete o mesmo procedimento para o quociente obtido. Na figura vemos a brincadeira de Euclides que começa com 59 e termina com o 6 na quarta casa da base do tabuleiro.

[Figura: Tabuleiro com quatro colunas e três andares (topo, segundo andar e base) ilustrando a brincadeira de Euclides começando com 59. No topo está o 59. Como 59 = 19 × 3 + 2 (resto 2), o quociente 19 é deslocado duas casas para a direita no segundo andar. Como 19 = 6 × 3 + 1 (resto 1), o quociente 6 é deslocado uma casa para a direita na base, terminando na quarta casa da base.]

a) Faça a brincadeira de Euclides com o número 51.

[Figura: Tabuleiro vazio (topo, segundo andar e base, com quatro casas na base) com o número 51 no topo, para o aluno completar a brincadeira de Euclides.]

b) Quais números Euclides pode ter escolhido se a brincadeira terminou com o 4 na quarta casa da base do tabuleiro?

[Figura: Tabuleiro com um ponto de interrogação no topo (número desconhecido) e o número 4 posicionado na quarta casa da base.]

c) Quantos números entre 10 e 99 começam uma brincadeira de Euclides que termina na quarta casa da base do tabuleiro?$e$,
'aberta','EFAF','Números','sim','publicado'),
('obmep','nivel_2',2,2024,3,
$e$Um quadrado com área igual a 36 cm² foi recortado nas seis peças da figura.

[Figura: Quadrado quadriculado dividido em seis peças (incluindo peças quadradas de tamanhos diferentes e uma peça pentagonal), formadas por oito cortes retos — quatro de um mesmo tamanho maior e outros quatro de um mesmo tamanho menor — em ângulos múltiplos de 45°.]

Foram feitos oito cortes retos, quatro de um mesmo tamanho maior e outros quatro de um mesmo tamanho menor, em ângulos múltiplos de 45°.

a) Desenhe no quadrado abaixo como poderiam estar as peças antes de recortadas.

[Figura: Quadrado quadriculado em branco ("USE ESTE QUADRADO PARA RASCUNHO") para o aluno desenhar a disposição das peças antes de recortadas.]

b) Qual é a área de uma peça pentagonal?

c) Qual é a razão entre as áreas da menor e da maior peça quadrada?$e$,
'aberta','EFAF','Geometria','sim','publicado'),
('obmep','nivel_2',2,2024,4,
$e$Os círculos do diagrama devem ser preenchidos com números naturais diferentes. Dois números escritos em círculos ligados por um segmento devem ter um divisor comum maior do que 1. Por exemplo, 8 e 15 nunca vão ser escritos em círculos ligados por um segmento. Ao lado temos um exemplo de preenchimento.

[Figura: Diagrama de exemplo com nove círculos ligados por segmentos, preenchidos com os números 13, 26, 4, 2, 6, 3, 8, 9, 10, 7, 9, 2 (números repetidos no exemplo de preenchimento mostrado), ilustrando que círculos ligados por segmento compartilham um divisor comum maior do que 1.]

a) Faça um preenchimento para os círculos vazios abaixo.

[Figura: Diagrama com nove círculos ligados por segmentos, alguns já preenchidos com números (incluindo 7, 2 e 9) e outros vazios, para o aluno completar.]

b) Preencha os círculos abaixo de modo que o maior número escrito seja 12.

[Figura: Diagrama com nove círculos vazios ligados por segmentos, para o aluno preencher de modo que o maior número escrito seja 12.]

c) Explique por que é impossível preencher os círculos de modo que o maior número escrito seja menor do que 12.

(O conjunto dos números naturais é {1, 2, 3, ...})$e$,
'aberta','EFAF','Números','sim','publicado'),
('obmep','nivel_2',2,2024,5,
$e$Marina tem vários dados idênticos com faces numeradas de 1 a 6. Nesses dados, a soma dos números em faces opostas é sempre igual a 7. Ela junta ou empilha alguns desses dados sobre uma mesa e anota a soma de todos os números que consegue ver ao dar uma volta ao redor da mesa. Por exemplo, para os dados a figura ao lado ela anotou o número 33.

[Figura: Pilha ou conjunto de dados sobre uma mesa, usada como exemplo, em que a soma de todos os números visíveis ao dar uma volta ao redor da mesa é 33.]

a) Qual é o número que Marina deve anotar para os dados da figura abaixo?

[Figura: Pilha de três dados sobre a mesa, com a face do topo mostrando o número 6, para o aluno calcular a soma dos números visíveis ao dar uma volta ao redor da mesa.]

b) Qual é o menor número possível que Marina pode anotar para dois dados juntos sobre a mesa, como indicado na figura abaixo?

[Figura: Dois dados unidos pelas laterais sobre a mesa, para o aluno determinar o menor número possível que Marina pode anotar ao dar uma volta ao redor da mesa.]

c) Marina anotou o número 88 para uma pilha de dados como indicado na figura abaixo. Quais números podem ficar no topo dessa pilha? Justifique sua resposta.

[Figura: Pilha de dados sobre a mesa para a qual a soma anotada por Marina, ao dar uma volta ao redor da mesa, é 88.]$e$,
'aberta','EFAF','Geometria','sim','publicado'),
('obmep','nivel_2',2,2024,6,
$e$A ordenação linha-coluna crescente dos números inteiros de 1 a 12 em uma tabela com três linhas e quatro colunas é feita primeiro nas linhas e, depois, nas colunas. A figura mostra um exemplo dessa ordenação.

[Figura: Sequência de três tabelas 3x4 ilustrando a ordenação linha-coluna crescente. Tabela inicial com os números 9, 3, 8, 12 / 6, 4, 1, 5 / 11, 10, 2, 7. Após "ordenação nas linhas", a tabela fica com 3, 8, 9, 12 / 1, 4, 5, 6 / 2, 7, 10, 11. Após "ordenação nas colunas", a tabela final fica com 1, 4, 5, 6 / 2, 7, 9, 11 / 3, 8, 10, 12.]

a) Faça a ordenação linha-coluna crescente dos números na tabela abaixo.

[Figura: Tabela 3x4 inicial com os números 12, 10, 2, 5 / 6, 11, 7, (vazio) / 9, 3, 8, 4 — sendo "1" um número solto associado à tabela — para o aluno aplicar a ordenação nas linhas e depois nas colunas, com espaços rotulados "ordenação nas linhas" e "ordenação nas colunas" para preencher.]

b) A ordenação linha-coluna crescente foi feita numa tabela e o número 5 ficou posicionado como abaixo. Complete o tabuleiro mostrando uma maneira de como os outros números podem ter ficado na tabela.

[Figura: Tabela 3x4 com apenas o número 5 posicionado em uma das casas, para o aluno completar com os demais números de 1 a 12 de modo consistente com uma ordenação linha-coluna crescente.]

c) A ordenação linha-coluna crescente foi feita numa tabela, e um número x ficou posicionado como abaixo. Explique por que x é o maior número na região cinza da tabela.

[Figura: Tabela 3x4 com o número x posicionado em uma casa, e uma região de casas destacada em cinza ao redor/relacionada à posição de x.]

d) Pinte na tabela abaixo as casas em que o 5 pode ficar após uma ordenação linha-coluna crescente.

[Figura: Tabela 3x4 em branco para o aluno pintar as casas possíveis para o número 5 após uma ordenação linha-coluna crescente.]$e$,
'aberta','EFAF','Lógica','sim','publicado'),

-- 2025 -------------------------------------------------------------------------
('obmep','nivel_2',2,2025,1,
$e$Ana, Bia e Carla escolheram, cada uma delas, uma figura favorita dentre as que estão ao lado:

[Figura: grade com nove figuras, combinando três formatos (triângulo, círculo, estrela) e três cores (preto, cinza, branco)]

● Ana disse que a sua figura é uma estrela preta, mas mentiu apenas sobre a cor;
● Bia disse que a sua figura é um triângulo cinza, mas mentiu apenas sobre o formato;
● Carla disse que a sua figura é um círculo branco, mas mentiu sobre a cor e o formato.

a) Quais das nove figuras podem ser a favorita de Ana?

b) Quais das nove figuras podem ser a favorita de Carla?

c) Se Ana, Bia e Carla têm figuras de formatos e cores diferentes, qual é a figura favorita de cada uma delas? Justifique sua resposta.$e$,
'aberta','EFAF','Lógica','sim','publicado'),
('obmep','nivel_2',2,2025,2,
$e$Um tabuleiro 3 × 20 foi preenchido com os números de 1 a 60, sendo que cada linha foi preenchida da esquerda para a direita com os números em ordem crescente. A primeira linha foi preenchida com os números de 1 a 20, a segunda linha, com os números de 21 a 40 e a terceira linha, com os números de 41 a 60. Cada uma das figuras abaixo mostra um pedaço desse tabuleiro.

[Figura: pedaço do tabuleiro 3 × 20 mostrando o número 17 e a posição x, com x situado duas linhas abaixo e duas colunas à esquerda de 17]

a) Qual é o valor de x?

[Figura: outro pedaço do tabuleiro 3 × 20 mostrando as posições y, z e w]

b) Os números y, z e w na figura a seguir são divisíveis por um mesmo número natural d maior do que 1. Qual é o valor de d?

c) Quais são os possíveis valores de y no item anterior?$e$,
'aberta','EFAF','Números','sim','publicado'),
('obmep','nivel_2',2,2025,3,
$e$Joana recortou vários quadrados e montou novas figuras com as peças obtidas.

a) Joana recortou um quadrado, cujo lado mede 10 cm, em cinco tiras de mesmo tamanho, conforme a Figura 1. Depois ela juntou as tiras recortadas formando um retângulo, como na Figura 2. Qual é o perímetro desse retângulo?

[Figura 1: quadrado de lado 10 cm dividido em cinco tiras (retângulos) de mesmo tamanho]
[Figura 2: retângulo formado pela junção das cinco tiras da Figura 1, uma ao lado da outra]

b) Joana dividiu outro quadrado em três tiras iguais e depois recortou duas delas em triângulos isósceles e trapézios, como na Figura 3. Em seguida, montou o retângulo da Figura 4. Se o perímetro do retângulo da Figura 4 é 40 cm, qual é a área do quadrado da Figura 3?

[Figura 3: quadrado dividido em três tiras iguais, sendo duas delas recortadas em triângulos isósceles e trapézios]
[Figura 4: retângulo montado a partir das peças (tiras, triângulos e trapézios) obtidas da Figura 3]

c) Joana recortou o quadrado da Figura 5 em retângulos e triângulos com o auxílio do quadriculado inclinado ao lado, formado por quadradinhos de lado 1 cm. Com essas peças ela formou o retângulo da Figura 6. Qual é a área do quadrado da Figura 5?

[Figura 5: quadrado recortado em retângulos e triângulos, sobreposto a um quadriculado inclinado formado por quadradinhos de lado 1 cm]
[Figura 6: retângulo formado pelas peças (retângulos e triângulos) recortadas da Figura 5]

d) Qual é o perímetro do retângulo da Figura 6?$e$,
'aberta','EFAF','Geometria','sim','publicado'),
('obmep','nivel_2',2,2025,4,
$e$Um número de quatro algarismos é chamado dourado se:

● seus algarismos são todos diferentes;
● não possui o algarismo zero;
● o algarismo dos milhares é menor do que o algarismo das unidades;
● o número formado pelos algarismos das centenas e das dezenas é o produto do algarismo das unidades com o algarismo dos milhares.

Por exemplo, 3248 é um número dourado.

a) Complete os espaços vazios para formar um número dourado.

[Figura: esquema de quatro espaços para os algarismos de um número dourado, com os algarismos centrais já preenchidos como "1" e "2" e os algarismos das extremidades (milhares e unidades) em branco para o aluno completar]

b) Escreva nos espaços abaixo o menor número dourado.

c) Explique por que o algarismo das unidades de um número dourado não pode ser 5.

d) Encontre todos os números dourados nos quais aparece o algarismo 5.$e$,
'aberta','EFAF','Números','sim','publicado'),
('obmep','nivel_2',2,2025,5,
$e$Josefa tem várias peças iguais à mostrada ao lado. Ela quer cobrir diferentes tabuleiros com essas peças, sem sobreposição.

[Figura: peça (tetraminó/poliminó) usada por Josefa para cobrir os tabuleiros]

a) Josefa quer cobrir o tabuleiro da Figura 1 e já colocou uma peça. Termine de cobrir o tabuleiro colocando mais três peças.

[Figura 1: tabuleiro com uma peça já colocada por Josefa, a ser completado com mais três peças]

b) Cubra o tabuleiro da Figura 2 com quatro peças de Josefa.

[Figura 2: tabuleiro a ser coberto com quatro peças, sem sobreposição]

c) Explique por que Josefa nunca vai conseguir cobrir o tabuleiro da Figura 3 com cinco peças.

[Figura 3: tabuleiro com quatro casas marcadas com a imagem da OBMEP, a ser coberto com cinco peças]$e$,
'aberta','EFAF','Combinatória','sim','publicado'),
('obmep','nivel_2',2,2025,6,
$e$A brincadeira do Pula Dois começa com uma quantidade par de peças sozinhas, lado a lado, sem nenhuma peça sobre outra. Em cada jogada, uma peça sozinha pode pular exatamente duas peças que estão ao seu lado e parar sobre a peça seguinte, desde que esta esteja sozinha. Após a jogada, as peças são agrupadas lado a lado, mantendo a ordem em que estavam e eliminando o espaço deixado pela peça movimentada. A brincadeira termina quando não é mais possível movimentar uma peça sozinha. No exemplo abaixo temos uma brincadeira com seis peças, que terminou em dois movimentos, sobrando 2 peças sozinhas.

[Figura: sequência ilustrando uma brincadeira com seis peças numeradas de 1 a 6, mostrando dois movimentos sucessivos até a posição final, com 2 peças sozinhas restantes]

a) Em uma brincadeira com seis peças, o primeiro movimento foi "a peça 4 pulou as peças 2 e 3 e parou sobre a peça 1". Represente abaixo as duas possibilidades para o segundo movimento.

[Figura: posição inicial das seis peças (1 2 3 4 5 6) após o primeiro movimento descrito, com espaço para representar as duas possibilidades do segundo movimento]

b) Complete a tabela abaixo, indicando todos os movimentos possíveis a partir da posição obtida no item anterior, com a descrição de cada movimento e a representação da posição resultante das peças.

[Tabela: tabela com colunas "Movimento", "Posição das Peças", "Descrição" e "Representação", a ser preenchida com os possíveis movimentos a partir da posição com seis peças, indicando, para cada movimento, qual peça pulou sobre quais peças, sobre qual peça parou, e a nova disposição das peças]

c) Represente 4 movimentos que terminam uma brincadeira com 8 peças, não sobrando peças sozinhas.

[Figura: espaço para representar a sequência de 4 movimentos, a partir de 8 peças numeradas de 1 a 8, até a posição final sem peças sozinhas]

Explique por que é sempre possível terminar uma brincadeira com qualquer quantidade par de peças maior do que ou igual a 8 de forma que não sobrem peças sozinhas.$e$,
'aberta','EFAF','Combinatória','sim','publicado')

ON CONFLICT ON CONSTRAINT questao_unique DO NOTHING;


-- ─── SOLUÇÕES ─────────────────────────────────────────────────────────────────

-- 2021 Q1
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Começando a preencher pela primeira linha, temos que a média de 2 e 14 é 16/2 = 8. Em seguida, podemos preencher a primeira coluna, cuja média é 10. Logo, os dois números vizinhos devem somar 20; portanto, 18 é o número que falta na primeira coluna. Passando para a diagonal que contém o 18, a média entre 14 e 18 é 32/2 = 16. A outra diagonal, assim como a segunda coluna e a segunda linha, tem média 16; logo, podemos facilmente preencher as casas restantes, pois 30 + 2 = 32; 8 + 24 = 32 e 10 + 22 = 32. Observe que tudo se completou corretamente.

[Figura: quadriculado 3 × 3 completamente preenchido com a solução: linha 1 = 2, 8, 14; linha 2 = 10, 16, 22; linha 3 = 18, 24, 30]

Item b) Vamos chamar de A o número que está na primeira linha e na primeira coluna, mas poderíamos ter escolhido outra casa da tabela para começar. Assim, o número que falta na primeira linha é 14 – A, o número que falta na primeira coluna é 18 – A. Agora, pela diagonal que contém esse último número, temos que a casa central terá o número 16 – A.

[Figura: quadriculado 3 × 3 com as casas preenchidas em função de A: casa (1,1) = A, casa (1,2) = 14 – A, casa (1,3) = 7, casa (2,1) = 18 – A, casa (2,2) = 16 – A, casa (2,3) = 9, casa (3,1) = 17, casa (3,2) = 4, casa (3,3) = 20]

Agora, temos que 20 + A = 32 – 2A, logo, A = 4. Resta preencher as duas casas restantes. Isso é bastante simples, já que 17 + 7 = 24 = 2 × 12 e 20 + 10 = 30 = 2 × 15.

[Figura: quadriculado 3 × 3 completamente preenchido com a solução: linha 1 = 4, 10, 7; linha 2 = 14, 12, 9; linha 3 = 17, 15, 20]

Item c) Agora só queremos a soma das nove casas e não o preenchimento completo. A casa central deve ser preenchida com 22. Agora observe que as casas que ainda não foram preenchidas devem somar 28 + 44 + 60 = 132, pois A + B = 28; C + D = 44 e E + F = 60. Logo, as nove casas somam 132 + 14 + 22 + 30 = 198. Observe que 198 = 3 × (14 + 22 + 30) = 9 × 22.

[Figura: quadriculado 3 × 3 com as casas conhecidas (14, 22, 30 e outras) e as casas desconhecidas indicadas pelos pares de letras A/B, C/D, E/F]$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2021 AND numero=1
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2021 Q2
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Uma solução:

Item a) Os números inteiros nas divisões que Joãozinho fez são aqueles em que o dividendo é múltiplo do divisor, ou seja: divisões a/b em que a é múltiplo de b. Como a e b são dois números diferentes do conjunto {1, 2, 3, 4, 5, 6, 7, 8, 9}, para cada possibilidade de divisor b em {1, 2, 3, 4, 5, 6, 7, 8, 9}, devemos contar as possibilidades de dividendo a em {1, 2, 3, 4, 5, 6, 7, 8, 9}, tais que a é múltiplo de b e diferente de b. Temos:

- para b = 1 as possibilidades para a são {2, 3, 4, 5, 6, 7, 8, 9}, ou seja, 8 possibilidades;
- para b = 2 as possibilidades para a são {4, 6, 8}, ou seja, 3 possibilidades;
- para b = 3 as possibilidades para a são {6, 9}, ou seja, 2 possibilidades;
- para b = 4 a possibilidade para a é {8}, ou seja, 1 possibilidade;
- para b = 5, 6, 7, 8, 9 não existem possibilidades para a.

Logo, Joãozinho obteve como resultado um número inteiro em 8 + 3 + 2 + 1 = 14 divisões.

Item b) Os números maiores do que 0,5 nas divisões que Joãozinho fez são aqueles em que o dividendo é maior do que a metade do divisor, ou seja: divisões a/b em que a é maior do que a metade de b. Como a e b são dois números diferentes do conjunto {1, 2, 3, 4, 5, 6, 7, 8, 9}, para cada possibilidade de divisor b em {1, 2, 3, 4, 5, 6, 7, 8, 9}, devemos contar as possibilidades de dividendo a em {1, 2, 3, 4, 5, 6, 7, 8, 9} tais que a é diferente de b e maior do que a metade de b. Temos:

- para b = 1 as possibilidades para a são {2, 3, 4, 5, 6, 7, 8, 9}, ou seja, 8 possibilidades;
- para b = 2 as possibilidades para a são {3, 4, 5, 6, 7, 8, 9}, ou seja, 7 possibilidades;
- para b = 3 as possibilidades para a são {2, 4, 5, 6, 7, 8, 9}, ou seja, 7 possibilidades;
- para b = 4 as possibilidades para a são {3, 5, 6, 7, 8, 9}, ou seja, 6 possibilidades;
- para b = 5 as possibilidades para a são {3, 4, 6, 7, 8, 9}, ou seja, 6 possibilidades;
- para b = 6 as possibilidades para a são {4, 5, 7, 8, 9}, ou seja, 5 possibilidades;
- para b = 7 as possibilidades para a são {4, 5, 6, 8, 9}, ou seja, 5 possibilidades;
- para b = 8 as possibilidades para a são {5, 6, 7, 9}, ou seja, 4 possibilidades;
- para b = 9 as possibilidades para a são {5, 6, 7, 8}, ou seja, 4 possibilidades.

Logo, Joãozinho obteve como resultado um número maior do que 0,5 em 8 + 7 + 7 + 6 + 6 + 5 + 5 + 4 + 4 = 52 divisões.

Item c) Os resultados diferentes nas divisões que Joãozinho fez são aqueles em que o dividendo e o divisor não possuem fatores comuns, ou seja: divisões em que a e b são primos entre si, pois, se houver um fator comum k a a e b, então a = k × a' e b = k × b', e esse fator comum k pode ser cancelado na divisão e a nova divisão a'/b' também será uma divisão feita por Joãozinho. Como a e b são dois números diferentes do conjunto {1, 2, 3, 4, 5, 6, 7, 8, 9}, para cada possibilidade de divisor b em {1, 2, 3, 4, 5, 6, 7, 8, 9}, devemos contar as possibilidades de dividendo a em {1, 2, 3, 4, 5, 6, 7, 8, 9} tais que a e b são primos entre si. Temos:

- para b = 1 as possibilidades para a são {2, 3, 4, 5, 6, 7, 8, 9}, ou seja, 8 possibilidades;
- para b = 2 as possibilidades para a são {1, 3, 5, 7, 9}, ou seja, 5 possibilidades;
- para b = 3 as possibilidades para a são {1, 2, 4, 5, 7, 8}, ou seja, 6 possibilidades;
- para b = 4 as possibilidades para a são {1, 3, 5, 7, 9}, ou seja, 5 possibilidades;
- para b = 5 as possibilidades para a são {1, 2, 3, 4, 6, 7, 8, 9}, ou seja, 8 possibilidades;
- para b = 6 as possibilidades para a são {1, 5, 7}, ou seja, 3 possibilidades;
- para b = 7 as possibilidades para a são {1, 2, 3, 4, 5, 6, 8, 9}, ou seja, 8 possibilidades;
- para b = 8 as possibilidades para a são {1, 3, 5, 7, 9}, ou seja, 5 possibilidades;
- para b = 9 as possibilidades para a são {1, 2, 4, 5, 7, 8}, ou seja, 6 possibilidades.

Logo, Joãozinho obteve 8 + 5 + 6 + 5 + 8 + 3 + 8 + 5 + 6 = 54 resultados diferentes nas suas divisões.

Outra solução:

Como Joãozinho fez todas as divisões possíveis com dois números diferentes do conjunto {1, 2, 3, 4, 5, 6, 7, 8, 9}, no total ele fez 9 × 8 = 72 divisões, conforme mostra a tabela ao lado:

[Tabela: tabela de dupla entrada com numerador (linhas) e denominador (colunas), ambos de 1 a 9, mostrando todas as 72 frações a/b com a ≠ b, usada para contar os resultados das divisões]

Item a) Joãozinho obteve como resultado um número inteiro nas divisões em que o numerador é um múltiplo do denominador, ou seja:

- nas oito divisões em que o denominador é igual a um;
- em três divisões em que o denominador é igual a dois;
- em duas divisões em que o denominador é igual a três;
- em uma divisão em que o denominador é igual a quatro: 8/4.

Logo, Joãozinho obteve como resultado um número inteiro em 14 divisões.

Item b) Joãozinho obteve como resultado um número maior do que 0,5 nas divisões em que o numerador é maior do que a metade do denominador, ou seja:

- nas oito divisões em que o denominador é igual a um;
- em sete divisões em que o denominador é igual a dois;
- em sete divisões em que o denominador é igual a três;
- em seis divisões em que o denominador é igual a quatro;
- em seis divisões em que o denominador é igual a cinco;
- em cinco divisões em que o denominador é igual a seis;
- em cinco divisões em que o denominador é igual a sete;
- em quatro divisões em que o denominador é igual a oito;
- em quatro divisões em que o denominador é igual a nove.

Logo, Joãozinho obteve como resultado um número maior do que 0,5 em 8 + 7 + 7 + 6 + 6 + 5 + 5 + 4 + 4 = 52 divisões.

Item c) Para saber quantos resultados diferentes Joãozinho obteve, é preciso contar as divisões que não podem ser simplificadas, ou seja, aquelas em que o numerador e o denominador são primos entre si, ou seja:

- oito em que o denominador é igual a um: 2, 3, 4, 5, 6, 7, 8, 9;
- cinco em que o denominador é igual a dois;
- seis em que o denominador é igual a três;
- cinco em que o denominador é igual a quatro;
- oito em que o denominador é igual a cinco;
- três em que o denominador é igual a seis;
- oito em que o denominador é igual a sete;
- cinco em que o denominador é igual a oito;
- seis em que o denominador é igual a nove.

Logo, Joãozinho obteve 8 + 5 + 6 + 5 + 8 + 3 + 8 + 5 + 6 = 54 resultados diferentes.

Outra maneira de contar os resultados diferentes que Joãozinho obteve é retirar das 72 divisões que ele fez aquelas em que o numerador e o denominador são ambos múltiplos de 2, 3, 5 ou 7. Como os numeradores e denominadores são números diferentes do conjunto {1, 2, 3, 4, 5, 6, 7, 8, 9}, temos:

- numerador e denominador ambos múltiplos de 2: 4 possibilidades para um (2, 4, 6 ou 8) e 3 possibilidades (a deve ser diferente de b) para outro: 4 × 3 = 12;
- numerador e denominador ambos múltiplos de 3: 3 possibilidades para um (3, 6, 9) e 2 possibilidades (a deve ser diferente de b) para outro: 3 × 2 = 6;
- numerador e denominador ambos múltiplos de 5: 1 possibilidade para um (somente o 5) e 0 possibilidade para outro: 1 × 0 = 0;
- numerador e denominador ambos múltiplos de 7: 1 possibilidade para um (somente o 7) e 0 possibilidade para outro: 1 × 0 = 0.

Logo, Joãozinho obteve 72 − 12 − 6 = 54 resultados diferentes. Esses 54 números aparecem em cinza na tabela anterior.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2021 AND numero=2
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2021 Q3
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) 9 + 99 + 999 + ⋯ + 999⋯9 (7 "noves") = 1111111 0 − 7 = 11111103 (7 "uns", 6 "uns").

9 + 99 + 999 + ⋯ + 999⋯9 (2021 "noves") = 111⋯1 0 − 2021 = 111⋯1 09089 (2021 "uns", 2017 "uns").

Item b) Usando o método de Julieta, o resultado dessa soma é 111⋯1 0 − 2021 = 111⋯1 09089, com 2021 algarismos "1" seguidos de "09089" no final (sendo que parte dos "uns" é substituída no processo de subtração). Portanto, há apenas dois algarismos 0 no resultado.

Item c) Para verificar que o método de Julieta é correto, escrevemos uma soma genérica da seguinte forma:

9 + 99 + 999 + ⋯ + 999⋯9 (n "noves") = (10 − 1) + (100 − 1) + (1000 − 1) + ⋯ + (1000⋯0 − 1) (n "zeros").

Manipulando a soma do lado direito dessa expressão (indicada com LD), ou seja, usando as propriedades associativa e comutativa da soma, temos:

LD = 10 + 100 + 1000 + ⋯ + 1000⋯0 (n "zeros") − (1 + 1 + 1 + ⋯ + 1) (n "uns") = 111⋯1 0 (n "uns") − n.

Substituindo na igualdade anterior, obtemos:

9 + 99 + 999 + ⋯ + 999⋯9 (n "noves") = 111⋯1 0 (n "uns") − n,

que justifica o método da Julieta.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2021 AND numero=3
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2021 Q4
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Maria pode pintar de azul tanto o hexágono como o trapézio e, portanto, essa cor deve ser tratada separadamente.

Caso 1: o hexágono foi pintado de azul. Então, para não repetir a mesma cor no trapézio, este só pode ser pintado de preto (1 possibilidade).

Caso 2: o hexágono não foi pintado de azul (2 possibilidades). Nesse caso, Maria pode pintar o trapézio de azul ou de preto (2 possibilidades). Pelo Princípio Multiplicativo da Contagem, há, então, 2 × 2 = 4 possibilidades de pinturas.

Juntando os dois casos, vemos que Maria pode pintar a Figura 1 de 1 + 4 = 5 maneiras diferentes.

Item b) Novamente, façamos a divisão em casos:

Caso 1: O hexágono foi pintado de azul por Maria. Logo, todos os três trapézios devem ser pintados de preto (1 possibilidade).

Caso 2: O hexágono não foi pintado de azul (2 possibilidades). Nesse caso, cada um dos três trapézios da Figura 2 podem ser pintados de azul ou preto. Pelo princípio multiplicativo, há 2 × 2 × 2 × 2 = 16 possibilidades de pinturas.

Juntando os dois casos, vemos que Maria pode pintar a Figura 2 de 1 + 16 = 17 maneiras diferentes.

Item c) Vamos enumerar as regiões de acordo com a figura ao lado:

[Figura: a Figura 3 com as regiões numeradas — hexágono 1, hexágono 2 e trapézios 3, 4 e 5]

Vamos dividir em 6 casos:

- Hexágono 1 na cor azul, hexágono 2 na cor bege. Nesse caso, os trapézios 3, 4 e 5 devem ser pintados de preto (1 possibilidade).
- Hexágono 1 na cor azul, hexágono 2 na cor cinza. Nesse caso, também os trapézios 3, 4 e 5 devem ser pintados de preto (1 possibilidade).
- Hexágono 1 na cor bege, hexágono 2 na cor azul. Nesse caso, os trapézios 3 e 4 devem ser pintados de preto, mas o trapézio 5 pode ser pintado de azul ou preto (2 possibilidades).
- Hexágono 1 na cor bege, hexágono 2 na cor cinza. Cada trapézio pode ser pintado de duas cores (2 × 2 × 2 = 8 possibilidades).
- Hexágono 1 na cor cinza, hexágono 2 na cor azul. Nesse caso, os trapézios 3 e 4 devem ser pintados de preto, e o trapézio 5 pode ser pintado de duas cores (2 possibilidades).
- Hexágono 1 na cor cinza, hexágono 2 na cor bege. Cada trapézio pode ser pintado de duas cores (2 × 2 × 2 = 8 possibilidades).

Logo, há 1 + 1 + 2 + 8 + 2 + 8 = 22 maneiras diferentes de Maria pintar a Figura 3.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2021 AND numero=4
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2021 Q5
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Os triângulos AST e FTS têm a mesma área e, portanto, a área de FTS é igual a 1 cm². De fato, o segmento GS, na figura, é perpendicular à reta que contém os lados AT e TF dos triângulos AST e FTS e é a altura comum desses triângulos relativa a esses lados. Como T é ponto médio de AF, os triângulos AST e FTS têm a mesma área.

[Figura: hexágono ABCDEF com os pontos T, S, G destacados, mostrando o segmento GS perpendicular ao lado AF, ilustrando que T é ponto médio de AF e que os triângulos AST e FTS têm a mesma altura relativa a esse lado]

Item b) A razão entre as áreas dos triângulos APR e PBQ é 4/3.

De fato, os lados AP e PB dos triângulos APR e PBQ, respectivamente, são colineares e têm a mesma medida. Os segmentos paralelos a eles, pelos pontos médios T, S e pelo vértice F do hexágono, como indicado na figura ao lado, dividem as alturas dos triângulos APR e PBQ na razão 4/3, pois esses segmentos paralelos a AB e ED, recém-traçados, são equidistantes.

[Figura: hexágono ABCDEF com os triângulos APR e PBQ destacados e os segmentos paralelos a AB traçados pelos pontos T, S e pelo vértice F, ilustrando a razão 4/3 entre as alturas]

Como as bases têm a mesma medida, a razão entre as áreas coincide com a razão entre as alturas e é igual a 4/3.

Item c) Para calcular a razão entre as áreas sombreada e não sombreada, façamos o seguinte: tracemos os segmentos AE e P'R', paralelos à diagonal BD do hexágono ABCDEF, sendo P' e R' determinados pela intersecção da reta paralela a BD passando pelo vértice F com os prolongamentos dos lados BA e DE, respectivamente, conforme a figura à esquerda.

[Figura: hexágono ABCDEF com os segmentos AE e P'R' traçados paralelamente à diagonal BD, e os pontos P' e R' marcados sobre os prolongamentos dos lados BA e DE]

Esses segmentos determinam um paralelogramo BDR'P', que é um retângulo (os ângulos ABD e BDE são retos).

Além disso, como o triângulo BCD tem a mesma área que a reunião dos triângulos AFP' e ER'F, por congruência, o retângulo BDR'P' tem a mesma área que o hexágono original, que denotaremos por H.

Podemos comparar a área de cada um dos triângulos sombreados com a área H do hexágono.

- A área do triângulo APR é a metade da área do retângulo APRE, que, por sua vez, é igual a (1/3)H. Daí, a área desse triângulo é igual a (1/6)H.
- A área do triângulo PBQ é (3/4) da área do triângulo APR, conforme visto no item b), e, portanto, sua área será (1/8)H.
- A área do triângulo AST é metade da área do triângulo ASF — vide item a) —, que, por sua vez, é igual a (1/2) × (1/4) × H = (1/8)H, portanto, sua área será (1/2) × (1/2) × (1/4)H = (1/24)H, ou seja, (1/2) × (1/8)H... 

Temos, portanto, que a área sombreada é (1/6)H + (1/8)H + (1/8)H + (1/24)H = (1/3)H, e, consequentemente, a área não sombreada é igual a (2/3)H.

Conclusão: a razão entre as áreas sombreada e não sombreada é igual a 1/2.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2021 AND numero=5
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2021 Q6
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) No primeiro pulo, Kiko tem duas opções: ele pode ir de A para B ou para D. No segundo pulo, Kiko tem três opções, tanto partindo de B quanto partindo de D. Note que, após esse segundo pulo, Kiko estará, necessariamente, em A, E ou C. No pulo final, de qualquer uma dessas pedras, ele tem apenas uma opção para ir para B. Assim, pelo princípio multiplicativo, Kiko pode realizar 2 × 3 × 1 = 6 passeios distintos, começando em A e terminando em B.

Podemos listar os passeios, explicitamente, também: A→B→A→B, A→B→E→B, A→B→C→B, A→D→A→B, A→D→E→B, A→D→C→B.

Item b) Analisando-se alguns casos com poucos pulos, como no item anterior, emerge um padrão: em um passeio qualquer, logo após os pulos de número ímpar (primeiro, terceiro, quinto e assim por diante), Kiko estará em B ou D, e, logo após os pulos de número par (segundo, quarto, sexto e assim por diante), Kiko estará em A, E ou C.

Isso pode ser entendido da seguinte maneira: se pintarmos as pedras B e D de branco e as pedras A, E e C de preto, vemos que de uma pedra branca ele pula para uma preta, e de uma pedra preta ele pula para uma branca.

A figura ao lado ilustra essa ideia.

[Figura: diagrama das cinco pedras A, B, C, D, E com as pedras B e D pintadas de branco e as pedras A, E e C pintadas de preto, ilustrando a alternância de cores a cada pulo]

Isso indica que, após o 1001º pulo, Kiko irá se encontrar, necessariamente, em B ou D. Note que o argumento não basta para mostrar que, de fato, ele pode terminar tanto em B quanto em D. Para isso, devemos mostrar que é possível, após o 1001º pulo, terminar em qualquer uma das duas pedras.

Uma maneira de mostrar que as duas pedras são finais possíveis para o passeio de Kiko é exibir, explicitamente, passeios que terminam em B ou em D depois de 1001 pulos. Um passeio assim pode ser feito da seguinte maneira: simplesmente Kiko pula de A para B e de B para A até completar 1000 pulos. Após o milésimo pulo ele estará em A. De A ele pode dar mais um pulo, tanto para B quanto para D.

Item c) Como discutido no item anterior, Kiko tem duas opções para o primeiro pulo (B ou D), 3 opções para o segundo pulo (A, C ou E), e assim por diante, até o 2019º pulo, quando tem duas opções. No 2020º pulo, Kiko tem apenas uma opção, que é pular para C. Assim, pelo princípio multiplicativo, Kiko pode realizar 2 × 3 × 2 × 3 × … × 2 × 1 = 2^1010 × 3^1009 passeios.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2021 AND numero=6
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2022 Q1
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Como Maria ganhou um doce, ela fez 8 pontos. A menos da ordem, só existe uma maneira de decompor 8 em três parcelas em que cada parcela pertence ao conjunto {1, 2, 3}; nesse caso, as parcelas são 2, 3 e 3. Assim, os valores dos peixes pescados por Maria são 2, 3 e 3 e há 3 maneiras de isso ter acontecido:

[Tabela: 1º peixe, 2º peixe, 3º peixe, total — (2,3,3,8), (3,2,3,8), (3,3,2,8)]

Item b) Para ganhar uma pipoca é necessário fazer 7 pontos. Há 6 maneiras diferentes de conseguir isso:

[Tabela: 1º peixe, 2º peixe, 3º peixe — (1,3,3), (3,1,3), (3,3,1), (2,2,3), (2,3,2), (3,2,2)]

Item c) O prêmio que sai com maior frequência é a pamonha, pois há 7 maneiras diferentes de conseguir somar 6 pontos:

[Tabela: 1º peixe, 2º peixe, 3º peixe — (1,2,3), (1,3,2), (2,1,3), (2,3,1), (3,1,2), (3,2,1), (2,2,2)]

Os demais prêmios têm menor chance de sair, como mostra o quadro abaixo:

[Tabela: Total de pontos (3 a 9) e Número de maneiras de se obter os pontos — 3: 1 maneira (1+1+1); 4: 3 maneiras (1+1+2= 1+2+1= 2+1+1); 5: 6 maneiras (1+1+3= 1+3+1= 3+1+1= 1+2+2= 2+1+2= 2+2+1); 6: 7 maneiras (1+2+3= 1+3+2= 2+1+3= 2+3+1= 3+1+2= 3+2+1= 2+2+2); 7: 6 maneiras (1+3+3= 3+1+3= 3+3+1= 2+2+3= 2+3+2= 3+2+2); 8: 3 maneiras (2+3+3= 3+2+3= 3+3+2); 9: 1 maneira (3+3+3)]$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2022 AND numero=1
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2022 Q2
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Solução: a) Se o participante obtiver 6, 5 e 2, nessa ordem,

- o 6 obtido na primeira jogada leva à casa 6;

- o 5 obtido na segunda jogada leva à casa 11, que é amarela; a seta faz voltar à casa 3;

- o 2 obtido na terceira jogada leva à casa 5, que, novamente é amarela; a seta na casa 5 faz avançar à casa 13.

Item b) Uma forma de chegar ao 25 em quatro jogadas, é ir o mais longe possível na primeira jogada (4 x 6 = 24 < 25 e as casas 11 e 19 fazem o jogador voltar para trás). Isso ocorre quando obtemos 5 nessa jogada, uma vez que da casa 5 vamos para a casa 13. A partir da casa 13 precisamos obter 12 pontos, distribuídos em três jogadas e de forma a evitar a casa 19. Temos, no quadro, algumas dessas possibilidades.

[Tabela: 1ª Jogada, 2ª Jogada, 3ª Jogada, 4ª Jogada — exemplos de sequências possíveis: (5,4,3,5), (5,4,4,4), (5,3,6,3), (5,5,5,2), (5,5,6,1)]

Item c) Vejamos por que é impossível chegar à casa 25 em apenas três jogadas. Como em três jogadas podemos obter, com os dados, no máximo 18 pontos, para chegar a 25 teremos que obter 5 pontos na primeira jogada para chegar à casa 13. Mesmo com essa otimização não poderemos chegar à casa 25 em duas jogadas, uma vez que os 12 pontos necessários para isso somente poderão ser obtidos com duas jogadas de 6 pontos, que levarão à casa 19, obrigando a voltar à casa 12.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2022 AND numero=2
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2022 Q3
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Como os 4 triângulos são iguais, basta calcular a área da folha de cartolina e dividir por 4. Portanto, qualquer um desses triângulos tem área igual a 6 × 16 / 4 = 24 cm².

Alternativamente, vemos que os quatro triângulos são triângulos retângulos iguais e seus lados menores (catetos) têm medidas 6 e 8. Portanto, a área de cada um deles é igual a 6 × 8 / 2 = 24 cm².

Item b) O buraco no centro do quadrado tem lado cuja medida é igual à diferença entre as medidas dos dois catetos dos triângulos, ou seja, 8 − 6 = 2 cm. Logo, a área do buraco é 2² = 4 cm².

Item c) A área do quadrado que Janaína montou é igual à soma das áreas dos 4 triângulos, mais a área do buraco. Logo, a área desse quadrado é igual a 4 × 24 + 4 = 96 + 4 = 100 cm² e o lado do quadrado é √100 = 10 cm.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2022 AND numero=3
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2022 Q4
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Aparecerá o número 6, observe:

99 → 993 → 21 → 213 → 6

(99 com a tecla [A] vira 993; com a tecla [S], 9+9+3=21; com a tecla [A], 213; com a tecla [S], 2+1+3=6)

Item b) Podemos apertar a tecla [A] n vezes de modo a transformar o número 99 no número 99333...3 formado com dois "9's" seguidos de n algarismos 3. Em suma, para chegar em 2022 a partir de 99 é necessário usar [S] pelo menos uma vez; se isso for realizado logo na primeira vez, o 99 inicial vai contribuir com 18. A parcela restante é 2022 – 18 = 2004, que é divisível por 3, e chegamos a 2004 ÷ 3 = 668, o número de vezes que a tecla [A] deve ser apertada.

Agora é só determinar o valor de n para que tenhamos:

18 + 3n = 2022
3n = 2004
n = 668

Portanto, para transformar 99 em 2022, apertamos a tecla [A] 668 vezes e, em seguida, apertamos a tecla [S].

Item c) A soma dos algarismos de um número deixa o mesmo resto na divisão por 3 que o número original. De fato, utilizaremos um exemplo com 6 algarismos, mas a generalização é essencialmente a mesma:

N = abcdef = a×100.000 + b×10.000 + c×1.000 + d×100 + e×10 + f
= (99999a + 9999b + 999c + 99d + 9e) + (a + b + c + d + e + f)
= 3 × (33333a + 3333b + 333c + 33d + 3e) + (a + b + c + d + e + f)

Se a + b + c + d + e + f = 3p + r (onde r é o resto na divisão por 3), então N = 3q + 3p + r, ou seja, N = 3(p+q) + r. O resto de N na divisão por 3 também é r. Vale também a recíproca: se o resto de N na divisão por 3 é r, então a + b + c + d + e + f tem o mesmo resto r na divisão por 3.

Portanto, todos os números gerados após sucessivas aplicações de teclas [S] e [A] deixam o mesmo resto na divisão por 3 que o número original. O número 99 deixa resto 0 na divisão por 3 e o número 22 deixa resto 1 na divisão por 3; logo, não é possível partir de 99 e chegar em 22.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2022 AND numero=4
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2022 Q5
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Escolhendo quatro números dentre os números 1, 2, 3, 4, 5, 6, 7, 8 e 9, a menor soma possível que podemos obter ocorre quando esses números são os menores possíveis, isto é, 1 + 2 + 3 + 4 = 10. Portanto, Marco escreveu no quadrado destacado os números de 1 a 4. Fora desse quadrado, ele escreveu os números 5, 6, 7, 8 e 9, cuja soma é 5 + 6 + 7 + 8 + 9 = 35.

Item b) A casa central, comum a esses dois quadrados, está em amarelo. As casas de cor cinza, uma no canto superior direito e outra no canto inferior esquerdo, estão fora dos quadrados destacados. A soma dos números que Marco escreveu nos quadrados destacados é igual a 21 + 26 = 47.

A soma de todos os números escritos por Marco é 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 = 45.

Vemos, então, que a soma dos números escritos nos cantos mais 47 é igual a 45 mais o número escrito na casa central. Logo, o número escrito na casa central é a soma dos números escritos nos cantos mais 2. A menor soma possível para os números escritos nos cantos é 1 + 2 = 3, portanto o menor número que Marco pode ter escrito na casa central é 3 + 2 = 5.

Um quadrado do Marco que tem esse menor valor possível no centro é:

[Tabela: quadriculado 3x3 — primeira linha 6, 3, 2; segunda linha 7, 5, 4; terceira linha 1, 9, 8]

Outra solução: O total das somas dos dois quadrados destacados é 21 + 26 = 47. Se x é o número escrito no quadrado central, então 47 – x é a soma dos sete números que Marco escreveu naqueles dois quadrados. Isto ocorre porque a soma de todos os números escritos num dos quadrados destacados mais a soma de todos os números escritos no outro quadrado destacado conta duas vezes x. Se y é a soma dos dois números escritos fora dos quadrados destacados, então 47 – x + y = 1 + 2 + 3 + ... + 9 = 45, logo x = 2 + y. Se y é o menor possível, então x é o menor possível. O menor valor possível de y é 1 + 2 = 3; logo, o menor valor possível para o número escrito no quadrado central é x = 5.

Outro exemplo de preenchimento:

[Tabela: quadriculado 3x3 — primeira linha 4, 3, 2; segunda linha 9, 5, 6; terceira linha 1, 8, 7]

Item c) No quadriculado 3 x 3 temos quatro números nos cantos, um número no centro e quatro números na coluna do meio ou na linha do meio (excluindo o central).

Quando juntamos as quatro somas dos números escritos nos quadrados destacados, isto é, quando calculamos 18 + 25 + 21 + 24, obtemos 88. Essa soma conta uma vez os números nos quatro cantos, 2 vezes os números nos quatro meios e 4 vezes o número do centro (isto é, nos quadrados destacados, os números dos cantos aparecem uma vez só em cada quadrado destacado, o número do centro aparece em todos os quatro quadrados, e cada um dos números do meio aparece em dois quadrados destacados).

Por outro lado, sabemos que a soma dos números de 1 a 9, escritos no tabuleiro 3 x 3, é 45. Assim, contando duas vezes cada número, a soma é 2 x 45 = 90.

Portanto:

2 vezes números dos cantos + 2 vezes números dos meios + 2 vezes número do centro = 90.

Vimos que:

1 vez números dos cantos + 2 vezes números dos meios + 4 vezes número do centro = 88.

A primeira equação acima refere-se à soma dos nove números escritos no tabuleiro, multiplicada por 2. A segunda equação refere-se ao total das quatro somas nos quadrados destacados, na qual os números dos cantos aparecem uma única vez, os números do meio aparecem duas vezes e o número central aparece quatro vezes. Subtraindo a segunda equação da primeira, eliminamos os números do meio.

Como 90 = 88 + 2, temos:

2 vezes números dos cantos + 2 vezes números dos meios + 2 vezes número do centro = 1 vez números dos cantos + 2 vezes números dos meios + 4 vezes número do centro + 2.

Logo: 1 vez os números dos cantos = 2 vezes o número do centro + 2. Mas, o enunciado nos diz que a soma dos números nos quatro cantos é 16; logo, 16 = 2 vezes o número do centro + 2. Assim, 8 = número do centro + 1, ou seja, o número do centro é igual a 7.

Outra solução: Se 16 é a soma dos quatro números escritos nos cantos, x o número escrito no centro e y a soma dos quatro números restantes (os do meio), temos:

16 + y + x = 45 (soma de todos os números do tabuleiro)

16 + 4x + 2y = 18 + 21 + 24 + 25 = 88 (soma das quatro somas dos quadrados destacados)

Multiplicando a primeira equação por 2: 32 + 2y + 2x = 90.

Subtraindo a segunda equação da nova equação: (32 + 2y + 2x) − (16 + 4x + 2y) = 90 − 88, logo 16 − 2x = 2, ou seja, 2x = 14, x = 7.

Um exemplo de preenchimento desse quadriculado é:

[Tabela: quadriculado 3x3 — primeira linha 2, 6, 4; segunda linha 3, 7, 8; terceira linha 9, 5, 1]

Outra solução: Ao somarmos os números que aparecem nos quatro cantos (casas vermelhas) com os totais dos quatro quadrados 2 x 2 destacados (cada um com uma casa vermelha, duas casas verdes e uma casa azul), vemos que os números correspondentes às casas vermelhas são contados duas vezes, os que aparecem nas casas verdes são contados duas vezes e o que aparece na casa azul é contado quatro vezes, ou seja, essa soma nos dá duas vezes a soma de todos os números que preenchem o quadrado 3 x 3 mais duas vezes o número da casa azul. Assim, concluímos que o número da casa azul é

((16 + 18 + 25 + 21 + 24) – 2 x 45)/2 = (104 – 90)/2 = 7.

[Figura: quadriculado 3x3 com casas dos cantos em vermelho, casas do meio em verde e casa central em azul]$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2022 AND numero=5
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2022 Q6
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Se o voo direto entre Santiago e Brasília fosse feito pela CONTI, teríamos o diagrama ao lado e seria possível viajar de La Paz a Brasília pela CONTI, o que não é possível de acordo com o enunciado. Logo, o trajeto Santiago-Brasília é feito pela TRACE.

[Figura: diagrama mostrando a situação que não pode ocorrer, com as 10 capitais e o voo Santiago-Brasília feito pela CONTI, formando uma rota CONTI entre La Paz e Brasília]

Item b) A companhia TRACE faz os voos diretos (em ambos os sentidos) em pelo menos um dos trechos: Buenos Aires – La Paz ou Buenos Aires – Brasília. Caso contrário, se os voos em ambos os trechos fossem feitos pela CONTI, seria possível viajar entre La Paz e Brasília pela CONTI com conexão em Buenos Aires (como indicado no diagrama abaixo), o que não é possível de acordo com o enunciado.

[Figura: diagrama mostrando a situação que não pode ocorrer, com as 10 capitais e os trechos Buenos Aires–La Paz e Buenos Aires–Brasília feitos pela CONTI]

Assim, pelo menos uma das seguintes viagens é possível:

Buenos Aires <--TRACE--> Brasília (voo direto) ou

Buenos Aires <-TRACE-> La Paz <-TRACE-> Brasília (com escala em La Paz).

Item c) O argumento de (b) mostra que para qualquer capital X, não apenas Buenos Aires, pelo menos uma entre as conexões X-Brasília ou X-La Paz é da TRACE. Se C e D são duas capitais:

— TRACE faz C-Brasília e D-Brasília: Aqui TRACE faz C-D com escala em Brasília e, analogamente, para C-La Paz e D-La Paz.

— TRACE faz C-Brasília e D-La Paz, com C e D distintas: Se TRACE faz C-D, há voo direto entre elas e terminou. Caso contrário, a CONTI faria C-D, e nesse caso a CONTI também faria a viagem entre La Paz e Brasília (pois faria La Paz-C-D-Brasília), contradizendo o enunciado. Logo, pelo menos uma dessas conexões é da TRACE e o resultado segue.

Mais detalhadamente: Entre La Paz e Brasília os voos diretos são feitos pela TRACE. Para outras duas capitais quaisquer dividimos a análise em casos:

Caso 1. Viagens entre La Paz e outra capital C diferente de Brasília.

Nesse caso, pela análise feita no item b), podemos trocar Buenos Aires por outra capital e proceder de modo análogo ao que foi feito acima; sempre é possível realizar pelo menos uma das seguintes viagens:

C <--TRACE--> La Paz (voo direto).

C <--TRACE--> Brasília <--TRACE--> La Paz (uma conexão em Brasília).

Caso 2. Viagens entre Brasília e outra capital C diferente de La Paz.

Esse é precisamente o que ocorre com a cidade C = Buenos Aires no item b) e, de forma análoga ao Caso 1, sempre é possível realizar pelo menos uma das seguintes viagens:

C <--TRACE--> Brasília (voo direto).

C <--TRACE--> La Paz <--TRACE--> Brasília (uma conexão em La Paz).

Caso 3. Viagens entre duas capitais C1 e C2, diferentes de La Paz e de Brasília.

Tomando C1 = Caracas e C2 = Buenos Aires, não haverá perda de generalidade, os outros casos são análogos. Caso a TRACE não faça os voos diretos entre Caracas e Buenos Aires, teríamos uma situação como a indicada no seguinte diagrama:

[Figura: diagrama com as 10 capitais ilustrando a situação do Caso 3, em que a TRACE não faz voo direto entre Caracas e Buenos Aires]

Subcaso 3.1. A TRACE faz as seguintes viagens: Buenos Aires <-----> La Paz <-----> Caracas.

Nesse caso seria possível viajar entre Buenos Aires e Caracas com uma conexão em La Paz.

Subcaso 3.2. Pelo menos um dos trechos Buenos Aires – La Paz ou La Paz – Caracas é feito pela CONTI. Aqui estão as possibilidades:

[Figura: diagramas mostrando as possibilidades do Subcaso 3.2, com pelo menos um dos trechos Buenos Aires–La Paz ou La Paz–Caracas feito pela CONTI]

Nesse caso, os trechos Buenos Aires – Brasília e Brasília-Caracas serão feitos pela TRACE, pois, caso contrário, seria possível viajar com escalas entre La Paz e Brasília, o que não é possível pelo enunciado. Portanto, nessa situação, a TRACE fará as viagens: Buenos Aires <-------> Brasília <------> Caracas, ou seja, seria possível viajar entre Buenos Aires e Caracas com uma conexão em Brasília.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2022 AND numero=6
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2023 Q1
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Para uma sequência que começa com os cartões 6 e 2, nessa ordem, o próximo cartão pode ser o de número 4, 8 ou 1. Por exemplo, sendo o 4, o cartão seguinte pode ser 8, seguido do 1, resultando em (6, 2, 4, 8, 1). Os cartões seguintes podem ser os de números 9 e 3, resultando em (6, 2, 4, 8, 1, 9, 3), uma sequência especial com sete cartões.

Item b) Com base na sequência anterior, com sete cartões, é possível formar uma com oito cartões: os dois últimos cartões, 9 e 3, podem ser movidos para o início da sequência anterior e o cartão de número 5 (ou 7) pode vir à direita do cartão de número 1, resultando em (9, 3, 6, 2, 4, 8, 1, 5) (ou (9, 3, 6, 2, 4, 8, 1, 7)).

Item c) Os números 5 e 7 são ambos múltiplos do 1. Uma sequência especial com três cartões, dentre eles os de números 5 e 7, pode ser (5, 1, 7). A outra possível é (7, 1, 5).

Item d) Dentre todos os cartões, os de números 5 e 7 são aqueles que podem ter menos vizinhos em uma sequência especial (exatamente um vizinho cada, que deve ser o cartão de número 1). Logo, se um deles é usado, o outro não pode ser usado para obter a maior sequência especial possível. Quando o 5 e o 7 são ambos utilizados, obtemos uma das sequências do item c). Portanto, as maiores sequências especiais com os cartões de números 5 ou 7 têm apenas um desses cartões, que deve ser posicionado em uma das suas pontas (ou no início ou no fim). Logo, é impossível formar uma sequência especial usando todos os cartões. As maiores delas têm oito cartões, tal como a do item b).$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2023 AND numero=1
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2023 Q2
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Há várias soluções, por exemplo: 111 + 555 + 666, 222 + 333 + 777, 333 + 444 + 555.

Item b) Todos os números que Carlinhos considerou são múltiplos de 111, 1 × 111 = 111, 2 × 111 = 222, 3 × 111 = 333, e assim por diante. Por esse motivo, 2109, que é resultado da soma de três desses números, também é múltiplo de 111. Ao dividir 2109 por 111 obtemos quociente 19, ou seja, 2109 = 19 × 111. Em outras palavras, devemos encontrar todas as somas ordenadas de três parcelas para obtermos 19 × 111. Existem 5 possibilidades, listadas a seguir.

(2 + 8 + 9) × 111 = 222 + 888 + 999
(3 + 7 + 9) × 111 = 333 + 777 + 999
(4 + 6 + 9) × 111 = 444 + 666 + 999
(4 + 7 + 8) × 111 = 444 + 777 + 888
(5 + 6 + 8) × 111 = 555 + 666 + 888

Item c) As somas de três parcelas de Carlinhos resultando em um número até 999 possuem todas os mesmos algarismos da dezena e centena (não ocorre o "vai um"). Vimos no item anterior que os resultados das contas de Carlinhos são sempre múltiplos de 111. Ao somarmos 111 a 999 obtemos 111 + 999 = 110 + 1 + 999 = 110 + 1000 = 1110, cujos algarismos da dezena e centena são iguais. Ao somarmos múltiplos de 111 até 888 percebemos que não há alteração na igualdade dos algarismos da dezena e centena; portanto, esses algarismos continuam iguais até 1110 + 888 = 1998. Mas, agora, ao somarmos 111, obtemos exatamente 111 + 1998 = 109 + 2 + 1998 = 109 + 2000 = 2109, que possui algarismos de dezena e centena distintos. Continuando, notamos que ao somar 111 a esse número obtemos 2109 + 111 = 2220, que volta a ter os mesmos algarismos da dezena e da centena, e qualquer soma de múltiplos de 111 até 777 não vai mudar essa situação. O maior número que Carlinhos pode obter é 777 + 888 + 999 = (7 + 8 + 9) × 111 = 24 × 111 = 2664; portanto, 2109 é o único número que Carlinhos obtém com algarismos distintos na dezena e na centena.

Outra solução: As somas de Carlinhos são todas do tipo aaa + bbb + ccc, com a < b < c. A única maneira do algarismo das dezenas do resultado da conta ser diferente do das centenas ocorre quando a + b + c = 19 ("vai um" das unidades para as dezenas, depois "vai dois" das dezenas para as centenas), pois a soma a + b + c varia de 6 a 24.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2023 AND numero=2
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2023 Q3
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) O comprimento e a largura do piso da sala são iguais ao comprimento dos tapetes, ou seja, 7 m. Logo, o piso da sala é um quadrado cuja área é igual a 7 x 7 = 49 m^2. A área coberta pelos tapetes é igual à soma das áreas dos tapetes menos a área do quadrado 2 x 2 que é a sobreposição dos mesmos. Logo, a área não coberta pelos tapetes é igual a 49 – (2 x 14) + 4 = 25 m^2.

Item b) Na figura, o retângulo ABCD representa o piso do quarto e o segmento MN é a diagonal comum aos dois retângulos que representam os tapetes. Como os dois tapetes têm as mesmas medidas, os quatro triângulos PMN, MSN, MQN e MNR são congruentes, portanto, eles têm as mesmas alturas; assim, os pontos P e R equidistam de MN e estão, desta maneira, sobre uma reta paralela a MN. Analogamente Q e S estão sobre outra reta paralela a MN pois equidistam dela. Além disso, como as alturas dos mencionados quatro triângulos são iguais, M é ponto médio de AD e N é ponto médio de BC.

Se P é o vértice do tapete indicado na figura e o segmento PT é a altura do triângulo PNM relativa ao lado MN, então a área desse triângulo é metade do produto MN × PT, que, por sua vez, é igual à área do retângulo ABNM. Vemos também que o triângulo PNM é metade do tapete. Como a área do tapete é 7 x 2 = 14, concluímos que a área do retângulo ABNM é igual a 14 m^2. Da mesma maneira, por simetria, concluímos que a área do retângulo MNCD é igual a 14 m^2. Portanto, a área do piso do quarto é igual a 14 + 14 = 28 m^2. Note que essa área é igual à soma das áreas dos dois tapetes.

[Figura: retângulo ABCD (piso do quarto) com os pontos M e N sendo pontos médios dos lados AD e BC, respectivamente; o segmento MN é a diagonal comum aos dois tapetes; os vértices P, Q, R, S dos tapetes formam quatro triângulos PMN, MSN, MQN e MNR dentro do retângulo; o segmento PT é a altura do triângulo PNM relativa ao lado MN]

Item c) A área da parte do piso que não está coberta pelos tapetes é igual à área total do piso menos a área coberta pelos tapetes. Esta, como já vimos, é igual a duas vezes a área de cada tapete, menos a área de sobreposição dos dois tapetes. Temos, assim,

Área (piso não coberta) = Área (piso) – [2 x Área (tapete) – Área (sobreposição)]

Vimos acima que Área (piso) = 2 x Área (tapete); logo, Área (piso não coberta) = Área (sobreposição).$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2023 AND numero=3
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2023 Q4
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) [Figura: dois círculos com quatro bolinhas cada, representando as duas pulseiras possíveis com duas bolinhas pretas e duas brancas — uma com as bolinhas pretas adjacentes e outra com as bolinhas pretas opostas]

Item b) São três pulseiras diferentes.

Item c) São oito pulseiras diferentes. Primeiro imaginamos que já foram colocadas 4 bolinhas brancas em um círculo; formam-se 4 intervalos entre elas. A ideia é escolher organizadamente alguns desses intervalos e colocar neles as 4 bolinhas pretas, identificando pulseiras a menos de giros e de reflexões.

Escolhemos somente um dos intervalos e colocamos nele as 4 bolinhas pretas, como na figura ao lado.

Existem 2 maneiras de selecionar dois dos 4 intervalos (vizinhos ou não vizinhos).

No primeiro desses casos, podemos colocar as bolinhas pretas de 2 maneiras diferentes:

No segundo desses casos, também podemos colocar as bolinhas pretas de 2 maneiras diferentes:

Para exatamente duas bolinhas pretas seguidas temos uma pulseira.

Para as bolinhas pretas e brancas alternadas temos uma pulseira.

Para três bolinhas pretas seguidas temos uma pulseira.

Existe, de acordo com o enunciado, apenas uma maneira de escolher 3 intervalos seguidos (os 3 devem ser vizinhos) e, neste caso, duas maneiras diferentes de colocar as bolinhas pretas:

Só há uma maneira de selecionar os 4 intervalos e, portanto, só uma maneira de colocar neles as 4 bolinhas pretas:

Assim, há 8 pulseiras diferentes com 4 bolinhas pretas e 4 bolinhas brancas.

[Figura: diversas ilustrações de pulseiras (círculos com bolinhas pretas e brancas) usadas para enumerar os casos de 1, 2, 3 e 4 bolinhas pretas seguidas, e o caso alternado, totalizando as 8 pulseiras distintas]

Outra solução:

Para quatro bolinhas pretas seguidas temos uma pulseira:

Para exatamente três bolinhas pretas seguidas temos duas pulseiras:

Para exatamente duas bolinhas pretas seguidas temos três pulseiras:

Para um par de duas pretas seguidas:

Para as bolinhas pretas e brancas alternadas temos uma pulseira:

[Figura: conjunto adicional de pulseiras (círculos com bolinhas pretas e brancas) ilustrando a contagem alternativa por número de bolinhas pretas consecutivas]$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2023 AND numero=4
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2023 Q5
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Aplicando a primeira regra para os inteiros 𝑛 = 33 e 𝑛 + 5 = 38, segue que

- 33 e 33 + 5 = 38 devem ter a mesma cor, bem como os inteiros
- 28 e 28 + 5 = 33
- 23 e 23 + 5 = 28
- 18 e 18 + 5 = 23
- 13 e 13 + 5 = 18
- 8 e 8 + 5 = 13
- 3 e 3 + 5 = 8

Concluímos assim, pela primeira regra, que os inteiros 3, 8, 13, 18, 23, 28 e 33 devem ter a mesma cor. Logo, se Zequinha colorir o 38 de branco, a cor do 3 deve ser branca.

Item b) De acordo com a segunda regra, se 𝑎 e 𝑏 são inteiros e 𝑛 = 𝑎𝑏 for branco, então pelo menos um dos fatores 𝑎 ou 𝑏 deve ser branco. No caso em que 𝑎 = 𝑏 = 2 e 𝑛 = 𝑎𝑏 = 2 ∙ 2 = 4 for branco, temos dois fatores 𝑎 e 𝑏 iguais a 2 em que pelo menos um deles, no caso o 2, deve ser branco. A segunda regra aplicada em quadrados perfeitos 𝑛 = 𝑎^2 diz que se 𝑛 = 𝑎^2 for branco então 𝑎 deve ser branco.

Item c) Se o 1 for branco então, pela primeira regra, os inteiros 1, 1 + 5 = 6, 6 + 5 = 11 e 11 + 5 = 16 devem ter a mesma cor branca. Por outro lado, a segunda regra aplicada ao quadrado perfeito 16 = 4^2 diz que se 16 for branco então 4 deve ser branco. Logo, se o 1 for branco, o 16 e o 4 também serão brancos.

Item d) Temos que explicar por que o 2 e o 3 sempre terão a mesma cor segundo as regras de pintura que Zequinha deve obedecer. Vamos fazer isso justificando por que essas regras não permitem que o 2 e o 3 sejam pintados de cores diferentes. Temos duas possibilidades para o 2 e o 3 terem cores diferentes:

- Caso em que 2 é preto e 3 é branco:

Nesse caso, como 3 é branco segue, pela primeira regra, que 8 = (3 + 5) será branco. Como 8 = 2 ∙ 4 e 2 é preto, segue, pela segunda regra, que 4 será necessariamente branco. Sendo 4 = 2^2 branco segue, pela segunda regra, que 2 será branco. Mas 2 não pode ser branco porque estamos no caso em que 2 é preto.

- Caso em que 2 é branco e 3 é preto:

Nesse caso, como 2 é branco segue pela primeira regra que 12 = (2 + 5) + 5 será branco. Como 12 = 3 ∙ 4 e 3 é preto, segue, pela segunda regra, que 4 será necessariamente branco. Sendo 4 branco, segue, pela primeira regra, que 9 = 4 + 5 será branco. Sendo 9 = 3^2 branco, segue pela segunda regra, que 3 será branco. Mas 3 não pode ser branco porque estamos no caso em que 3 é preto.

Assim, os casos em que 2 e 3 tem cores diferentes nunca ocorrem segundo as regras de pintura que Zequinha deve obedecer.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2023 AND numero=5
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2023 Q6
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) [Figura: tabuleiro 6 x 6 com a solução completa mostrando as 12 peças em L cobrindo todas as 36 casas do tabuleiro sem sobreposição]

Item b) [Figura: tabuleiro 6 x 6 mostrando as 2 peças originais mais 4 peças adicionais (totalizando 6 peças) posicionadas de modo que seja impossível colocar uma sétima peça]

Item c) Dividimos o tabuleiro em 9 subtabuleiros 2 x 2, conforme a ilustração e vamos usar o Princípio das Casas de Pombos. Vamos pintar de preto as casas ocupadas pelas cinco peças. Como cada peça ocupa três casas, 15 casas serão pintadas de preto. Observe que se existir um subtabuleiro 2 x 2 com no máximo uma casa preta, isto é, com 0 ou 1 casa preta, será possível colocar uma peça nesse subtabuleiro. Como particionamos o tabuleiro 6 x 6 em 9 subtabuleiros 2 x 2, para evitar que uma nova peça seja colocada, precisaríamos garantir que pelo menos 2 x 9 = 18 casas fossem pretas. Fato que não ocorre, pois com 5 peças cobrimos 15 casas. Logo, sempre será possível colocar uma peça a mais.

[Figura: tabuleiro 6 x 6 dividido em 9 subtabuleiros 2 x 2, ilustrando a divisão usada no argumento do Princípio das Casas de Pombos]

Observação: depois de colocadas 5 peças no tabuleiro, existirá sempre uma maneira de se colocar mais duas peças. De fato, por mais atenciosos que sejamos em colocar 5 peças e tentar evitar a colocação de outras peças, no máximo 7 dos subtabuleiros 2 x 2 terão duas ou mais casas pretas cobertas por essas peças (para que houvesse 8, precisaríamos de pelo menos 16 casas pretas e há apenas 15). É o que ocorre, por exemplo, na situação abaixo:

[Figura: tabuleiro 6 x 6 ilustrando uma situação com 5 peças colocadas e a divisão em subtabuleiros 2 x 2, mostrando que ao menos dois desses subtabuleiros têm menos de duas casas cobertas]

Logo, há pelo menos dois tabuleiros 2x2 com menos de duas casas cobertas, nas quais podemos colocar novas peças.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2023 AND numero=6
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2024 Q1
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) O número de papéis na cesta sempre aumenta depois que Ana ou Pedro devolvem os pedaços que cortaram. Cada vez que Ana pega um pedaço da cesta, corta em 5 pedaços, e devolve os pedaços cortados para a cesta, o total de papéis da cesta aumenta em 5 − 1 = 4. Cada vez que Pedro pega um pedaço da cesta, corta em 3 pedaços, e devolve os pedaços cortados para a cesta, o total de papéis da cesta aumenta em 3 − 1 = 2. Logo, depois de Ana e Pedro pegarem um pedaço cada um e devolverem os pedaços cortados para a cesta, ela ficará com 3 + 4 + 2 = 9 (ou 5 + 3 + 1 = 9: Ana+Pedro+cesta) papéis.

Item b) Há cinco maneiras diferentes de Ana e Pedro pegarem papéis da cesta a partir dos 3 pedaços iniciais para que, depois de devolverem os pedaços cortados, ela fique com 11 pedaços. Essas maneiras dependem da ordem em que Ana e Pedro pegam pedaços da cesta. São elas:

- Ana – Pedro – Pedro (3 + 4 + 2 + 2 = 11) ou (5 + 3 + 3) = 11
- Pedro – Ana – Pedro (3 + 2 + 4 + 2 = 11) ou (3 + 5 + 3 = 11)
- Pedro – Pedro – Ana (3 + 2 + 2 + 4 = 11) ou (3 + 3 + 5 = 11)
- Ana – Ana (3 + 4 + 4 = 11) ou (1 + 5 + 5 = 11)
- Pedro – Pedro – Pedro – Pedro (3 + 2 + 2 + 2 + 2 = 11) ou [(2 + 3) + 3 + 3 = 11]

Item c) O número inicial de papéis na cesta é ímpar, e vai sempre aumentar de 2 ou de 4 pedaços. Como um ímpar mais um par sempre resulta em um número ímpar, o número de papéis na cesta sempre será ímpar, nunca será 2024.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2024 AND numero=1
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2024 Q2
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) [Resolução apresentada apenas em forma de tabuleiro preenchido, sem texto corrido na solução oficial.]

Item b) Fazendo a brincadeira "de trás para a frente", o número que deu origem ao 4 só pode ser 4 × 3 = 12, 4 × 3 + 1 = 13 ou 4x3+2=14, pois são as operações inversas da brincadeira. Entretanto, o 12 não foi, pois não há posição acima da quarta posição da base. Observe que o 14 deve aparecer na segunda posição (da esquerda para a direita) do segundo andar e que 13 deve aparecer na terceira posição (da esquerda para a direita) do segundo andar para que possam dar origem ao 4 na posição que ele ocupa na base. Se o número que aparece no topo dá origem ao 14, esse número deve ser 14 × 3 + 1 = 43. Se o número que aparece no topo dá origem ao 13, esse número deve ser o 13 × 3 + 2 = 41. Portanto, as respostas são 41 e 43.

Item c) Se o número x está escrito na quarta posição da base, então os números que podem ter dado origem a ele são 3x + 2 (na segunda posição do segundo andar) e 3x + 1 (na terceira posição do segundo andar). Estes, por sua vez, devem ter vindo de 3(3x + 2) + 1 = 9x + 7 e 3(3x + 1) + 2 = 9x + 5, respectivamente. Portanto, os números devem ser múltiplos de 9 mais 7 ou múltiplos de 9 mais 5. Entre 10 e 99 os menores números com essas propriedades são 16 = 9 × 1 + 7 e 14 = 9 × 1 + 5, respectivamente. Os maiores são, respectivamente, 97 = 9 × 10 + 7 e 95 = 9 × 10 + 5. Explicitamente, são os números do conjunto {16,25,34,43,52,61,70,79,88,97} ∪ {14,23,32,41,50,59,68,77,86,95}. Portanto, são 20 números que satisfazem a condição deste item.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2024 AND numero=2
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2024 Q3
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Abaixo estão três soluções possíveis. Outras soluções podem ser obtidas por meio de rotações ou reflexões.

[Figura: Três quadrados quadriculados mostrando soluções possíveis para a disposição das seis peças (incluindo as peças quadradas e a peça pentagonal) antes de serem recortadas, obtidas por rotações ou reflexões entre si.]

Item b) A peça pentagonal ocupa dois quadradinhos e meio do quadriculado. O quadrado original é formado por 9 quadradinhos do quadriculado. Como a área do quadrado original é igual a 36 cm², a área de cada quadradinho do quadriculado é igual a 36 ÷ 9 = 4 cm². Logo a área da peça pentagonal é igual a 4 × 2,5 = 10 cm².

Item c) A menor peça quadrada ocupa um quadradinho do quadriculado, e sua área é igual a 4 cm². A maior peça quadrada ocupa quatro metades do quadradinho do quadriculado, ou seja, 2 quadradinhos do quadriculado, e sua área é igual a 8 cm². Logo, a razão entre as áreas da menor e da maior peça quadrada é igual a 4 cm² / 8 cm² = 1/2.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2024 AND numero=3
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2024 Q4
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Há infinitos preenchimentos possíveis, por exemplo:

[Figura: Diagrama com nove círculos preenchidos mostrando um exemplo válido de preenchimento que respeita a regra de divisor comum maior do que 1 entre círculos ligados.]

Item b) Abaixo apresentamos uma possibilidade. Há muitos exemplos. Em todos eles a posição do 5 e do 10 é fixa.

[Figura: Diagrama com nove círculos preenchidos com números até 12, mostrando uma possibilidade de preenchimento em que o maior número escrito é 12, com as posições do 5 e do 10 fixas.]

Item c) Se o maior número escrito é menor do que 12, os oito números a serem escritos devem ser escolhidos entre 2,3,4,5,6,8,9 e 10. De fato, o número 1 nunca pode ser escolhido, e se um número primo é escolhido para ser escrito num círculo então, necessariamente, um de seus múltiplos também deve ser escolhido para ser escrito num círculo vizinho; logo 7 e 11 não podem ser escolhidos, pois seus múltiplos são maiores do que 12. Como temos oito números e nove círculos, o preenchimento é impossível.

Adendo a) Está certo um preenchimento correto usando o zero se ele for considerado como número natural.

Adendo b) Está certo um preenchimento correto com os números 0,2,3,4,5,6,7,8,9,10,11 e 12, se o zero for considerado como número natural.

Adendo c) Está certo a apresentação de que é possível um preenchimento correto utilizando os números 0,2,3,4,5,6,7,8,9,10 e 11, em que o zero é considerado como número natural.

(ℕ = {1, 2, 3, …} é o conjunto dos números naturais.)$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2024 AND numero=4
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2024 Q5
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Na pilha de três dados da figura, ao dar uma volta em torno da mesa, Marina consegue ver seis pares de faces opostas mais a face do topo, com o número 6. Cada par de faces opostas totaliza 7, portanto, ela anota o número 48, já que 6 × 7 + 6 = 48.

Item b) Nesta nova figura, com dois dados unidos pelas laterais, ao dar uma volta em torno da mesa, Marina consegue ver seis faces: dois pares de faces opostas, que totalizam 14 pontos, mais quatro faces (duas em cada dado). Para que a soma total seja mínima, essas quatro faces devem ter os números 1 ou 2, sendo 1 e 2 em um dado e 1 e 2 em outro. Desta forma, o menor número possível que Marina pode anotar é 14 + 2 × 1 + 2 × 2 = 20. Como curiosidade, observe que os pares de faces opostas que Marina consegue ver nos dados devem ter os números 3 e 4.

Item c) Marina consegue ver sete pares de faces opostas da nova pilha, que totalizam 7 × 7 = 49. Logo, as demais sete faces visíveis por ela devem totalizar 88 − 49 = 39. Observe que 39 = 4 × 6 + 3 × 5; logo, deve haver ao menos quatro dessas faces com o número 6 para que seja possível obter a soma 39 (se houvesse menos nunca chegaríamos a 39 com sete parcelas). Vamos concentrar nossa atenção nas sete faces que Marina consegue ver, mas não consegue ver a face oposta. Há três casos a considerar:

- Não é possível que seis faces dessas sete faces tenham o número 6 (embora 39 = 6 × 6 + 3). Se isso ocorresse, um dos dados mais à direita teria duas faces (em vermelho na figura abaixo) com o número 6.

[Figura: Pilha de dados ilustrando o caso impossível em que um dos dados mais à direita teria duas faces, destacadas em vermelho, com o número 6.]

- Configurações nas quais quatro dessas sete faces apresentam o número 6 e três faces apresentam o número 5 são possíveis para a pilha em questão (estamos usando a decomposição 39 = 4 × 6 + 3 × 5) e são mostradas nas figuras a seguir, nas quais os números 6 e 5 aparecem no topo.

[Figura: Duas configurações da pilha de dados mostrando quatro faces com o número 6 e três faces com o número 5, com 6 ou 5 no topo da pilha.]

- Além disso, observe também que 39 = 5 × 6 + 5 + 4. Nesse último caso, cinco das sete faces em consideração receberiam o número 6, uma face o número 5 e uma face o número 4. Isso é possível, como mostrado na figura abaixo, com o 6 no topo da pilha.

[Figura: Configuração da pilha de dados mostrando cinco faces com o número 6, uma face com o número 5 e uma face com o número 4, com o 6 no topo da pilha.]

Portanto, 5 e 6 são os únicos números que podem aparecer no topo da pilha.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2024 AND numero=5
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2024 Q6
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) [Resolução apresentada apenas em forma de tabuleiro preenchido, sem texto corrido na solução oficial.]

Item b) Abaixo apresentamos alguns preenchimentos possíveis.

[Figura: Tabelas 3x4 mostrando alguns preenchimentos possíveis com os números de 1 a 12, consistentes com a posição do 5 dada no enunciado e com uma ordenação linha-coluna crescente.]

Item c) O número x pode estar em qualquer linha da tabela inicial, antes da ordenação linha-coluna. Após a ordenação nas linhas, o número x passa a ocupar a terceira posição na linha em que está, ficando na terceira coluna junto com outros dois números, sendo um deles menor do que x, digamos a, e o outro maior do que x.

Na primeira coluna ficaram três números: um menor do que a, um menor do que x e um terceiro número que pode ser maior ou menor do que x. O mesmo ocorre na segunda coluna. Assim, após ordenação nas colunas, com certeza os dois primeiros números da primeira coluna são menores do que x, e os dois primeiros números da segunda coluna também são menores do que x. Como a < x, concluímos que x é o maior número na região cinza da tabela.

Item d) As casas em que o 5 pode ficar após uma ordenação linha-coluna são as casas pintadas de vermelho.

- No canto superior esquerdo da tabela sempre ficará o número 1 e no canto inferior direito da tabela sempre ficará o número 12;

- O maior número que pode ficar ao lado do 1 é o 4; isso ocorre quando 1, 2 e 3 estão inicialmente em linhas diferentes. Assim, o 5 não pode aparecer na 1ª linha, 2ª coluna.

- O menor número que pode ficar ao lado do 12 é o 9; isso ocorre quando 10, 11 e 12 estão inicialmente em linhas diferentes. Logo, o 5 não pode aparecer na 2ª linha, 4ª coluna.

- O maior número que pode ficar abaixo do 1 é o 5; isso ocorre quando 1, 2, 3 e 4 estão inicialmente na mesma linha;

- O menor número que pode ficar acima do 12 é o 8, isso ocorre quando 9, 10, 11 e 12 estão inicialmente na mesma linha; desse modo, o 5 não pode aparecer acima do 12.

- De acordo com o item c), o menor número que pode ficar na casa destacada em amarelo é o 6. De fato, suponha que fosse o 5. Pelo item c), as demais casas cinzas deveriam abrigar cinco números menores do que 5, o que é impossível. Logo, o 5 não pode ocupar a casa na 2ª linha e 3ª coluna e, por um argumento análogo, nenhum número menor do que 5 pode ocupar essa casa. O mesmo argumento mostra que o menor número que pode ficar na casa destacada em laranja também é o 6 e o 5 não pode ocupar essa posição também.

As tabelas abaixo ilustram os cinco casos em que o 5 pode aparecer no final do ordenamento por linha e coluna.

[Figura: Cinco tabelas 3x4 mostrando os casos possíveis, com as casas em vermelho indicando as posições onde o número 5 pode ficar após a ordenação linha-coluna crescente.]$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2024 AND numero=6
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2025 Q1
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) A figura de Ana é uma estrela, pois ela mentiu apenas sobre a cor. Logo, Ana pode ter feito uma das escolhas: estrela branca ou estrela cinza.

Item b) A figura de Carla não é um círculo, nem tem a cor branca; portanto, ela pode ter escolhido o triângulo cinza ou o triângulo preto ou a estrela cinza ou a estrela preta.

Item c) Ana escolheu uma estrela (item a)); logo, Carla obrigatoriamente escolheu um triângulo (item b)), consequentemente a figura da Bia só pode ser um círculo. Ainda não sabemos as cores.

Como a figura da Bia é cinza (segundo item do enunciado), então ela escolheu o círculo cinza. Logo, o triângulo da Carla não pode ser cinza; assim, Carla escolheu o triângulo preto e como a estrela da Ana não é cinza, então só pode ser branca.

[Tabela: Forma e Cor de cada uma — Ana: Estrela Branca; Bia: Círculo Cinza; Carla: Triângulo Preta]

Outra solução:

Na tabela abaixo, com todos os formatos e cores das figuras, estão indicados os nomes das possíveis donas de algumas figuras.

[Tabela: linhas Triângulo, Círculo, Estrela; colunas Preto, Cinza, Branco — célula Triângulo/Preto: Carla; célula Triângulo/Cinza: Carla; célula Círculo/Cinza: Bia; célula Estrela/Preto: Carla; célula Estrela/Cinza: Ana/Bia/Carla; célula Estrela/Branco: Ana]

Para que Ana, Bia e Carla tenham figuras de cores e formatos diferentes, cada linha e cada coluna da tabela deve apresentar exatamente um nome correto para a dona de alguma figura.

Portanto, Ana tem a estrela branca, Bia tem o círculo cinza e Carla tem o triângulo preto.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2025 AND numero=1
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2025 Q2
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Observe que cada vez que descemos uma casa, o número escrito aumenta 20. Toda vez que vamos uma casa para esquerda, o número escrito diminui em 1. Portanto, x = 17 + 20 + 20 – 1 – 1 = 55.

Item b) Temos que z = y + 20 + 1 = y + 21 e que w = y + 20 + 20 – 1 – 1 – 1 – 1 – 1 = y + 35. Se d é divisor de y, y + 21 e y + 35, então d é divisor de 21 e de 35. Como mdc(21,35) = 7, d é divisor de 7. Sabendo que d é maior do que 1, concluímos que d = 7.

Item c) Como y está na primeira linha, os únicos múltiplos de 7 que estão entre 1 e 20 são: 7 e 14. Note que temos os seguintes valores para as triplas de letras (y,z,w) = (7, 28, 42) ou (y,z,w) = (14, 35, 49).$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2025 AND numero=2
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2025 Q3
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Na Figura 1, temos o quadrado dividido em cinco retângulos cujos lados medem 10 cm e 2 cm. A tira formada por esses retângulos mostrada na Figura 2 é um retângulo cujos lados medem 50 cm e 2 cm; portanto, o perímetro do retângulo formado será dado por 50 + 50 + 2 + 2, ou seja, 104 cm.

Item b) Vamos chamar de L o comprimento do lado do quadrado da Figura 3.

A medida da largura da tira é um terço do comprimento desse lado (L/3), que também é a medida dos lados iguais dos triângulos isósceles; os lados horizontais dos trapézios que foram recortados medem L e 2L/3.

Usando as medidas das peças, anotadas na figura acima, dado que o perímetro da tira é 40 cm, temos que: 40 = 2.(L/3) + 2.(L/3 + 2L/3 + 2L), ou seja, 6L + 2L/3 = 40, daí 20L/3 = 40 e L = 6.

Consequentemente, a área do segundo quadrado cortado por Joana é 36 cm².

Item c) Recuperando o quadriculado utilizado por Joana para recortar as peças Figura 5, observamos que as peças retangulares da tira têm comprimentos 4 cm ou 2 cm; as larguras das tiras retangulares são 2 cm e os lados iguais dos triângulos medem 1 cm.

Observe que o comprimento da Figura 6 é 9 cm e sua largura, 2 cm, logo, a área da Figura 6 é 18 cm². Joana usou todas as peças da decomposição do quadrado para formar a tira, portanto, ambas as figuras têm a mesma área; logo, a área do quadrado da Figura 5 é 18 cm².

Outra solução: Podemos também calcular a área das figuras 5 e 6 observando, no quadriculado que aparece sobre a Figura 5, que as regiões retangulares são equivalentes a 12 quadrados do quadriculado e cada par de triângulos equivale a um quadradinho do quadriculado; portanto, temos uma decomposição da Figura 5 que é equivalente a 18 quadrados do quadriculado, e a área da Figura 5 é 18 cm².

Observamos que, nesse item, temos uma situação especial na qual o comprimento da diagonal do quadrado é um número inteiro, o que nos permite calcular a área do quadrado sem conhecer o comprimento do seu lado.

Item d) Com as informações do item c), temos que o perímetro da Figura 6 é 2.2 + 2.(4 + 2 + 3) = 4 + 18 = 22 cm.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2025 AND numero=3
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2025 Q4
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Seja A12D esse número. Uma das condições para que se forme um número dourado é A x D = 12.

Mas 12 pode ser escrito como 2 x 6 ou 3 x 4 devido às condições do problema, ou seja, com A e D algarismos entre 1 e 9. Os algarismos de um número dourado devem ser distintos e, além disso, A < D; portanto, a única opção válida é A = 3 e D = 4. O número procurado é 3124.

Item b) Vamos chamar de ABCD o menor número dourado. Vamos escolher o menor valor possível para A.

Não podemos ter A = 1, pois A x 1 = A e não teríamos como obter os dois algarismos não nulos B e C. Se A = 2, então A x D deverá gerar o menor número possível de dois algarismos, sem o zero e sem repetir algarismos.

2 x 1 = 2, 2 x 2 = 4, 2 x 3 = 6, 2 x 4 = 8 não servem pois são números de apenas 1 algarismo.

Em 2 x 5 = 10 aparece o zero, em 2 x 6 = 12 o 2 aparece repetido. No caso 2 x 7 = 14 todas as condições do enunciado ficam verificadas e o menor número dourado é 2147.

Como curiosidade, o maior número dourado é 8729.

Item c) Vamos supor que o algarismo das unidades é 5; portanto, nosso número teria a forma ABC5 e teríamos ainda que A x 5 = BC, em outras palavras, o número BC seria múltiplo de 5. Todo número múltiplo de 5 termina em 5 ou 0. Como em um número dourado o zero não aparece e os algarismos não se repetem, então não existe um número dourado que tem o algarismo das unidades como 5.

Item d) Não existem números dourados com 5 na casa dos milhares, devido a raciocínio análogo ao item anterior (faz aparecer 0 ou repetir o 5). Também não existem números dourados com algarismo 5 na casa das dezenas, pelos mesmos motivos.

Resta analisar números da forma A5CD. Devemos ter que o número de dois algarismos 5C é igual ao produto A.D. Vamos listar todos os números de dois algarismos da forma 5C e vamos escrever sua fatoração, lembrando que o zero não pode aparecer e que não podem aparecer algarismos repetidos (assim, excluímos 50 e 55). Devemos encontrar A e D como números entre 1 e 9, com A < D.

51 = 3.17 e 17 é um número primo com dois algarismos.

52 = 2.2.13 e 13 é um número primo com dois algarismos.

53 é um número primo de dois algarismos.

54 = 2.3.3.3 e podemos escrever 54 como o produto de dois números de um algarismo como 54 = 6.9. Temos aqui o número dourado 6549.

56 = 2.2.2.7 e podemos escrever 56 como o produto de dois números de um algarismo como 56 = 8.7. Temos aqui o número dourado 7568.

57 = 3.19 e 19 é um número primo com dois algarismos.

58 = 2.29 e 29 é um número primo com dois algarismos.

59 é um número primo.

Conclusão: os números dourados com o algarismo 5 na centena são 6549 e 7568.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2025 AND numero=4
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2025 Q5
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Uma possível cobertura está ilustrada abaixo:

[Figura: tabuleiro da Figura 1 completamente coberto por quatro peças, sem sobreposição]

Item b) Há duas possíveis coberturas, ilustradas abaixo:

[Figura: duas ilustrações mostrando duas formas diferentes de cobrir o tabuleiro da Figura 2 com quatro peças]

Item c) Observe que qualquer peça colocada no tabuleiro ocupa pelo menos uma das quatro casas marcadas com a imagem da OBMEP. Porém, devemos tentar colocar cinco peças. Mas, quatro peças já cobrem as quatro casas marcadas e, assim, não é possível usar cinco peças. De fato, vejamos com mais detalhe por que isso ocorre:

Se uma peça cobrir a casa superior direita, ela também cobrirá pelo menos uma casa com o logo (nesse caso, a casa marcada em vermelho):

[Figura: tabuleiro mostrando uma peça cobrindo a casa superior direita e, junto com ela, outra casa marcada em vermelho que também contém o logo da OBMEP]

Isso acontecerá com qualquer outra casa do tabuleiro, ou seja, uma peça colocada sempre cobrirá ao menos uma casa com o logo da OBMEP. Por exemplo, observe que para cobrir a segunda casa da primeira linha, independentemente de como colocarmos a peça cinza, sempre uma casa com o logo da OBMEP será também coberta por ela:

[Figura: tabuleiro mostrando, para a segunda casa da primeira linha, as diferentes posições possíveis de uma peça cinza, cada uma cobrindo também uma casa com o logo da OBMEP]

Para as demais casas o mesmo argumento se aplica.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2025 AND numero=5
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2025 Q6
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Uma possibilidade: a peça 6 pula sobre as peças 3 e 5 e sobrepõe-se à peça 2.

Outra possibilidade: a peça 2 pula sobre as peças 3 e 5 e sobrepõe-se à peça 6.

[Figura: representação das duas possibilidades para o segundo movimento, mostrando a posição final das peças em cada caso]

Item b) Há muitas possibilidades, a tabela abaixo apresenta todos os movimentos possíveis:

[Tabela: tabela completa com todos os movimentos possíveis a partir da posição com seis peças, indicando para cada movimento a peça que pulou, sobre quais peças ela pulou, sobre qual peça ela parou (sobrepondo-se) e a representação da posição resultante das peças]

Item c) Vamos assumir que temos uma quantidade par 2n de peças sozinhas, lado a lado, sem nenhuma peça sobre outra. Vimos no item b) que se 2n = 8, podemos terminar a brincadeira sem peças sozinhas. Vamos ver o que acontece com um número de peças par, maior do que 8.

O primeiro movimento pode ser sempre "a quarta peça pula sobre a segunda e terceira peça e sobrepõe-se à primeira peça". Esse movimento faz com que 2 peças fiquem sobrepostas na primeira posição, e as demais 2n − 2 peças fiquem ao lado dessas 2 peças sobrepostas, sozinhas, lado a lado, sem nenhuma peça sobre outra.

Considerando somente as 2n − 2 peças sozinhas, lado a lado, sem nenhuma peça sobre outra, o segundo movimento pode ser o mesmo que o anterior nessas peças: "a quarta peça pula sobre a segunda e terceira peça e sobrepõe-se à primeira peça". Teremos então 4 peças sobrepostas nas 2 primeiras posições, e as demais 2n − 4 peças lado a lado, sem nenhuma peça sobre outra.

Se continuarmos fazendo sempre assim, considerando somente as peças que ficaram sozinhas, após n − 3 movimentos teremos 2n − 8 peças sobrepostas nas n − 3 primeiras posições, e as demais 8 peças sozinhas, lado a lado, sem nenhuma peça sobre outra.

Agora basta fazer os movimentos do item b) para que essas 8 peças fiquem todas sobrepostas, não sobrando peças sozinhas.

Resumidamente, a brincadeira termina do jeito correto quando o número inicial de peças é k = 2 x 4 = 8. Para resolver um problema com 2k+2 peças, podemos começar jogando a peça 4 para cima da peça 1 e a partir daí resolver um problema com 2k peças. Portanto, se o problema tem solução para 2k peças, então ele também terá solução para 2k+2 peças, portanto, por indução finita, segue o resultado.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_2' AND fase=2 AND ano=2025 AND numero=6
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;
