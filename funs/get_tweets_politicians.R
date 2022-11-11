# authentificate at Twitter API:


get_tweets_politicians <- function() {
  library(rtweet)
  library(tidyverse)
  source("/Users/sebastiansaueruser/credentials/hate-speech-analysis-v01-twitter.R")
  auth <- rtweet_app(bearer_token = Bearer_Token)
  
  # Get list of Twitter screennames:
  politicians_twitter_path <- "/Users/sebastiansaueruser/github-repos/datascience-text/data/twitter-german-politicians.csv"
  stopifnot(file.exists(politicians_twitter_path))
  politicians_twitter <- rio::import(file = politicians_twitter_path)
  
  # Define constants:
  n_tweets_per_politician <- 1e3
  
  # source funs:
  source("funs/filter_recent_tweets.R")
  source("funs/download_recent_tweets.R")
  source("funs/add_tweets_to_tweet_db.R")
  
  # load existing database
  tweets_db <- read_rds(file = "~/datasets/Twitter/hate-speech-twitter.rds")
  
  # What are the most recent tweets that we have?
  most_recent_tweets <- filter_recent_tweets(tweets_db)
 
  #debug(download_recent_tweets)
  tweets_new <- download_recent_tweets(screenname = most_recent_tweets$screenname,
                                       max_or_since_id_str = most_recent_tweets$id_str)
  
  #undebug(add_tweets_to_tweets_db)
  tweets_db <- add_tweets_to_tweets_db(tweets_new, tweets_older)
  
  # save to disk again:
  write_rds(tweets_db, file = "~/datasets/Twitter/hate-speech-twitter.rds")
}



get_tweets_politicians()
