#' Download recent (or older) tweets
#' 
#' Tweets directed to a given list of screennames is downloaded from Twitter.
#' Authentification is assumed. The search term is "@" followed by the screenname,
#' e.g. "@Karl_Lauterbach". 
#'
#' @param screenname Twitter account names for which 
#' @param max_or_since_id_str id (string) of max/min tweet to download
#' @param n_tweets_per_politician number of tweets to download per screenname (default: 1)
#' @param reverse (lgl) Defaults to FALSE, set to TRUE if you want the tweets older than a threshold
#' @param verbose print details
#' @param strip_columns retain only a selection of cols in order to reduce object size, removes attributes as well.

#'
#' @return
#' @export
#'
#' @examples
#' download_recent_tweets("sebastiansauer", max_or_since_id_str = my_id_str)
download_recent_tweets <- function(screenname, 
                                   max_or_since_id_str = NULL, 
                                   n_tweets_per_politician = 1000L,
                                   reverse = FALSE, 
                                   verbose = TRUE, 
                                   strip_columns = TRUE) {
  
 
   if (verbose) {
    cat("Screennames: \n")
    print(screenname)
    cat("-----------\n")
  }
    
  screenname_raw <- screenname
  screenname <- paste0("@", screenname_raw)
  
  names(screenname) <- screenname_raw
  

      
  
  
  
  if (is.null(max_or_since_id_str)) {
    tweets_new <-
      map_dfr(screenname,
              ~ search_tweets(q = .x, 
                              include_rts = FALSE, 
                              `-filter` = "replies", 
                              n = n_tweets_per_politician,
                              retryonratelimit = TRUE,
                              verbose = verbose) %>% 
                # sometimes the type is `lgl`, sometimes `list`, we need to be type-stable:
               sanitize_tweets(),
              .id = "screenname")
  } else {
    if (reverse == FALSE) { # get only MORE RECENT tweets
      tweets_new <-
        map2_dfr(screenname,
                 max_or_since_id_str,
                 ~ search_tweets(.x, 
                                 include_rts = FALSE, 
                                 `-filter` = "replies", 
                                 since_id = .y,  # to find tweets newer than since_id.
                                 n = n_tweets_per_politician,
                                 retryonratelimit = TRUE,
                                 verbose = verbose) %>% 
                   sanitize_tweets(),
                   .id = "screenname")
    } else {  # get tweets OLDER than max id:
      tweets_new <-
        map2_dfr(screenname,
                 max_or_since_id_str,
                 ~ search_tweets(.x, 
                                 include_rts = FALSE, 
                                 `-filter` = "replies", 
                                 max_id = .y,  # o find tweets older than max_id.
                                 n = n_tweets_per_politician,
                                 retryonratelimit = TRUE,
                                 verbose = verbose) %>% 
                   sanitize_tweets(),
                 .id = "screenname")
    }
  }
  
  
  if (strip_columns) {
    cols_to_select <- c("screenname",
                        "created_at", 
                        "id_str", 
                        "full_text", 
                        "in_reply_to_status_id_str",
                        "in_reply_to_screen_name", 
                        "retweet_count", 
                        "favorite_count",
                        "lang")
    
    if (all(cols_to_select %in% names(tweets_new))) { 
    tweets_new <-
      tweets_new %>% 
      select(all_of(cols_to_select)) 
    
    attr(tweets_new, "users") <- NULL
    
    
    } else {
      warning("There were columns missing. Check the name and number of cols.\n")
      print("The followings columns were missing in the tweets df: \n")
      setdiff(cols_to_select, names(tweets_new))
    }
    
  }
  
  return(tweets_new)
}
