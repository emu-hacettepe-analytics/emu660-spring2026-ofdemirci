data(mtcars)

compute_stats<-function(x){
  list(
    mean = mean(x),
    median = median(x),
    variance = var(x),
    IQR = IQR(x),
    minimum = min(x),
    maximum = max(x)
  )
}
#FOR loop uygulaması
numeric_cols <- sapply(mtcars, is.numeric)
#AI Prompt For Numeric_cols was How can I detect the numerical columns of a vector?
for (col_name in names(mtcars)[numeric_cols]) {
  cat("Column:", col_name, "\n")
  print(compute_stats(mtcars[[col_name]]))
}
#Sapply Kullanımı
sapply_results <- sapply(mtcars[, numeric_cols], compute_stats, simplify = FALSE)
cat("\n\n===== sapply results =====\n")
print(sapply_results)

#Apply Kullanımı
apply_results <- apply(mtcars, 2, compute_stats)

cat("\n\n===== apply results =====\n")
print(apply_results)