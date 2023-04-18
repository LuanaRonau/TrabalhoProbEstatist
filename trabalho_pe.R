library(data.table)

topfilms <- fread(input = paste0("IMDB Top 250 Movies.csv"), header = T, na.strings = "NA", data.table = FALSE, dec = ",")

teste = list("scifi", "sports", "thriller", "war", "fantasy", "film-noir", "history", "horror", "mystery", "romance", "action", "adventure", "animation", "biography", "crime", "family")

base <- data.frame()

for (i in 1:16) {
  temp = teste[[i]]
  temp <- fread(input = paste0(teste[[i]], ".csv"), header = T, na.strings = "NA", data.table = FALSE, dec = ",") 
  base <- rbind(base, temp)
}

base <- base[,c(-4, -8, -10, -11, -12)]

base <- base[!base$year=="",]
base <- base[!base$runtime=="",]
base <- base[!base$rating=="",]
base <- base[!base$director=="",]

dim(base)[1]

x = 1
while (x <= dim(base)[1]) {
  variavel = base[1,]
  base <- base[!base$movie_id==variavel]
  base <- rbind(base, variavel)
  x = x+1
}




