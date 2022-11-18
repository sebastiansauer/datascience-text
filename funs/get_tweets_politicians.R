# authentificate at Twitter API:


get_tweets_politicians <- function(verbose = TRUE) {
  library(rtweet)
  library(tidyverse)
  library(lubridate)
  source("/Users/sebastiansaueruser/credentials/hate-speech-analysis-v01-twitter.R")
  auth <- rtweet_app(bearer_token = Bearer_Token)
  
  # Get list of Twitter screennames:
  politicians_twitter_path <- "/Users/sebastiansaueruser/github-repos/datascience-text/data/twitter-german-politicians.csv"
  stopifnot(file.exists(politicians_twitter_path))
  politicians_twitter <- rio::import(file = politicians_twitter_path)
  
  # Define constants:
  n_tweets_per_politician <- 1e3
  data_path <- "/Users/sebastiansaueruser/datasets/Twitter/hate-speech/"
  
  # source funs:
  source("/Users/sebastiansaueruser/github-repos/datascience-text/funs/download_recent_tweets.R")
  source("/Users/sebastiansaueruser/github-repos/datascience-text/funs/filter_recent_tweets.R")
  #source("funs/add_tweets_to_tweet_db.R")
  
  # find all datafiles:
  data_files_df <- 
    tibble(data_files =  list.files(path = data_path,
                                   pattern = "\\.rds$"),
           data_files_date = str_extract(data_files, pattern = "\\d{4}-\\d{2}-\\d{2}") %>% as_date(),
           date_most_recent = data_files_date == max(data_files_date))
  
  # identify most reecent data file:
  data_file_most_recent <-
    data_files_df %>% 
    filter(date_most_recent == TRUE)
  
  if (verbose) print(paste0("Most recent date: ", data_file_most_recent$date_most_recent, "\n"))
  
  
  # load existing database
  tweets_db <- read_rds(file = paste0(data_path, data_file_most_recent$data_files))
  
  # What are the most recent tweets that we have?
  most_recent_tweets <- filter_recent_tweets(tweets_db)
 
  #debug(download_recent_tweets)
  tweets_new <- download_recent_tweets(screenname = most_recent_tweets$screenname,
                                       max_or_since_id_str = most_recent_tweets$id_str)
  
  if (verbose) print(paste0("Number of tweets downloaded: ", nrow(tweets_new), "\n"))
  
  #undebug(add_tweets_to_tweets_db)
  # tweets_db <- add_tweets_to_tweets_db(tweets_new, tweets_older)
  
  # save to disk again:
  write_rds(tweets_new, file = paste0(data_path, "hate-speech-twitter_", today(), ".rds"))
  
  print("Saved to a csv file.\n")
  
}



#get_tweets_politicians()
