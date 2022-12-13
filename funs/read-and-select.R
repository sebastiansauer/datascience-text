read_and_select <- function(file_name) {
  
  out <- 
    read_rds(file = file_name) %>% 
    select(id, author_id, created_at, text, public_metrics) %>% 
    unnest_wider(public_metrics)
  
  cat("Data file was read.\n")
  
  return(out)
}
