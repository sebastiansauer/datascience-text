
#' Add new tweets to tweets tibble
#' 
#' This function is a wrapper around bind_rows, and it removed duplicates 
#'
#' @param tweets_new 
#' @param tweets_db 
#'
#' @return
#' @export
#'
#' @examples
add_tweets_to_tweets_db <- function(tweets_new, tweets_db) {


# Add new tweets to tweets db:
tweets_db <-
  tweets_db %>% 
  bind_rows(tweets_new) %>% 
  distinct(.keep_all = TRUE)
}

