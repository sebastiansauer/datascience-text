#' Get most recent tweet per screenname
#'
#' Searches data frame for the most recent (and oldest) tweets per screenname.
#' 
#' @param tweets_db Tweets dataframe to search for 
#' @max_or_min_id_str `is_min_id_str` for oldest tweet, or `is_max_id_str` for most recent tweets (default)
#'
#' @return tweets_db tibble with 3 cols: screenanme, most recent tweet (min_id_str), oldest tweet (max_id_str)
#' @export
#'
#' @examples
#' filter_recent_tweets(tweets_db)


filter_recent_tweets <- function(tweets_db, max_or_min_id_str = is_max_id_str) {
  tweets_db %>% 
    select(id_str, screenname, created_at) %>% 
    group_by(screenname) %>% 
    mutate(is_min_id_str = id_str == str_sort(id_str, numeric = TRUE)[1],
           is_max_id_str = id_str == str_sort(id_str, numeric = TRUE, decreasing = TRUE)[1]) %>% 
    filter({{max_or_min_id_str}})
}



