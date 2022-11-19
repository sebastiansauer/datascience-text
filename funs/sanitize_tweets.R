sanitize_tweets <- function(tweets_df) {
  
  # make sure all columns we need exist in the df:
  cols_we_need <- c("possibly_sensitive",
                    "metadata",
                    "coordinates",
                    "place",
                    "quoted_status",
                    "quoted_status_id_str",
                    "withheld_in_countries")
  
  cols_to_be_added <- cols_we_need[!cols_we_need %in% names(df)]
  if(length(cols_to_be_added) != 0) tweets_df[cols_to_be_added] <- NA
  
  
  # sometimes the type of some column is `lgl` or `character`, sometimes `list`, 
  # we need to be type-stable, that's why we better stick to `list`:
  tweets_df %>% 
    mutate(possibly_sensitive = list(possibly_sensitive),
           metadata = list(metadata),
           coordinates = list(coordinates),
           place = list(place),
           quoted_status = list(quoted_status),
           quoted_status_id_str = list(quoted_status_id_str),
           withheld_in_countries = list(withheld_in_countries)
    )
}
