# Fazendo os gráficos das descritivas
# Neste caso, estaremos utilizando apenas a base de treino

# Classe
g1 = ggplot(data=data.frame(x1=paste0("Classe ",names(table(titanic.train$Pclass))),
                            x2=as.vector(table(titanic.train$Pclass))), aes(x=x1, y=x2)) +
  geom_bar(stat="identity", fill="Magenta") +
  ggtitle("Divisão de classes no Titanic") + 
  xlab(NULL) + ylab("Quantidade") + ylim(c(0,525)) +
  geom_text(aes(
    label=paste0(round(x2/sum(x2)*100,2),"%")), vjust=-0.3, size=3.5) +
  theme_minimal()


png("graficos\\descritiva_classe.png", height= 427, width=687.5)
print(g1)
dev.off()

# Sexo
g2 = ggplot(data=data.frame(x1=str_to_title(names(table(titanic.train$Sex))),
                            x2=as.vector(table(titanic.train$Sex))), aes(x=x1, y=x2)) +
  geom_bar(stat="identity", fill=c("HotPink","SteelBlue")) +
  ggtitle("Sexo") + 
  xlab(NULL) + ylab("Quantidade") + ylim(c(0,max(table(titanic.train$Sex))+20)) +
  geom_text(aes(
    label=paste0(round(x2/sum(x2)*100,2),"%")), vjust=-0.3, size=3.5) +
  theme_minimal()


png("graficos\\descritiva_sexo.png", height= 427, width=687.5)
print(g2)
dev.off()


# Idade
g3 = ggplot(data=titanic.train, aes(x=Age, y=..density..)) +
  geom_histogram(fill="LightGreen", bins = 15) + ggtitle("Distribuição da Idade") +
  ylab("Frequência") + xlab("Idade (em anos)") + ylim(c(0,0.065)) +
  theme_minimal() +
  geom_density(alpha=0.3, color="Black", fill="Black")

png("graficos\\descritiva_idade.png", height= 427, width=687.5)
print(g3)
dev.off()

summary(titanic.train$Age)


# Embarque
g4 = ggplot(data=data.frame(x1=c("Cherbourg","Queenstown","Southampton"),
                            x2=as.vector(table(titanic.train$Embarked))), 
            aes(x=x1, y=x2)) +
  geom_bar(stat="identity", fill="CadetBlue") + 
  ggtitle("Local de Embarque") + xlab(NULL) + ylab("Quantidade") +
  ylim(c(0,max(as.vector(table(titanic.train$Embarked)))+10)) +
  geom_text(aes(
    label=paste0(round(x2/sum(x2)*100,2),"%")), vjust=-0.3, size=3.5) +
  theme_minimal()

png("graficos\\descritiva_embarque.png", height= 427, width=687.5)
print(g4)
dev.off()


# Sobreviventes
g5 = ggplot(data=data.frame(x1=c("Não","Sim"),
                            x2=as.vector(table(titanic.train$Survived))), 
            aes(x=x1, y=x2)) +
  geom_bar(stat="identity", fill=c("Salmon","CornflowerBlue")) +
  ggtitle("Sobreviventes") + ylab("Quantidade") + xlab(NULL) +
  ylim(c(0, max(as.vector(table(titanic.train$Survived)))+15)) +
  geom_text(aes(
    label=paste0(round(x2/sum(x2)*100,2),"%")), vjust=-0.3, size=3.5) +
  theme_minimal()

png("graficos\\descritiva_sobrev.png", height= 427, width=687.5)
print(g5)
dev.off()
