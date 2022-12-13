read_train_data <- function(path_to_data = "data-raw/GermEval-2018-Data-master/germeval2018.training.txt") {
  
  d <- datawizard::data_read(path_to_data, header = FALSE, quote = "")
  
  names(d) <- c("text", "c1", "c2")
  
  d$c2 <- NULL
  
  d$id <- as.character(1:nrow(d))
  
  return(d)
  
}
