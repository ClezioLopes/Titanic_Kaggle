# Kaggle - Competição Titanic 

Material desenvolvido com o intuíto de aprender e aprofundar o conhecimento na área de Data Science, o conteúdo aqui não apresenta qualquer validação de métodologia, apenas a curiosidade contribuiu para a realização do mesmo.

## Análise descritiva

A análise descritiva são o passo inicial em qualquer análise estatística, pois a mesma serve para nos dar uma compreensão dos dados em mãos, em algum casos problemas são solucionados apenas com uma descritiva bem feito. Neste trabalho não entraremos afundo nas descritivas pois não é o nosso foco um trabalho completo, estamos mais interessados em aprensentar um modelo.

### Classe
Para as classes do Titanic, temos um grande número de pessoas na classe 3 aproximadamente 55% dos passageiros. Estes resultados são previamente esperados, pois é de conhecimento de todos que em viagens sejam em navios ou aviões o número de passageiros na primeira e segunda classe são inferiores aos de classes mais inferiores.

![descritiva_classe](https://user-images.githubusercontent.com/47902959/81209853-6ed53b80-8fa7-11ea-9c2b-9821dbf50d89.png)

### Embarque
Podemos observar pela figura abaixo, que houve um grande número de embarques em Southampton, com cerca de 72.5% dos embarques realizados. Este resultado já era esperado, pois a rota da viagem consistia em saída de Southampton (Reino Unido), com passagem por Cherbourg-Octeville (França) e por Queenstown (Irlanda) antes do destino final em Nova Yorque.

![descritiva_embarque](https://user-images.githubusercontent.com/47902959/81113007-e8145600-8ef5-11ea-91ee-4df1402c0938.png)

### Idade
Quando observamos a idade dos tripulantes do Titanic podemos observar que são em sua maioria jovens, com com idade entre 20 e 40 anos.
Podemos notar que a média é de aproximadamente 29 anos, reforçando o comentário anterior, temos que o 3º quartil corresponde a idade de 35 anos, ou seja, 75% dos tripulantes possuem idade até essa idade.
OBS: Temos um valor de idade inferior a 1, pois está está representada em meses vividos.

   | Mínimo | 1º Quartil | Mediana | Média | 3º Quartil | Máximo  |
   |--------|------------|---------|-------|------------|---------|
   | 0.42   | 22.00      | 28.00   | 29.36 | 35.00      | 80.00   |
  
![descritiva_idade](https://user-images.githubusercontent.com/47902959/81113010-e8145600-8ef5-11ea-8392-c5374cfe0270.png)

### Sexo
Em relação ao sexo, temos uma grande maioria do sexo masculino, quase 65% das pessoas a bordo eram do sexo masculino. 
![descritiva_sexo](https://user-images.githubusercontent.com/47902959/81113011-e8acec80-8ef5-11ea-91f8-740cd871c5b4.png)

### Sobreviventes
![descritiva_sobrev](https://user-images.githubusercontent.com/47902959/81209859-70066880-8fa7-11ea-979a-0ecd6cd1f2cc.png)

#### OBS: Como já citado anteriormente as análises descritivas não se resume somente a estas, podemos fazer análises multivariadas a cerca das variáveis na base, como o objetivo é apresentar um modelo não aprofundaremos nas descritivas.

