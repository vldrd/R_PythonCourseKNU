prepare_set <- function(file_name) {
  data <- read.csv(file_name, skip = 1, header = TRUE, encoding="UTF-8",
                   stringsAsFactors = FALSE)
  
  names(data)[1] <- "Country"
  for (i in 2:16) {
    names(data)[i] <- sub("X01..", "Gold", names(data)[i])
    names(data)[i] <- sub("X02..", "Silver", names(data)[i])
    names(data)[i] <-  sub("X03..", "Bronze", names(data)[i])
    names(data)[i] <- sub("X..", "", names(data)[i])
  }
  data$ID <- NA
  
  for (k in 1:58){
    x <- str_split(data$Country[k], "\\(|\\)", simplify = TRUE)
    data$Country[k] = x[1]
    data$ID[k] = x[2]
  }
  return (data)
}

olympics <- prepare_set("D:/1/olympics.csv")

olympics

answer_one <- function(data){
  for (j in 1:147){
    country <- ' '
    if(data$Gold[j] == max(data["Gold"])){ country <- data$Country[k]}
  }
  return (country)
}