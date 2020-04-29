# Competição Titanic Kaggle

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


### Análise descritiva dos dados

### OBS:  Incluir imagens


Os demais códigos, estão no arquivo .R
