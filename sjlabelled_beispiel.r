library(sjlabelled)
library(sjPlot)

# SPSS-Datei einlesen
testdata <- read_spss("ressourcen/testdaten.sav")

# Struktur des Datenframes betrachten
str(testdata)

# Variablenlabels auslesen
get_label(testdata$selbstwert1)

# Wertelabels auslesen
get_labels(testdata$selbstwert1)

# Neue Variablen hinzufügen mit Variaben- und Wertelabels
testdata$selbstwert3 <- c(1,2,2,3,2,5,4,4,2,2,1,2,3,2,5,4,2,3,2,5,2,1,1,1,1,1,2,2,3,2,1)
testdata$selbstwert3 <- testdata$selbstwert3 %>% 
  set_label("In der letzten Woche mochte ich mich selbst leiden.") %>% 
  set_labels(labels=c("Nie","Selten","Manchmal","Oft","Immer"))

# Variablen werden im Standard als numerisch angesehen
table(testdata$selbstwert1)

# Mit as_label werden die Labels ausgegeben
table(as_label(testdata$selbstwert1))

# Weitere Pakete übernehmen auch Variablenlabels, z. B. sjPlot vom gleichen Autor
tab_corr(testdata, na.deletion = "pairwise", corr.method = "spearman")
