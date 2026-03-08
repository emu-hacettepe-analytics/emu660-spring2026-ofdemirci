#install.packages("dslabs")
#install.packages("dplyr")
library(dslabs)
library(dplyr)
data("polls_us_election_2016")
df <- polls_us_election_2016
my_first <- "Omer"
my_birth_year <- 1999

k <- (nchar(my_first) + my_birth_year) %% 15 + 8
k
#Display k row
if (k %% 2 == 0) {
  original_k_rows <- head(df, k)
} else {
  original_k_rows <- tail(df, k)
}
original_k_rows

#Display Total NA
total_na <- sum(is.na(df))
total_na
#NA Per Column sorted and top 8
na_per_column <- sort(colSums(is.na(df)), decreasing = TRUE)

top_8_na_columns <- head(na_per_column, 8)
top_8_na_columns

#Data replacing

new_data <- df

for (col_name in names(new_data)) {
  
  if (is.numeric(new_data[[col_name]])) {
    new_data[[col_name]][is.na(new_data[[col_name]])] <- my_birth_year + k
    
  } else if (is.character(new_data[[col_name]])) {
    new_data[[col_name]][is.na(new_data[[col_name]])] <- paste0(my_first, "_", k)
    
  } else if (is.factor(new_data[[col_name]])) {
    # AI Prompt for this:Is this function still works if it is not a character 
    #and it is a vector? Then chatgpt said that you need to add a level like this
    levels(new_data[[col_name]]) <- c(levels(new_data[[col_name]]), paste0(my_first, "_", k))
    new_data[[col_name]][is.na(new_data[[col_name]])] <- paste0(my_first, "_", k)
  }
}
#K Rows from new dataset
if (k %% 2 == 0) {
  new_k_rows <- head(new_data, k)
} else {
  new_k_rows <- tail(new_data, k)
}

new_k_rows
#Remaning NA
remaining_na <- sum(is.na(new_data))
remaining_na

anyNA(new_data)