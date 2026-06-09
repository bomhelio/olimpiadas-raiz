-- =============================================================================
-- Migration 027 — OBMEP Nível 1 · 2ª Fase · 2021–2025
-- Questões abertas (texto) + soluções (texto)
-- Imagens não cadastradas (referenciadas no enunciado onde aplicável)
-- =============================================================================
-- DOWN: DELETE FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano BETWEEN 2021 AND 2025;
-- =============================================================================

-- ─── QUESTÕES ─────────────────────────────────────────────────────────────────

INSERT INTO questao (olimpiada, nivel, fase, ano, numero, enunciado, tipo, publico_alvo, topico, tem_resolucao_texto, status_cadastro)
VALUES

-- 2021 -------------------------------------------------------------------------
('obmep','nivel_1',2,2021,1,
$e$Mariana tem um jogo de 15 pinos, sendo 5 pretos, 5 brancos e 5 cinzas. Pinos de mesma cor valem o mesmo número de pontos. A pontuação obtida em uma jogada é a soma dos pontos correspondentes aos pinos derrubados. Em uma jogada, Mariana fez 10 pontos ao derrubar dois pinos pretos. Em outra jogada, ela fez 12 pontos ao derrubar um pino preto e um branco. Numa terceira jogada, Mariana fez 55 pontos ao derrubar três pinos pretos, um branco e três cinzas.

a) Quantos pontos vale cada pino preto?
b) Quantos pontos vale cada pino cinza?
c) Mariana fez 42 pontos em uma jogada ao derrubar pelo menos um pino de cada cor. Quantos pinos de cada cor ela derrubou?$e$,
'aberta','EFAF','Aritmética','sim','publicado'),

('obmep','nivel_1',2,2021,2,
$e$Em uma fila há 100 pessoas. A primeira e a terceira posições da fila são ocupadas por homens. A cada cinco posições consecutivas, há três mulheres e dois homens. Por exemplo, nas posições 13, 14, 15, 16 e 17, há três mulheres e dois homens.

a) Quantas mulheres há na fila?
b) Complete a tabela abaixo escrevendo homem ou mulher em cada posição, de acordo com o enunciado. [Tabela com posições 1 a 10; posição 1: homem, posição 3: homem]
c) Complete a tabela abaixo escrevendo homem ou mulher em cada posição, de acordo com o enunciado. [Tabela com posições 98, 99, 100]$e$,
'aberta','EFAF','Combinatória','sim','publicado'),

('obmep','nivel_1',2,2021,3,
$e$Janaína desenha quadrados formados por quadrados menores, cujos lados têm medidas inteiras. Por exemplo, a figura mostra como Janaína desenhou um quadrado de lado 4 formado por dez quadrados, sendo dois de lado 2 e oito de lado 1.

a) Mostre como Janaína pode desenhar um quadrado de lado 3 formado com a menor quantidade possível de quadrados menores com lados de medidas inteiras.
b) Janaína quer desenhar um quadrado grande formado por um quadrado de lado 3, alguns quadrados de lado 2 e a menor quantidade possível de quadrados de lado 1. Mostre, no quadriculado ao lado, como Janaína pode fazer esse desenho.
c) Janaína quer desenhar um quadrado de menor lado possível formado por 13 quadrados de lado 1 e por outros quadrados maiores com lados de medidas inteiras. Mostre, no quadriculado ao lado, como Janaína pode fazer esse desenho.$e$,
'aberta','EFAF','Geometria','sim','publicado'),

('obmep','nivel_1',2,2021,4,
$e$Joãozinho fez todas as divisões possíveis com dois números diferentes pertencentes ao conjunto {1, 2, 3, 4, 5, 6, 7, 8, 9}. Por exemplo, com os números 2 e 5, ele fez as seguintes divisões: 2/5 (obteve como resultado 0,4) e 5/2 (obteve como resultado 2,5).

a) Em quantas divisões Joãozinho obteve como resultado um número inteiro?
b) Em quantas divisões Joãozinho obteve como resultado um número maior do que 0,5?
c) Quantos resultados diferentes foram obtidos por Joãozinho?$e$,
'aberta','EFAF','Aritmética','sim','publicado'),

('obmep','nivel_1',2,2021,5,
$e$Maria pinta, em seu caderno, figuras formadas por trapézios e hexágonos. Cada hexágono pode ser pintado de azul, bege ou cinza, e cada trapézio, de azul ou preto. Polígonos com um lado em comum não podem ter a mesma cor. A figura ao lado é um exemplo de uma pintura feita por Maria.

a) De quantas maneiras Maria pode pintar a figura abaixo? [Figura 1: um hexágono com um trapézio adjacente]
b) De quantas maneiras Maria pode pintar a figura abaixo? [Figura 2: um hexágono com três trapézios adjacentes]
c) De quantas maneiras Maria pode pintar a figura abaixo? [Figura 3: dois hexágonos compartilhando três trapézios]$e$,
'aberta','EFAF','Combinatória','sim','publicado'),

('obmep','nivel_1',2,2021,6,
$e$Um dia é fantástico quando sua data, escrita na forma DD/MM/AA, contém todos os algarismos de 0 a 5. Por exemplo, o dia 12 de abril de 2053 será fantástico, pois sua data, 12/04/53, contém todos os algarismos de 0 a 5. Já o dia seguinte não será fantástico, pois sua data, 13/04/53, não contém o algarismo 2.

a) Qual será o último dia fantástico do ano de 2054?
b) Qual foi o primeiro dia fantástico depois de primeiro de janeiro de 2001?
c) Entre 2001 e 2100, quantos anos têm pelo menos um dia fantástico?$e$,
'aberta','EFAF','Combinatória','sim','publicado'),

-- 2022 -------------------------------------------------------------------------
('obmep','nivel_1',2,2022,1,
$e$No tabuleiro, cada letra da palavra OBMEP representa um número inteiro de 1 a 5. Letras diferentes representam números diferentes. Além disso, cada número escrito na lateral do tabuleiro é a soma dos valores das letras da linha horizontal correspondente.

Tabuleiro (letras por linha e soma lateral):
Linha 1: O O O O = 4
Linha 2: B B O B = 7
Linha 3: M E B O = 10
Linha 4: E P O B = 12

a) Encontre o valor da letra O.
b) Encontre o valor da letra B.
c) Encontre o valor da letra M.
d) Qual é a letra que representa o número 5?$e$,
'aberta','EFAF','Aritmética','sim','publicado'),

('obmep','nivel_1',2,2022,2,
$e$Uma régua de 30 cm é graduada em milímetros com marcações grandes, médias e pequenas, como indicado na figura.

a) Qual é a distância, em milímetros, entre a 11ª marcação pequena e a 3ª marcação média?
b) Quantas marcações pequenas tem a régua inteira?
c) Qual é a marcação que está a 73 milímetros de distância da 215ª marcação pequena? Justifique sua resposta.$e$,
'aberta','EFAF','Aritmética','sim','publicado'),

('obmep','nivel_1',2,2022,3,
$e$Alice, Beatriz e Cláudia moram em uma rua de 200 metros de comprimento. Alice mora no início da rua, Beatriz a 80 metros de Alice e Cláudia no final da rua. Elas se encontram de vez em quando, sempre partindo de suas casas.

a) Qual é a soma das distâncias que Alice e Beatriz percorrem quando elas se reúnem na casa de Cláudia?
b) Se Alice, Beatriz e Cláudia se encontrarem na rua a 150 metros do seu início, qual será a soma das distâncias que elas percorrerão?
c) As três amigas decidem se encontrar em algum ponto da rua tal que a soma das distâncias percorridas por elas seja a menor possível. A quantos metros do início da rua elas devem se encontrar?$e$,
'aberta','EFAF','Aritmética','sim','publicado'),

('obmep','nivel_1',2,2022,4,
$e$Janaína cortou uma cartolina retangular de 16 cm de comprimento e 6 cm de largura em quatro triângulos retângulos iguais, conforme mostra a figura.

a) Qual é a área de cada um desses triângulos?
b) Em seguida, Janaína usou os quatro triângulos para montar um quadrado com um buraco no seu interior, conforme mostrado na figura. Qual é a área do buraco?
c) Quanto mede o lado do quadrado que Janaína montou?$e$,
'aberta','EFAF','Geometria','sim','publicado'),

('obmep','nivel_1',2,2022,5,
$e$Marco preenche quadriculados 3×3 com os números 1, 2, 3, 4, 5, 6, 7, 8 e 9, sem repetir nenhum deles.

a) Marco preencheu um quadriculado de forma que os quatro números escritos no quadrado 2×2 destacado têm a menor soma possível. Qual é a soma dos cinco números escritos fora desse quadrado?
b) Marco conseguiu preencher outro quadriculado de modo que a soma dos números escritos em um dos quadrados 2×2 destacados é 21 e, no outro, 26. Qual é o menor número que Marco pode ter escrito na casa central do quadriculado?
c) Marco conseguiu preencher um terceiro quadriculado de modo que as somas dos números escritos nos quatro quadrados 2×2 destacados são 18, 25, 21 e 24. Além disso, a soma dos números escritos nos quatro cantos do quadriculado 3×3 é 16. Qual foi o número que Marco escreveu na casa central?$e$,
'aberta','EFAF','Combinatória','sim','publicado'),

('obmep','nivel_1',2,2022,6,
$e$Uma abelha está em uma colmeia formada por casinhas coloridas, conforme o padrão mostrado na Figura 1. A partir de qualquer uma das casinhas, ela só pode se mover para outra casinha vizinha, com um dos passos indicados na Figura 2 (ou para cima, ou para baixo à esquerda, ou para baixo à direita).

a) Desenhe na figura abaixo um caminho de três passos de tal forma que a abelha retorne à casinha inicial, indicada na figura.
b) Saindo de uma casinha branca, a abelha fez um passeio de oito passos pela colmeia. Qual é a cor da casinha onde ela parou? Justifique sua resposta.
c) Explique por que, saindo de uma casinha branca, é impossível que a abelha faça um passeio pela colmeia de forma a visitar cada casinha uma única vez.$e$,
'aberta','EFAF','Combinatória','sim','publicado'),

-- 2023 -------------------------------------------------------------------------
('obmep','nivel_1',2,2023,1,
$e$A figura mostra os primeiros vagões do trenzinho da OBMEP. O primeiro vagão é branco, seguido de dois verdes, depois outro branco, seguido de dois verdes, e assim por diante. Além disso, em cada vagão de número par há uma bandeirinha. [Vagões numerados de 1 a 8 mostrados na figura]

a) Qual é o número do primeiro vagão branco com bandeirinha após o vagão de número 8?
b) Qual é a cor do vagão de número 2023?
c) Quantas bandeirinhas há em vagões brancos até o vagão de número 2023?$e$,
'aberta','EFAF','Aritmética','sim','publicado'),

('obmep','nivel_1',2,2023,2,
$e$Em um tabuleiro formado por sete hexágonos de lado 1 cm, podemos fazer figuras diferentes pintando de cinza um ou mais desses hexágonos. Dizemos que o perímetro de uma dessas figuras é o comprimento total de seu contorno. Por exemplo, as duas figuras ao lado possuem perímetros iguais a 16 cm.

a) Em cada um dos tabuleiros abaixo, pinte três hexágonos formando figuras com os perímetros indicados. [Perímetro 12 cm e Perímetro 18 cm]
b) Pinte quatro hexágonos no tabuleiro abaixo formando uma figura que tenha o maior perímetro possível.
c) Explique por que qualquer figura formada por hexágonos pintados tem perímetro par.$e$,
'aberta','EFAF','Geometria','sim','publicado'),

('obmep','nivel_1',2,2023,3,
$e$Aninha tem nove cartões numerados de 1 a 9. Ela forma sequências com esses cartões colocando alguns deles lado a lado. Uma sequência de Aninha é chamada de especial quando, para quaisquer dois cartões vizinhos, o número de um deles é múltiplo do número do outro. [Exemplos: 3 4 9 2 é especial; 3 4 9 2 não é especial; 2 6 3 é especial; 6 2 4 8 1 5 não é especial]

a) Apresente uma sequência especial com sete cartões começando com 6 e 2.
b) Apresente uma sequência especial com oito cartões.
c) Apresente uma sequência especial com três cartões em que apareçam os cartões 5 e 7.
d) Explique por que é impossível formar uma sequência especial com os nove cartões.$e$,
'aberta','EFAF','Números','sim','publicado'),

('obmep','nivel_1',2,2023,4,
$e$Carlinhos fez todas as adições possíveis com três parcelas diferentes, em que cada parcela é um número de três algarismos iguais, sempre colocando as parcelas em ordem crescente. Por exemplo, 222 + 555 + 888 e 444 + 777 + 888 foram adições feitas por Carlinhos. Ele não fez a adição 222 + 888 + 555, pois as parcelas não estão em ordem crescente, nem a adição 444 + 444 + 777, pois nela existem parcelas iguais.

a) Escreva uma adição que Carlinhos fez em que o resultado é 1332.
b) Escreva todas as adições que Carlinhos fez em que o resultado é 2109.
c) Explique por que 2109 é o único resultado das adições que Carlinhos fez em que o algarismo das dezenas é diferente do algarismo das centenas.$e$,
'aberta','EFAF','Aritmética','sim','publicado'),

('obmep','nivel_1',2,2023,5,
$e$A formiguinha da OBMEP caminha do ponto A até o ponto B ao longo dos lados dos 10 quadradinhos da figura abaixo. Ela só pode andar para a direita, para cima ou para baixo, sem passar por onde já passou. Para representar um caminho, ela inventou o seguinte código: para cada quadradinho, da esquerda para a direita, se ela passar por baixo, escreve 0 e se passar por cima, escreve 1. Na figura a seguir observamos o caminho representado por 0010100011.

a) Desenhe o caminho representado por 1001001100.
b) De quantas maneiras diferentes a formiguinha pode ir de A até B?
c) De quantas maneiras diferentes a formiguinha pode ir de A até B passando pelo ponto C?$e$,
'aberta','EFAF','Combinatória','sim','publicado'),

('obmep','nivel_1',2,2023,6,
$e$Um tabuleiro circular é dividido em seis setores iguais pintados alternadamente de cinza e branco. Inicialmente há uma bolinha em cada setor. As bolinhas são movimentadas em etapas obedecendo as seguintes regras: escolhemos duas bolinhas quaisquer; em seguida deslocamos uma dessas bolinhas para o setor vizinho no sentido horário e, simultaneamente, deslocamos a outra bolinha para o setor vizinho no sentido anti-horário.

a) Indique na figura abaixo como chegar ao tabuleiro final em três etapas.
b) Explique por que, partindo do tabuleiro inicial e após qualquer número de etapas, a quantidade total de bolinhas em todos os setores brancos é sempre ímpar.
c) Explique por que é impossível, partindo do tabuleiro inicial, colocar todas as bolinhas em um mesmo setor.$e$,
'aberta','EFAF','Combinatória','sim','publicado'),

-- 2024 -------------------------------------------------------------------------
('obmep','nivel_1',2,2024,1,
$e$Cláudia disse para Marco: "Escolha um planeta da figura ao lado. Vou fazer quatro perguntas e descobrir o planeta que você escolheu. Você deve responder SIM ou NÃO a cada pergunta, na ordem em que eu perguntar. Você pode mentir em todas as respostas ou falar a verdade em todas as respostas. As perguntas são:
1. O nome do planeta que você escolheu tem 5 letras?
2. O nome do planeta que você escolheu tem a letra F?
3. O nome do planeta que você escolheu tem as letras M ou S?
4. O nome do planeta que você escolheu tem a letra N?"
[Planetas disponíveis: Mercúrio, Terra, Júpiter, Saturno, Urano, Netuno, Vênus, Marte]

a) Se Marco escolher Saturno e decidir sempre mentir, quais respostas ele deve dar? (Responda usando SIM ou NÃO).
b) Em qual pergunta é possível descobrir se Marco decidiu sempre mentir ou sempre falar a verdade?
c) Se Marco respondeu NÃO, SIM, NÃO, SIM, nessa ordem, qual planeta ele escolheu?$e$,
'aberta','EFAF','Lógica','sim','publicado'),

('obmep','nivel_1',2,2024,2,
$e$Ana e Pedro cortam pedaços de papel que estão em uma cesta. Sempre que Ana pega um pedaço, corta em cinco pedaços e devolve todos eles para a cesta. Sempre que Pedro pega um pedaço, corta em três pedaços e devolve todos eles para a cesta. Inicialmente há três pedaços de papel na cesta.

a) Quantos pedaços de papel ficarão na cesta depois de Ana e Pedro pegarem um pedaço cada um e devolverem os pedaços cortados para a cesta?
b) Descreva uma maneira de Ana e Pedro pegarem, cortarem e devolverem todos os pedaços de papel da cesta para que, a partir dos três pedaços iniciais, a cesta fique com 11 pedaços.
c) Explique por que, a partir dos três pedaços iniciais, a cesta nunca ficará com 2024 pedaços após Ana e Pedro devolverem todos os pedaços cortados para a cesta.$e$,
'aberta','EFAF','Aritmética','sim','publicado'),

('obmep','nivel_1',2,2024,3,
$e$A figura ao lado é formada por quadrados e triângulos. O lado do quadrado vermelho mede 2 cm. Os demais quadrados e triângulos têm lados paralelos a um dos lados ou a uma das diagonais do quadrado vermelho. [Figura com regiões coloridas: amarela, branca e cinza]

a) Qual é a área da região amarela?
b) Qual é a área da região branca?
c) Qual é a área da região cinza?$e$,
'aberta','EFAF','Geometria','sim','publicado'),

('obmep','nivel_1',2,2024,4,
$e$Os círculos do diagrama devem ser preenchidos com números naturais diferentes. Dois números escritos em círculos ligados por um segmento devem ter um divisor comum maior do que 1. Por exemplo, 8 e 15 nunca vão ser escritos em círculos ligados por um segmento. O conjunto dos números naturais é {1, 2, 3, ...}. [Diagrama com 9 círculos ligados por segmentos; exemplo de preenchimento correto mostrado com: 13, 26, 4, 2, 6, 3, 8, 9, 10, 7, 9, 2]

a) Faça um preenchimento para os círculos vazios abaixo.
b) Preencha os círculos abaixo de modo que o maior número escrito seja 12.
c) Explique por que é impossível preencher os círculos de modo que o maior número escrito seja menor do que 12.$e$,
'aberta','EFAF','Números','sim','publicado'),

('obmep','nivel_1',2,2024,5,
$e$Janaína tem vários dados idênticos com faces numeradas de 1 a 6. Nesses dados, a soma dos números em faces opostas é sempre igual a 7. Ela cola alguns desses dados e coloca adesivos nas faces não coladas, inclusive nas faces que estão em contato com a mesa.

a) Qual é a menor soma possível para todos os números que foram cobertos por adesivos nos dois dados colados abaixo?
b) Janaína colou vários dados como mostrado abaixo. [Figura mostra colagem com 16 dados em duas camadas: 4 no patamar superior, 4 abaixo deles e 8 ao lado] Quantos adesivos ela usou?
c) Na colagem de dados do item b), qual é a menor soma possível para todos os números que foram cobertos por adesivos?$e$,
'aberta','EFAF','Combinatória','sim','publicado'),

('obmep','nivel_1',2,2024,6,
$e$Uma tabela 4×4, preenchida com os números 0 e 1, é equilibrada quando, somando os números em cada linha, obtemos todos os inteiros de 1 a 4, o mesmo ocorrendo com as somas dos números de cada coluna. Por exemplo, a tabela ao lado é equilibrada. [Exemplo: linhas com somas 4, 3, 1, 2 e colunas com somas 4, 3, 1, 2]

a) Preencha as tabelas abaixo de modo que elas sejam equilibradas, com as linhas e colunas tendo as somas indicadas.
b) Quantas são as tabelas equilibradas com a soma de cada linha indicada abaixo? [Somas das linhas: 4, 3, 2, 1]
c) Quantas são as tabelas equilibradas?$e$,
'aberta','EFAF','Combinatória','sim','publicado'),

-- 2025 -------------------------------------------------------------------------
('obmep','nivel_1',2,2025,1,
$e$Em cada uma das figuras abaixo, os círculos devem ser preenchidos com os números de 1 a 8, um número em cada círculo, sem repetição, de modo que as igualdades (na horizontal e na vertical) sejam verdadeiras. [Formato: A + B + C - D = E (horizontal) e F - G + H = I (vertical), com algumas posições já preenchidas]

a) Termine de preencher os círculos da figura abaixo. [Figura com 4 e 8 já preenchidos em posições específicas]
b) Termine de preencher os círculos de cada uma das figuras abaixo. [Primeira figura com 6 preenchido; segunda figura com 5 e 8 preenchidos; terceira figura com 4 e 7 preenchidos]
c) Explique por que não é possível terminar de preencher os círculos da figura abaixo. [Figura com alguns círculos já preenchidos]$e$,
'aberta','EFAF','Aritmética','sim','publicado'),

('obmep','nivel_1',2,2025,2,
$e$Uma academia possui vários equipamentos de ginástica para seus atletas. Uma pesquisa feita nessa academia mostrou que somente 8 em cada 14 atletas utilizam a bicicleta (8/14 do total de atletas). A pesquisa mostrou também que somente 20 em cada 42 atletas utilizam a esteira (20/42 do total de atletas).

a) Qual é a fração do total de atletas dessa academia que não utiliza a bicicleta? E a fração do total de atletas que não utiliza a esteira?
b) Explique por que nessa academia há atletas que utilizam bicicleta e também esteira.
c) A pesquisa mostrou que todos os atletas que utilizam a esteira também utilizam a bicicleta. Ela mostrou ainda que somente 10 atletas utilizam a bicicleta, mas não a esteira. Quantos atletas não utilizam a bicicleta?$e$,
'aberta','EFAF','Aritmética','sim','publicado'),

('obmep','nivel_1',2,2025,3,
$e$Ana, Bia e Carla escolheram, cada uma delas, uma figura favorita dentre as que estão ao lado [nove figuras: triângulo preto, triângulo cinza, triângulo branco, círculo preto, círculo cinza, círculo branco, estrela preta, estrela cinza, estrela branca]:
• Ana disse que a sua figura é uma estrela preta, mas mentiu apenas sobre a cor;
• Bia disse que a sua figura é um triângulo cinza, mas mentiu apenas sobre o formato;
• Carla disse que a sua figura é um círculo branco, mas mentiu sobre a cor e o formato.

a) Quais das nove figuras podem ser a favorita de Ana?
b) Quais das nove figuras podem ser a favorita de Carla?
c) Se Ana, Bia e Carla têm figuras de formatos e cores diferentes, qual é a figura favorita de cada uma delas? Justifique sua resposta.$e$,
'aberta','EFAF','Lógica','sim','publicado'),

('obmep','nivel_1',2,2025,4,
$e$A professora Laura escreve números do lado externo de um tabuleiro 3×3, um número para cada linha e um número para cada coluna. Ela pede que os alunos preencham cada quadradinho do tabuleiro com a soma do valor de sua linha com o de sua coluna. A figura ao lado mostra um exemplo.

a) Preencha o tabuleiro abaixo como a professora Laura pediu. [Valores externos: linhas 9, 15, 19; colunas 3, 8, 10]
b) Um aluno preencheu cinco quadradinhos do tabuleiro e apagou os números externos. Termine de preencher esse tabuleiro. [Tabuleiro parcialmente preenchido: linha 1 com 18, 20, 11; linha 2 com 15, 17, 8; linha 3 com 17, 19, 10; valores externos apagados; outros quadradinhos mostrados: 12, 4 / 14 / 20, 27 / 18 / 23]
c) Se o tabuleiro abaixo for totalmente preenchido, a soma de todos os nove números será 150. Qual é o número que deverá aparecer no quadradinho cinza? [Tabuleiro com colunas externas 5, 10, 12 e linhas externas 3, 9, 8; quadradinho cinza a ser determinado]$e$,
'aberta','EFAF','Aritmética','sim','publicado'),

('obmep','nivel_1',2,2025,5,
$e$Roberta tem peças em forma de triângulo equilátero de área 1 cm² e peças em forma de losango formado por dois desses triângulos. Essas peças podem ter a cor cinza, branca ou preta.

a) Usando peças de uma única cor, Roberta quer montar dois quadriláteros de formas diferentes, cada um deles com área de 8 cm². Desenhe abaixo como Roberta pode fazer isso.
b) Roberta tentou cobrir um retângulo azul ABCD com suas peças, mas o máximo que conseguiu fazer foi a montagem representada na figura. Qual é a área desse retângulo azul?
c) Roberta quer cobrir o triângulo abaixo usando o menor número possível de peças. Quantos losangos ela deverá usar? Justifique sua resposta.$e$,
'aberta','EFAF','Geometria','sim','publicado'),

('obmep','nivel_1',2,2025,6,
$e$Um tabuleiro 3×20 foi preenchido com os números de 1 a 60, sendo que cada linha foi preenchida da esquerda para a direita com os números em ordem crescente. A primeira linha foi preenchida com os números de 1 a 20, a segunda linha, com os números de 21 a 40 e a terceira linha, com os números de 41 a 60. Cada uma das figuras abaixo mostra um pedaço desse tabuleiro.

a) Qual é o valor de x? [Figura mostra o número 17 e, abaixo e à direita, o valor x]
b) Os números y, z e w na figura a seguir são divisíveis por um mesmo número natural d maior do que 1. Qual é o valor de d?
c) Quais são os possíveis valores de y no item anterior?$e$,
'aberta','EFAF','Aritmética','sim','publicado')

ON CONFLICT ON CONSTRAINT questao_unique DO NOTHING;


-- ─── SOLUÇÕES ─────────────────────────────────────────────────────────────────

-- 2021 Q1
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Como 2 pinos pretos valem 10 pontos e pinos de mesma cor têm o mesmo valor, concluímos que cada pino preto vale 10 ÷ 2 = 5 pontos.

Item b) Para saber quanto vale cada pino cinza, vamos calcular primeiramente quanto vale cada pino branco. Na segunda jogada, Mariana fez 12 pontos ao derrubar um pino branco e um preto. Já vimos que cada pino preto vale 5 pontos; logo, um pino branco vale 12 – 5 = 7 pontos. Na terceira jogada, Mariana fez 55 pontos e foram derrubados 3 pinos pretos (15 pontos), 1 pino branco (7 pontos) e 3 pinos cinzas (55 – 15 – 7 = 33 pontos). Logo, cada pino cinza vale 33 ÷ 3 = 11 pontos.

Item c) O enunciado informa que, na jogada em que Mariana fez 42 pontos, pelo menos um pino de cada cor foi derrubado. A resposta é única: 42 = 2 × 5 + 3 × 7 + 1 × 11 (2 pinos pretos, 3 pinos brancos e 1 pino cinza).

Vejamos como essa resposta foi encontrada e por que não há outra solução:
- Se somente um pino cinza foi derrubado, o total dos valores dos pinos pretos e brancos derrubados deve ser 42 – 11 = 31. Observando a tabuada do 5 e a do 7, vemos que a única maneira de escrever 31 como uma soma de um múltiplo de 5 com um múltiplo de 7 é 31 = 2 × 5 + 3 × 7. Essa é a solução apresentada acima.
- Se dois pinos de cor cinza foram derrubados, o total dos valores dos pinos pretos e brancos derrubados deve ser 42 – 22 = 20. A única forma de escrever 20 como uma soma de um múltiplo de 5 com um múltiplo de 7 é 20 = 4 × 5 + 0 × 7, mas essa solução não serve, pois o enunciado diz que ao menos um pino branco foi derrubado.
- Se três pinos de cor cinza foram derrubados, o total dos valores dos pinos pretos e brancos derrubados deve ser 42 – 33 = 9, e é impossível escrever 9 como soma de um múltiplo de 5 com um múltiplo de 7.
- Se quatro ou mais pinos de cor cinza foram derrubados, o total dos valores dos pinos derrubados ultrapassa 42.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2021 AND numero=1
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2021 Q2
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Dividimos as 100 pessoas em blocos de 5 pessoas cada e obtemos 100 ÷ 5 = 20 blocos. Como em cada bloco há três mulheres, temos um total de 20 × 3 = 60 mulheres na fila.

Item b) Posição 1: homem; Posição 2: mulher; Posição 3: homem; Posição 4: mulher; Posição 5: mulher; Posição 6: homem; Posição 7: mulher; Posição 8: homem; Posição 9: mulher; Posição 10: mulher.

Nas cinco primeiras posições, há dois homens, logo, as posições 2, 4 e 5 devem ser ocupadas por mulheres. Por outro lado, nas posições de 2 a 6, já há três mulheres e, portanto, a posição 6 deve ser ocupada por um homem. Daqui para frente o padrão se repete: a sequência de homens e mulheres é sempre HMHMM, HMHMM, HMHMM...

Item c) Posição 98: homem; Posição 99: mulher; Posição 100: mulher.

A resposta correta é essa porque as últimas posições, de 95 a 100, também apresentam a sequência HMHMM.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2021 AND numero=2
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2021 Q3
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Para que a quantidade de quadrados usados para formar o quadrado de lado 3 seja a menor possível, Janaína deve usar os maiores quadrados possíveis. No caso, ela pode usar somente um quadrado de lado 2, porque, se usar mais um, o quadrado terá que ter lado 4, pelo menos. Ao usar um quadrado de lado 2, o restante deverá ser completado por 9 – 4 = 5 quadrados unitários. Há quatro posições possíveis para esse arranjo (basta girar a figura ou, equivalentemente, deslocar o quadrado de lado 2 para os outros cantos do quadrado de lado 3).

Item b) Se Janaína quer usar um quadrado de lado 3 e quadrados de lado 2 para formar o quadrado grande, então este deverá ter lado de medida 5, pelo menos. Um quadrado de lado 5 corresponde a 25 quadrados unitários. Se, na sua composição, há um quadrado de lado 3, restam 25 – 9 = 16 quadrados unitários. Cada quadrado de lado 2 corresponde a 4 quadrados unitários. É possível usar três quadrados de lado 2, restando completar com quatro quadrados unitários, que é o número mínimo procurado.

Item c) O menor quadrado contendo 13 quadrados unitários é o quadrado de lado 4. Mas, como 16 – 13 = 3, esse quadrado não serve ao propósito de Janaína, porque, para preencher o espaço de 3 quadrados unitários, ela só pode usar 3 quadrados unitários, e, daí, o total deles seria 16, contrariando o enunciado. No quadrado de lado 5, temos 25 – 13 = 12, o que corresponde a três quadrados de lado 2. De fato, Janaína pode desenhar o quadrado de lado 5, o menor possível, com três quadrados de lado 2 e 13 quadrados unitários de várias maneiras diferentes.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2021 AND numero=3
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2021 Q4
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Os números inteiros nas divisões que Joãozinho fez são aqueles em que o dividendo é múltiplo do divisor. Como a e b são dois números diferentes do conjunto {1, 2, 3, 4, 5, 6, 7, 8, 9}, para cada possibilidade de divisor b, devemos contar as possibilidades de dividendo a tais que a seja múltiplo de b e diferente de b. Temos:
- para b = 1: possibilidades para a são {2, 3, 4, 5, 6, 7, 8, 9}, ou seja, 8 possibilidades;
- para b = 2: possibilidades para a são {4, 6, 8}, ou seja, 3 possibilidades;
- para b = 3: possibilidades para a são {6, 9}, ou seja, 2 possibilidades;
- para b = 4: a possibilidade para a é {8}, ou seja, 1 possibilidade;
- para b = 5, 6, 7, 8, 9: não existem possibilidades para a.
Logo, Joãozinho obteve como resultado um número inteiro em 8 + 3 + 2 + 1 = 14 divisões.

Item b) Os números maiores do que 0,5 nas divisões que Joãozinho fez são aqueles em que o dividendo é maior do que a metade do divisor. Temos:
- para b = 1: 8 possibilidades; para b = 2: 7 possibilidades; para b = 3: 7 possibilidades;
- para b = 4: 6 possibilidades; para b = 5: 6 possibilidades; para b = 6: 5 possibilidades;
- para b = 7: 5 possibilidades; para b = 8: 4 possibilidades; para b = 9: 4 possibilidades.
Logo, Joãozinho obteve como resultado um número maior do que 0,5 em 8 + 7 + 7 + 6 + 6 + 5 + 5 + 4 + 4 = 52 divisões.

Item c) Os resultados diferentes nas divisões que Joãozinho fez são aqueles em que o dividendo e o divisor não possuem fatores comuns, ou seja, divisões em que a e b são primos entre si. Temos:
- para b = 1: 8 possibilidades; para b = 2: 5 possibilidades; para b = 3: 6 possibilidades;
- para b = 4: 5 possibilidades; para b = 5: 8 possibilidades; para b = 6: 3 possibilidades;
- para b = 7: 8 possibilidades; para b = 8: 5 possibilidades; para b = 9: 6 possibilidades.
Logo, Joãozinho obteve 8 + 5 + 6 + 5 + 8 + 3 + 8 + 5 + 6 = 54 resultados diferentes nas suas divisões.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2021 AND numero=4
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2021 Q5
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Maria pode pintar de azul tanto o hexágono como o trapézio e, portanto, essa cor deve ser tratada separadamente.
Caso 1: se o hexágono for pintado de azul, então, para não repetir a mesma cor no trapézio, este só pode ser pintado de preto (1 possibilidade).
Caso 2: se o hexágono não for pintado de azul (2 possibilidades), Maria poderá pintar o trapézio de azul ou de preto (2 possibilidades). Pelo princípio multiplicativo da contagem, há 2 × 2 = 4 possibilidades de pinturas.
Juntando os dois casos, vemos que Maria pode pintar a Figura 1 de 1 + 4 = 5 maneiras diferentes.

Item b) Caso 1: se o hexágono for pintado de azul por Maria, todos os três trapézios devem ser pintados de preto (1 possibilidade).
Caso 2: se o hexágono não for pintado de azul (2 possibilidades), cada um dos três trapézios da Figura 2 pode ser pintado de azul ou preto. Pelo princípio multiplicativo, há 2 × 2 × 2 × 2 = 16 possibilidades de pinturas.
Juntando os dois casos, vemos que Maria pode pintar a Figura 2 de 1 + 16 = 17 maneiras diferentes.

Item c) Dividindo em 6 casos segundo as cores dos hexágonos 1 e 2:
- Hexágono 1 azul, hexágono 2 bege: os trapézios 3, 4 e 5 devem ser pintados de preto (1 possibilidade).
- Hexágono 1 azul, hexágono 2 cinza: os trapézios 3, 4 e 5 devem ser pintados de preto (1 possibilidade).
- Hexágono 1 bege, hexágono 2 azul: os trapézios 3 e 4 devem ser pintados de preto, mas o trapézio 5 pode ser pintado de azul ou preto (2 possibilidades).
- Hexágono 1 bege, hexágono 2 cinza: cada trapézio pode ser pintado de duas cores (2 × 2 × 2 = 8 possibilidades).
- Hexágono 1 cinza, hexágono 2 azul: os trapézios 3 e 4 devem ser pintados de preto e o trapézio 5 pode ser pintado de duas cores (2 possibilidades).
- Hexágono 1 cinza, hexágono 2 bege: cada trapézio pode ser pintado de duas cores (2 × 2 × 2 = 8 possibilidades).
Logo, há 1 + 1 + 2 + 8 + 2 + 8 = 22 maneiras diferentes de Maria pintar a Figura 3.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2021 AND numero=5
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2021 Q6
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Para uma data Dd/Mm/54 ser um dia fantástico, D, d, M, m devem ser 0, 1, 2 e 3, em alguma ordem, já que 4 e 5 estão presentes no ano. Como queremos o último dia fantástico desse ano, devemos buscar algum dia em dezembro. Assim, Mm = 12. Logo, como 30 é maior do que 03, o último dia fantástico de 2054 será 30/12/54.

Item b) No ano de 2001 não há dias fantásticos, pois não podemos escolher M adequadamente. Nos anos de 2002, 2003, 2004 e 2005, só poderá existir um dia fantástico se M = 1. Testando cada caso, nenhum produz uma data válida. Para 2010 e 2012, também não há soluções. Testando 2013: M = 0, enquanto D, d e m são, em alguma ordem, iguais a 2, 4 e 5. Como D ∈ {0, 1, 2, 3}, devemos ter D = 2. Assim, o primeiro dia fantástico após 1.º de janeiro de 2001 é 25/04/13, pois ela vem antes de 24/05/13.

Item c) Mantendo a notação Dd/Mm/Aa e lembrando que letras diferentes correspondem a números diferentes do conjunto {0, 1, 2, 3, 4, 5}, podemos dividir a contagem em dois casos disjuntos:
Caso 1: {A, a} é um subconjunto com dois elementos distintos de {2, 3, 4, 5}. Nesse caso, o ano terá pelo menos um dia fantástico. Podemos formar 4 × 3 = 12 anos com essa condição.
Caso 2: {A, a} não é subconjunto de {2, 3, 4, 5}. Analisando todos os subcasos, os anos restantes com datas fantásticas são: 2013, 2014, 2015, 2031, 2041, 2051, totalizando 6 possibilidades.
Juntando os casos 1 e 2, há um total de 12 + 6 = 18 anos com pelo menos um dia fantástico entre 2001 e 2100.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2021 AND numero=6
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2022 Q1
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Somando os valores da primeira linha, temos que O + O + O + O = 4. Portanto, O = 1.

Item b) Somando os valores da segunda linha, temos que B + B + O + B = 7. Como O = 1, então B + B + B = 6. Logo, B = 2.

Item c) Somando os valores da última linha, temos que E + P + O + B = 12. Por outro lado, as letras O, B, M, E e P representam, em alguma ordem, os números 1, 2, 3, 4 e 5. Portanto, O + B + M + E + P = 1 + 2 + 3 + 4 + 5 = 15. Assim, 15 = (E + P + O + B) + M = 12 + M; logo, M = 15 – 12 = 3.

Item d) Somando os valores da terceira linha, temos que M + E + B + O = 10. Como O = 1, B = 2 e M = 3, substituindo esses valores, encontramos E = 4. Portanto, P = 5, pois é a última letra que ainda não foi encontrado seu valor.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2022 AND numero=1
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2022 Q2
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) A 3ª marcação média marca 2,5 cm (25 mm). A 11ª marcação pequena marca 1,3 cm (13 mm). A distância, em milímetros, entre essas marcações é 25 – 13 = 12 mm.

Item b) Entre cada par de marcações grandes consecutivas há 8 marcações pequenas. A régua inteira possui 30 pares de marcações grandes consecutivas. Logo, há 30 × 8 = 240 marcações pequenas na régua inteira.

Item c) Para encontrar entre qual par de marcações grandes está a 215ª marcação pequena, devemos calcular o quociente da divisão de 215 por 8. Temos 215 = 26 × 8 + 7. A 215ª marcação pequena está na 7ª marcação pequena depois do 26º par de marcações grandes. A 215ª marcação pequena marca, então, 26,8 cm (268 mm). A marcação que está à distância de 73 milímetros da 215ª marcação pequena ocorre necessariamente antes dessa marcação, senão ela estaria fora da régua. A marcação que está à distância de 73 milímetros da 215ª marcação pequena marca, então, 268 – 73 = 195 milímetros, na 20ª marcação média.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2022 AND numero=2
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2022 Q3
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Como a distância da casa de Alice até a casa de Cláudia é 200 m e a distância da casa de Beatriz até a casa de Cláudia é 120 m, a soma das distâncias percorridas pelas duas é 200 + 120 = 320 m.

Item b) Se Alice, Beatriz e Cláudia se encontrarem a 150 metros do início da rua: Alice percorre 150 m, Beatriz percorre 150 – 80 = 70 m, Cláudia percorre 200 – 150 = 50 m. A soma das distâncias percorridas será, portanto, 150 + 70 + 50 = 270 m.

Item c) A soma das distâncias de qualquer ponto da rua às casas de Alice e Cláudia sempre será 200 m. Portanto, a menor soma das distâncias percorridas será no ponto onde Beatriz andar o mínimo possível, ou seja, em sua própria casa. Logo, elas devem se encontrar a 80 m do início da rua, na casa de Beatriz.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2022 AND numero=3
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2022 Q4
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Como os 4 triângulos são iguais, basta calcular a área da folha de cartolina e dividir por 4. Portanto, qualquer um desses triângulos tem área igual a (6 × 16) / 4 = 24 cm². Alternativamente, os quatro triângulos são triângulos retângulos iguais e seus lados menores (catetos) têm medidas 6 e 8. Portanto, a área de cada um deles é (6 × 8) / 2 = 24 cm².

Item b) O buraco no centro do quadrado tem lado cuja medida é igual à diferença entre as medidas dos dois catetos dos triângulos, ou seja, 8 – 6 = 2 cm. Logo, a área do buraco é 2² = 4 cm².

Item c) A área do quadrado que Janaína montou é igual à soma das áreas dos 4 triângulos, mais a área do buraco. Logo, a área desse quadrado é igual a 4 × 24 + 4 = 96 + 4 = 100 cm² e o lado do quadrado é √100 = 10 cm.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2022 AND numero=4
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2022 Q5
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Escolhendo quatro números dentre os números 1, 2, 3, 4, 5, 6, 7, 8 e 9, a menor soma possível que podemos obter ocorre quando esses números são os menores possíveis, isto é, 1 + 2 + 3 + 4 = 10. Portanto, Marco escreveu no quadrado destacado os números de 1 a 4. Fora desse quadrado, ele escreveu os números 5, 6, 7, 8 e 9, cuja soma é 5 + 6 + 7 + 8 + 9 = 35.

Item b) A soma de todos os números escritos por Marco é 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 = 45. O total das somas dos dois quadrados destacados é 21 + 26 = 47. Essa soma conta duas vezes o número escrito na casa central. Se x é o número escrito no quadrado central, e y é a soma dos dois números escritos fora dos quadrados destacados, então x + y = 45, logo x = 2 + y. Se y é o menor possível (y = 1 + 2 = 3), então x é o menor possível. O menor valor possível para o número escrito no quadrado central é x = 5.

Item c) Quando juntamos as quatro somas dos números escritos nos quadrados destacados: 18 + 25 + 21 + 24 = 88. Essa soma conta uma vez os números nos quatro cantos, duas vezes os números nos quatro meios das arestas e quatro vezes o número do centro. A soma de todos os números é 45, logo: 2 × (soma dos cantos) + 2 × (soma dos meios) + 2 × (número do centro) = 90. Portanto, 1 × (soma dos cantos) = 2 × (número do centro) + 2. Como a soma dos números nos quatro cantos é 16: 16 = 2 × (número do centro) + 2. Portanto, o número do centro é igual a 7.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2022 AND numero=5
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2022 Q6
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Para que a abelha volte à casinha inicial em três passos, ela deve ir para a casinha de baixo à esquerda, depois para a casinha de baixo à direita e, em seguida, voltar para cima (ou outro caminho equivalente que forme um triângulo fechado).

Item b) Observe que de qualquer casa rosa (R) da colmeia a abelha só pode ir, com os movimentos permitidos, para casas amarelas (A). Das casas amarelas a abelha só pode ir para casas brancas (B) e das casas brancas ela só pode ir para casas rosas. Assim, partindo de uma casa B, a sequência de cores é RABRABRA, ou seja, após 8 passos ela estará em uma casa amarela.

Item c) A colmeia tem 6 casas rosas, 7 casas amarelas e 6 casas brancas. Partindo de uma casa branca, temos a sequência de casas visitadas BRA BRA BRA BRA BRA BRA B, ou seja, depois de visitar 6 casas brancas, 6 rosas e 6 amarelas ela deve ir para uma branca, que com certeza é repetida, além de não ter visitado pelo menos uma casa amarela.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2022 AND numero=6
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2023 Q1
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) O número do vagão branco com bandeirinha após o vagão de número 8 é 10, basta continuar com o padrão apresentado.

Item b) Os vagões brancos são aqueles cujos números são múltiplos de 3 mais 1. Dividindo 2023 por 3 obtemos 2023 = 3 × 674 + 1. Logo, o vagão de número 2023 é branco.

Item c) A cada seis vagões consecutivos há exatamente um vagão branco com bandeirinha. Como 2023 = 6 × 337 + 1, há 337 bandeirinhas em vagões brancos até o vagão de número 2023.

Outras soluções:
- Uma outra maneira de ver isso é observar que os vagões brancos com bandeira são os de números 4 + (n − 1) × 6, n = 1, 2, 3, ... Quando n = 337, chegamos ao vagão 2020; o próximo vagão branco com bandeira será, portanto, o vagão de número 2026.
- Como 1 a cada 3 vagões consecutivos é branco, há 674 vagões brancos anteriores ao 2023 (2023 = 1 + 3 × 674). Observar que dois vagões brancos consecutivos alternam a paridade; assim, metade destes 674 vagões são de números pares (com bandeirinhas). Logo há 674/2 = 337 vagões brancos com bandeirinha.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2023 AND numero=1
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2023 Q2
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Há várias maneiras de pintar três hexágonos para obter os perímetros pedidos. O perímetro 12 cm e o perímetro 18 cm podem ser obtidos com diferentes arranjos de três hexágonos no tabuleiro (ver figura na solução oficial).

Item b) O maior perímetro possível com 4 hexágonos pintados é 20 cm.

Por que isso ocorre? Há apenas 6 padrões que podem ser obtidos quando pintamos 3 hexágonos (não levando em conta rotações e reflexões). Se pintarmos de cinza um quarto hexágono, somente as duas últimas configurações poderiam produzir uma nova figura com perímetro superior a 20 cm; entretanto, como pode ser verificado diretamente, isso não ocorre já que o quarto hexágono deveria partilhar pelo menos um de seus lados com um hexágono já pintado.

Item c) Toda vez que pintarmos de cinza dois hexágonos com um lado em comum, a figura formada perde duas unidades de perímetro correspondentes aos lados que se tocam; logo, ou dois hexágonos pintados não se tocam (e o perímetro total é um múltiplo de 6) ou, quando se tocam, a figura formada diminui seu perímetro em um múltiplo de 2. Assim, não existem figuras pintadas com perímetro ímpar.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2023 AND numero=2
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2023 Q3
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Para uma sequência que começa com os cartões 6 e 2, nessa ordem, o próximo cartão pode ser o de número 4, 8 ou 1. Por exemplo, sendo o 4, o cartão seguinte pode ser 8, seguido do 1, resultando em (6, 2, 4, 8, 1). Os cartões seguintes podem ser os de números 9 e 3, resultando em (6, 2, 4, 8, 1, 9, 3), uma sequência especial com sete cartões.

Item b) Com base na sequência anterior, com sete cartões, é possível formar uma com oito cartões: os dois últimos cartões, 9 e 3, podem ser movidos para o início da sequência anterior e o cartão de número 5 (ou 7) pode vir à direita do cartão de número 1, resultando em (9, 3, 6, 2, 4, 8, 1, 5) (ou (9, 3, 6, 2, 4, 8, 1, 7)).

Item c) Os números 5 e 7 são ambos múltiplos do 1. Uma sequência especial com três cartões, dentre eles os de números 5 e 7, pode ser (5, 1, 7). A outra possível é (7, 1, 5).

Item d) Dentre todos os cartões, os de números 5 e 7 são aqueles que podem ter menos vizinhos em uma sequência especial (exatamente um vizinho cada, que deve ser o cartão de número 1). Logo, se um deles é usado, o outro não pode ser usado para obter a maior sequência especial possível. Quando o 5 e o 7 são ambos utilizados, obtemos uma das sequências do item c). Portanto, as maiores sequências especiais com os cartões de números 5 ou 7 têm apenas um desses cartões, que deve ser posicionado em uma das suas pontas. Logo, é impossível formar uma sequência especial usando todos os cartões. As maiores delas têm oito cartões, tal como a do item b).$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2023 AND numero=3
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2023 Q4
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Há várias soluções, por exemplo: 111 + 555 + 666, 222 + 333 + 777, 333 + 444 + 555.

Item b) Todos os números que Carlinhos considerou são múltiplos de 111. Como 2109 ÷ 111 = 19, devemos encontrar todas as somas ordenadas de três parcelas para obtermos 19 × 111. Existem 5 possibilidades:
(2 + 8 + 9) × 111 = 222 + 888 + 999
(3 + 7 + 9) × 111 = 333 + 777 + 999
(4 + 6 + 9) × 111 = 444 + 666 + 999
(4 + 7 + 8) × 111 = 444 + 777 + 888
(5 + 6 + 8) × 111 = 555 + 666 + 888

Item c) As somas de três parcelas de Carlinhos resultando em um número até 999 possuem todas os mesmos algarismos da dezena e centena (não ocorre o "vai um"). Os resultados das contas de Carlinhos são sempre múltiplos de 111. Ao somarmos múltiplos de 111 até 888 percebemos que não há alteração na igualdade dos algarismos da dezena e centena; portanto, esses algarismos continuam iguais até 1110 + 888 = 1998. Mas, ao somarmos 111, obtemos exatamente 111 + 1998 = 2109, que possui algarismos de dezena e centena distintos. Continuando, notamos que ao somar 111 a esse número obtemos 2220, que volta a ter os mesmos algarismos da dezena e da centena. O maior número que Carlinhos pode obter é 777 + 888 + 999 = 24 × 111 = 2664; portanto, 2109 é o único número que Carlinhos obtém com algarismos distintos na dezena e na centena.

Outra solução: As somas de Carlinhos são todas do tipo aaa + bbb + ccc, com a < b < c. A única maneira do algarismo das dezenas do resultado da conta ser diferente do das centenas ocorre quando a + b + c = 19 ("vai um" das unidades para as dezenas, depois "vai dois" das dezenas para as centenas), pois a soma a + b + c varia de 6 a 24.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2023 AND numero=4
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2023 Q5
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) O caminho representado por 1001001100: a formiguinha passa por cima no 1º quadradinho, por baixo no 2º, por baixo no 3º, por cima no 4º, por baixo no 5º, por baixo no 6º, por cima no 7º, por cima no 8º, por baixo no 9º e por baixo no 10º. (Ver figura na solução oficial.)

Item b) Um caminho de A até B é determinado pelas escolhas da formiguinha de como ela vai passar por cada quadradinho. Ela pode escolher se vai passar por baixo (0) ou por cima (1). Dessa maneira, ela tem 10 escolhas a fazer e, para cada escolha, ela tem 2 possibilidades. Como qualquer escolha independe das anteriores, segue que o número de caminhos de A até B é 2 × 2 × 2 × 2 × 2 × 2 × 2 × 2 × 2 × 2 = 2^10 = 1024.

Item c) A formiguinha pode passar por C de 3 maneiras diferentes. Dessa maneira, para escolher um caminho passando por C, ela pode primeiro escolher uma das 3 possibilidades acima e depois escolher como vai passar pelos outros 8 quadradinhos. Dessa maneira, ela pode ir de A para B passando por C de 3 × 2^8 = 768 maneiras diferentes.

Outra maneira: para não passar por C a formiguinha tem que percorrer um trajeto fixo e isso pode ser feito de 2^8 maneiras diferentes. Desse modo, ela pode passar por C de 2^10 − 2^8 = (2^2 − 1) × 2^8 = 3 × 2^8 = 768 maneiras diferentes.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2023 AND numero=5
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2023 Q6
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) É possível chegar ao tabuleiro final em três etapas (ver figura na solução oficial com os movimentos indicados).

Item b) As bolinhas que serão movimentadas podem estar: (1) ambas em setores cinzas; (2) ambas em setores brancos; (3) uma em um setor cinza e uma em um setor branco.
1. Ambas bolinhas em setores cinzas – após um movimento, cada uma delas irá para um setor branco, ou seja, o número total de bolinhas em setores brancos irá aumentar em duas unidades;
2. Ambas bolinhas em setores brancos – após um movimento, cada uma delas irá para um setor cinza, ou seja, o número total de bolinhas em setores brancos irá diminuir em duas unidades;
3. Uma bolinha em um setor cinza e uma bolinha em setor branco – após um movimento, o número total de bolinhas em setores brancos fica inalterado.
Pelo que vimos, após cada movimento, o número de bolinhas em setores brancos aumenta em duas unidades, diminui em duas unidades ou fica inalterado, ou seja, se é ímpar inicialmente, permanecerá sempre ímpar.

Item c) Se colocarmos todas as bolinhas em um mesmo setor cinza (ou branco), teremos um número par de bolinhas (seis) em um setor cinza (ou branco). Mas a quantidade total de bolinhas nos setores brancos (ou da cor cinza), iniciando-se como no enunciado, é sempre ímpar; logo, é impossível colocá-las todas em um mesmo setor.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2023 AND numero=6
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2024 Q1
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Se Marco escolher Saturno, e decidir sempre mentir, ele deve dar a resposta SIM para a primeira pergunta (pois Saturno não tem 5 letras), a resposta SIM para a segunda pergunta (pois Saturno não tem a letra F), a resposta NÃO para a terceira pergunta (pois Saturno tem a letra S) e a resposta NÃO para a quarta pergunta (pois Saturno tem a letra N). Desse modo, Marco vai responder: 1. SIM; 2. SIM; 3. NÃO; 4. NÃO.

Item b) A pergunta em que é possível descobrir se Marco decidiu sempre mentir ou sempre falar a verdade é a segunda. Como nenhum dos planetas possui a letra F em seu nome, se Marco responder SIM para essa pergunta ele decidiu sempre mentir, e se responder NÃO ele decidiu sempre falar a verdade. Nas outras perguntas é impossível determinar a decisão de Marco em sempre mentir ou sempre falar a verdade, pois em cada uma delas suas respostas vão depender do planeta que escolher.

Item c) Como a resposta para a segunda pergunta foi SIM, Marco decidiu sempre mentir. Desse modo, o planeta procurado possui 5 letras, não possui a letra F, possui M ou S, e não possui a letra N. O único planeta com essas características é MARTE.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2024 AND numero=1
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2024 Q2
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Cada vez que Ana pega um pedaço da cesta, corta em 5 pedaços, e devolve os pedaços cortados para a cesta, o total de papéis da cesta aumenta em 5 − 1 = 4. Cada vez que Pedro pega um pedaço da cesta, corta em 3 pedaços, e devolve os pedaços cortados para a cesta, o total de papéis da cesta aumenta em 3 − 1 = 2. Logo, depois de Ana e Pedro pegarem um pedaço cada um e devolverem os pedaços cortados para a cesta, ela ficará com 3 + 4 + 2 = 9 papéis.

Item b) Há cinco maneiras diferentes de Ana e Pedro pegarem papéis da cesta a partir dos 3 pedaços iniciais para que a cesta fique com 11 pedaços. Por exemplo: Ana – Pedro – Pedro (3 + 4 + 2 + 2 = 11); Ana – Ana (3 + 4 + 4 = 11); Pedro – Pedro – Pedro – Pedro (3 + 2 + 2 + 2 + 2 = 11), entre outros.

Item c) O número inicial de papéis na cesta é ímpar, e vai sempre aumentar de 2 ou de 4 pedaços. Como um ímpar mais um par sempre resulta em um número ímpar, o número de papéis na cesta sempre será ímpar. Como 2024 é par, a cesta nunca ficará com 2024 pedaços.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2024 AND numero=2
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2024 Q3
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) O lado do quadrado vermelho mede 2 cm, logo sua área é 4 cm². Observamos que quatro dos quadrados adjacentes ao quadrado central se decompõem em quatro triângulos congruentes (um amarelo, dois azuis e um branco). Daí, a área de cada um dos triângulos amarelos é 1/4 da área do quadrado vermelho, ou seja, 1 cm². Como temos quatro triângulos amarelos, a área da região amarela é 4 cm².

Item b) A região branca é formada por quatro triângulos brancos menores (cuja área é 1 cm²) e quatro triângulos brancos maiores (cuja área é 2 cm², pois equivalem à metade do quadrado vermelho). Daí, a área da região branca é 4 × 1 + 4 × 2 = 4 + 8 = 12 cm².

Item c) Usando a decomposição obtida pela malha quadriculada, a região cinza é composta por quatro quadrados cuja área é 4 cm² e doze triângulos cuja área é 2 cm². Portanto, a área dessa região é dada por 4 × 4 + 12 × 2 = 16 + 24 = 40 cm².$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2024 AND numero=3
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2024 Q4
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Há infinitos preenchimentos possíveis. Por exemplo, os números 2, 4, 6, 8, 9, 3 podem ser usados nos círculos respeitando as ligações.

Item b) Abaixo apresentamos uma possibilidade com maior número 12. Em todos eles a posição do 5 e do 10 é fixa (o 5 deve ser ligado ao 10).

Item c) Se o maior número escrito é menor do que 12, os oito números a serem escritos devem ser escolhidos entre 2, 3, 4, 5, 6, 8, 9 e 10. De fato, o número 1 nunca pode ser escolhido, e se um número primo é escolhido para ser escrito num círculo então, necessariamente, um de seus múltiplos também deve ser escolhido para ser escrito num círculo vizinho; logo 7 e 11 não podem ser escolhidos, pois seus múltiplos são maiores do que 12. Como temos oito números e nove círculos, o preenchimento é impossível.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2024 AND numero=4
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2024 Q5
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) A soma dos números nas faces de um dado é 1 + 2 + 3 + 4 + 5 + 6 = 21. Logo a soma dos números nas faces de dois dados é 2 × 21 = 42. A menor soma possível para todos os números que foram cobertos por adesivos em dois dados colados ocorre quando as faces coladas possuem os maiores números possíveis, ou seja, quando as faces coladas possuem o número 6. Logo, a menor soma possível para todos os números que foram cobertos por adesivos é 42 − 12 = 30.

Item b) Na figura foram colados 16 dados. No patamar superior há quatro dados, cada um com 5 faces não coladas. Abaixo de cada dado do patamar superior há um dado com 3 faces não coladas e, ao lado de cada um deles, há dois dados com 4 faces não coladas. No total temos 4 × 5 + 4 × 3 + 8 × 4 = 64 faces não coladas. Logo Janaína usou 64 adesivos.

Item c) A menor soma possível para todos os números cobertos por adesivos na colagem do item b) ocorre quando as faces coladas possuem os maiores números possíveis. Nos dados do patamar superior o maior número que pode estar em cada face colada é 6. No dado abaixo de cada dado do patamar superior os maiores números possíveis são 6, 5 e 4. Nos demais dados, as duas faces coladas são opostas uma da outra e, portanto, vão somar sempre 7. Logo, a maior soma possível para os números nas faces coladas é 4 × 6 + 4 × (6 + 5 + 4) + 8 × 7 = 140. Assim a menor soma possível para todos os números cobertos por adesivos na colagem do item b) é 16 × 21 − 140 = 196.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2024 AND numero=5
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2024 Q6
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) O preenchimento com zeros e uns em uma tabela equilibrada é determinado, de maneira única, pela posição dos possíveis resultados das somas das linhas e das colunas. (Ver exemplos na solução oficial.)

Item b) O preenchimento é determinado de maneira única pela posição dos resultados das somas. Como os resultados das somas das linhas já estão fixos (4, 3, 2, 1), devemos contar as possibilidades de resultados para as somas das colunas. Temos 4 possibilidades para a soma da primeira coluna, 3 para a segunda, 2 para a terceira e 1 para a quarta. No total, pelo princípio multiplicativo da contagem, temos 4 × 3 × 2 × 1 = 24 possibilidades. Portanto há 24 tabelas equilibradas diferentes em que as somas das linhas são, em ordem, 4, 3, 2 e 1.

Item c) De acordo com o item b), há 24 tabelas para cada arranjo das somas das linhas. Como há 24 arranjos possíveis das somas das linhas (4! = 24), há 24 × 24 = 576 tabelas equilibradas diferentes.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2024 AND numero=6
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2025 Q1
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) [Ver figura na solução oficial com o preenchimento completo dos círculos.]

Item b) Primeiro preenchimento e segundo preenchimento: [Ver figuras na solução oficial.]

Item c) Os 3 círculos vazios da segunda linha deverão ser preenchidos, em alguma ordem, pelos números 1, 2 e 3. Portanto, os números dos círculos vazios da primeira linha serão escolhidos entre {4, 5, 7, 8}; mas, nesse conjunto, não há 3 elementos tais que a subtração de dois deles resulte no terceiro, diferente das parcelas. Logo, o preenchimento é impossível.

Variação da argumentação: Nos itens a) e b) observa-se que quando o círculo A está preenchido, o maior dos números ainda não utilizado deve ser colocado no círculo B para tornar as subtrações possíveis. Então, no círculo B deve ser colocado o número 8. Na segunda linha devem aparecer os algarismos 1, 2 e 3 em alguma ordem; com isso, restam os números 4, 5 e 7 para serem colocados nos círculos que restam. Portanto, as subtrações 8 – 7 = 1, 8 – 5 = 3 na primeira linha são inviáveis. Como 8 – 4 = 4, precisaríamos de dois números 4 para tornar verdadeira a igualdade da primeira linha. Logo, não é possível completar o preenchimento.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2025 AND numero=1
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2025 Q2
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Não utilizam a bicicleta 6 em cada 14, ou seja, 6/14 = 1 – (8/14), que equivale a 3/7. Não utilizam a esteira 22 em cada 42, ou seja, 22/42 = 1 – (20/42), que equivale a 11/21.

Item b) Porque (8/14) + (20/42) = 44/42 > 1. Mais detalhadamente, se T é o número total de atletas, 8T/14 é o número dos que andam de bicicleta e 20T/42 é o número dos que andam na esteira. Caso não haja atletas que realizem ambas as atividades, (8T/14) + (20T/42) ≤ T, ou seja, 44T/42 ≤ T e, daí, 44 ≤ 42, uma contradição. Logo, há atletas que utilizam bicicleta e também esteira.

Item c) A cada 42 pessoas, apenas 24 andam de bicicleta e 20 na esteira, ou seja, 24 – 20 = 4 só usam bicicleta enquanto que 42 – (8/14) × 42 = 18 não andam de bicicleta; logo, a quantidade de pessoas que não andam de bicicleta é 18/4 da quantidade de pessoas que só utilizam bicicleta. O enunciado nos informa que 10 atletas utilizam bicicleta, mas não esteira. Logo, a quantidade de pessoas que não andam de bicicleta é (18/4) × 10 = 45.

Outra solução (com álgebra): Sejam T = número total de atletas, B = atletas que andam de bicicleta, E = atletas que andam de esteira. De acordo com o enunciado, B – E = 10; logo, (B/T) – (E/T) = 10/T, portanto (8/14) – (20/42) = 10/T, ou seja (2/21) = 10/T; logo, T = 105. A quantidade dos que andam de bicicleta é B = (8/14) × 105 = 60 e a quantidade dos que não andam de bicicleta é 105 – 60 = 45.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2025 AND numero=2
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2025 Q3
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) A figura de Ana é uma estrela, pois ela mentiu apenas sobre a cor. Logo, Ana pode ter feito uma das escolhas: estrela branca ou estrela cinza.

Item b) A figura de Carla não é um círculo, nem tem a cor branca; portanto, ela pode ter escolhido o triângulo cinza, o triângulo preto, a estrela cinza ou a estrela preta.

Item c) Ana escolheu uma estrela (item a)); logo, Carla obrigatoriamente escolheu um triângulo (item b)), consequentemente a figura da Bia só pode ser um círculo. Ainda não sabemos as cores.

Como a figura da Bia é cinza (segundo item do enunciado, pois ela mentiu apenas sobre o formato), então ela escolheu o círculo cinza. Logo, o triângulo da Carla não pode ser cinza; assim, Carla escolheu o triângulo preto e como a estrela da Ana não é cinza, então só pode ser branca.

Conclusão: Ana tem a estrela branca, Bia tem o círculo cinza e Carla tem o triângulo preto.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2025 AND numero=3
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2025 Q4
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Cada quadradinho do tabuleiro deve ser preenchido com a soma do valor de sua linha com o valor de sua coluna. Com linhas 9, 15, 19 e colunas 3, 8, 10:
Linha 9: 12, 17, 19
Linha 15: 18, 23, 25
Linha 19: 22, 27, 29

Item b) Observe que para um tabuleiro preenchido corretamente, os valores que aparecem em uma linha qualquer têm, dois a dois, a mesma diferença entre si que os valores externos associados às colunas correspondentes. Olhando para a terceira linha e comparando com a primeira: de 20 para 27 houve um aumento de 7, logo na primeira linha e segunda coluna teremos 12 + 7 = 19. Olhando para a terceira coluna e comparando com a segunda: de 4 para 14 temos um aumento de 10, logo teremos na segunda linha 22 = 12 + 10, 29 = 19 + 10 e 14. Comparando a segunda com a terceira linha: na segunda linha e nas últimas colunas, passamos de 29 para 14, temos uma diminuição de 15; assim, na terceira linha também devemos, a partir do 27, diminuir 15 para obtermos o valor que ainda falta, que é 27 – 15 = 12.

Item c) A soma de todos os valores colocados nos 9 quadradinhos será o triplo da soma dos valores das linhas e colunas, pois cada um dos números externos participará de 3 somas. Nomeando os valores externos de linhas como a, b, c e de colunas como d, e, f: a soma dos 9 quadradinhos é 3 × (a + b + c + d + e + f) = 150, ou seja, (a + d) + (b + e) + (c + f) = 50. Com os valores externos dados, (a + d) + 18 + 23 = 50, ou seja, o número escrito na casa cinza é a + d = 9.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2025 AND numero=4
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2025 Q5
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Basta desenhar dois paralelogramos de formas diferentes, cada um com área de 8 cm² (equivalente a 8 triângulos equiláteros de área 1 cm²). Por exemplo, um paralelogramo mais alongado e um mais quadrado, ambos usando 4 losangos cada. (Ver figura na solução oficial.)

Item b) O retângulo original azul pode ser decomposto em 14 triângulos equiláteros pretos, 14 triângulos equiláteros da cor cinza, 14 triângulos equiláteros brancos (cada um deles de área 1), mais 14 metades de triângulos equiláteros azuis (cada uma delas de área 1/2). Logo, a área do retângulo azul original é 14 + 14 + 14 + 14 × (1/2) = 49 cm².

Item c) Ao ser colocado no tabuleiro triangular, cada losango cobre um pequeno triângulo com o logo da OBMEP e um em branco. Como há 6 triângulos com o logo da OBMEP e 10 brancos, só será possível usar, no máximo, 6 losangos. Podemos efetivamente usar 6 losangos, como mostrado na solução oficial. Portanto, Roberta deverá usar 6 losangos.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2025 AND numero=5
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;

-- 2025 Q6
INSERT INTO solucao (questao_id, texto)
SELECT id, $s$Item a) Observe que cada vez que descemos uma casa, o número escrito aumenta 20. Toda vez que vamos uma casa para esquerda, o número escrito diminui em 1. Portanto, x = 17 + 20 + 20 – 1 – 1 = 55.

Item b) Temos que z = y + 20 + 1 = y + 21 e que w = y + 20 + 20 – 1 – 1 – 1 – 1 – 1 = y + 35. Se d é divisor de y, y + 21 e y + 35, então d é divisor de 21 e de 35. Como mdc(21, 35) = 7, d é divisor de 7. Sabendo que d é maior do que 1, concluímos que d = 7.

Item c) Como y está na primeira linha, os únicos múltiplos de 7 que estão entre 1 e 20 são: 7 e 14. Note que temos os seguintes valores para as triplas (y, z, w): (7, 28, 42) ou (14, 35, 49). Portanto, os possíveis valores de y são 7 e 14.$s$
FROM questao WHERE olimpiada='obmep' AND nivel='nivel_1' AND fase=2 AND ano=2025 AND numero=6
ON CONFLICT ON CONSTRAINT solucao_unique DO NOTHING;
