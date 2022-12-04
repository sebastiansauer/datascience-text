read_and_select <- function(file_name, path_to_tweet_data = tweet_data_path) {
  
  out <- 
    read_rds(file = paste0(path_to_tweet_data, file_name)) %>% 
    select(id, author_id, created_at, text, public_metrics) %>% 
    unnest_wider(public_metrics)
  
  cat("Data file was read.\n")
  
  return(out)
}
