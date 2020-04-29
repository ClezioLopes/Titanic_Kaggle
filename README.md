
Pacotes que serão utilizados para analisar o conjunto de dados do Titanic.

```{r, echo=TRUE, eval=TRUE, message=FALSE, warning=FALSE} 
library(dplyr)
library(MASS)
library(GGally)
library(ggplot2)
library(randomForest)
library(caret)
```

Setando caminho da pasta, em seguida já baixando os arquivos de dados.
```{r}
setwd("C:\\Users\\Clézio Lopes\\Desktop\\GitHub\\Titanic")

# Conjunto de dados - Treino e Teste
titanic.train = read.csv("data\\train.csv", header = T, sep=",", 
                         stringsAsFactors = F)

titanic.test = read.csv("data\\test.csv", header = T, sep=",",
                        stringsAsFactors = F)
```

Vale ressaltar que a base de teste armazenada acima, não contém a variável Survived pois já é a base em que o modelo será testado, para realizar estudo do modelo será interessante dividir a base de treino em duas: Treino e teste do modelo.

```{r, echo=FALSE, results="hide", message = FALSE}
# Tratando as variaveis do banco
names(titanic.train) # Variaveis
str(titanic.train) # caracteristicas de cada variavel

# Idade treino
titanic.train$Age %>% 
  summary() #Obs: 177 NA, vamos tratar essa informação

# Idade teste
titanic.test$Age %>% 
  summary() #Obs: 86 NA, vamos tratar essa informação

# Possui grande número de NA, e as medianas são diferentes, remos tratar essa
# variavel conjuntamente, para isso, iremos criar um banco de dados completo

titanic.test$Survived = NA #Criando uma coluna de NA para sobreviventes

titanic.test$isTrain = FALSE
titanic.train$isTrain = TRUE

# Agora as duas bases possuem a mesma quantidade de varivaveis, vamos junta-las

titanic.full = rbind(titanic.train, titanic.test)

# Agora podemos tratar as variaveis

# Embarque
titanic.full$Embarked %>% 
  table() # Como a maioria dos embarques foram em 'S', vamos colocar as duas
# observações para S

titanic.full[titanic.full$Embarked=='', "Embarked"] = "S"

# idade
titanic.full$Age %>% 
  is.na() %>% 
  table() # Possui um grande valor de NA (263)

# Tabela de valores
titanic.full$Age %>% 
  is.na() %>% table()

# Atribuindo o valor da mediana aos NA´s (28)
titanic.full[is.na(titanic.full$Age), "Age"] =
  median(titanic.full$Age, na.rm = T) 

# Tarifa
titanic.full$Fare %>% 
  is.na() %>% 
  table()

# Atribuindo valor para essa única observação
titanic.full[is.na(titanic.full$Fare), "Fare"] = 
  median(titanic.full$Fare, na.rm = T)

# Tranformando as variaveis categoricas
titanic.full$Pclass = as.factor(titanic.full$Pclass)
titanic.full$Sex = as.factor(titanic.full$Sex)
titanic.full$Embarked = as.factor(titanic.full$Embarked)

# Split do banco completo
titanic.train = titanic.full[titanic.full$isTrain == TRUE,]
titanic.test = titanic.full[titanic.full$isTrain == FALSE,]

# Tranformando Survived do conjunto de treino
titanic.train$Survived = as.factor(titanic.train$Survived)

```

### Análise descritiva dos dados

# OBS:  Incluir imagens


Os demais códigos, estão no arquivo .R

```{r, echo=FALSE, warning=FALSE, message=FALSE}

######################
#   Ajuste do modelo
######################

# As variaveis que entraram no modelo são:
formula = as.formula("Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked")

# Vale lembrar que o test, não poderá ser utilizado para testar o modelo, pois
# será as estimativas em cima dele que será submetido ao Kaggle. 

# Portanto vamos separar a base de treino m treino e teste (ficou ruim!)

# Dividindo a base em 70% e 30%
set.seed(7)
linhas = sample(titanic.train$PassengerId, round(nrow(titanic.train)*0.7))

# Nova base de treino
dados.treino = titanic.train[linhas,]

# Nova base de teste
dados.teste = titanic.train[-linhas,]


#####  Modelo Logístico
model.logist = glm(formula=Survived ~ Pclass + Sex + Age + SibSp + Embarked, family=binomial(link='logit'), data=dados.treino)
summary(model.logist)

str(dados.treino)

# Selecionando variaveis pelo AIC
stepAIC(model.logist)

model.logist = glm(formula=Survived ~ Pclass + Sex + Age + SibSp, family=binomial(link='logit'), data=titanic.train)
summary(model.logist)

Survived.logist = as.factor(round(predict(model.logist, dados.teste, type="response")))

MatrizLogist = confusionMatrix(Survived.logist,dados.teste$Survived)
MatrizLogist


#####  Random Forest
model.random = randomForest(formula=formula, data = dados.treino, ntree=500,
                            mtry=3, nodesize=0.01*nrow(dados.teste))
model.random

Survived.random = predict(model.random, dados.teste)

MatrizRandom = confusionMatrix(table(Survived.random,dados.teste$Survived))
MatrizRandom

# Temos que o melhor modelo para este conjunto de dados é o Random Forest
# desta forma, iremos ajustar o modelo a base de teste

Survived.Kaggle = predict(model.random, titanic.test)

# Criando o arquivo a ser submetido
PassengerId=titanic.test$PassengerId
data.final=as.data.frame(PassengerId)
data.final$Survived = Survived.Kaggle

write.csv(data.final, file="Survived_kaggle_submission.csv", row.names = F, quote = FALSE)

# Resultado competição score: 0.76555

############################################################################################
model.random = randomForest(formula=formula, data = titanic.train, ntree=500,
                            mtry=3, nodesize=0.01*nrow(titanic.test))
model.random

Survived.random = predict(model.random, titanic.test)

# Criando o arquivo a ser submetido
PassengerId=titanic.test$PassengerId
data.final=as.data.frame(PassengerId)
data.final$Survived = Survived.random

write.csv(data.final, file="Survived_kaggle_submission_2.csv", row.names = F, quote = FALSE)

# Resultado competição score: 0.77511
```
