

library(tidyverse)
library(easystats)
library(tidymodels)
library(tidytext)
library(textrecipes)
#library(lsa)  # stopwords
#library(discrim)  # naive bayes classification
#library(naivebayes)
library(tictoc)  # Zeitmessung
#library(fastrtext)  # Worteinbettungen
library(tokenizers)  # Vektoren tokenisieren
library(pradadata)  # helper data
library(remoji)   # processing emojis
#library(furrr)  # multisession
library(feather)  # Daten speichern




# train data:
d1 <- read_rds("/Users/sebastiansaueruser/github-repos/datascience-text/objects/d1.rds")  # Traindaten einlesen

d_split <- initial_split(d1, strata = c1)

d_train <- training(d_split)
d_test <- testing(d_split)


# # helper funs:
# source("funs/helper-funs-recipes.R")
# 
# 
# # helper data:
# data("schimpwoerter")
# data("sentiws")
# data("wild_emojis")
# 
# # recipe1a:
# 
# rec1a <- 
#   recipe(c1 ~ ., data = select(d_train, text, c1, id)) %>% 
#   update_role(id, new_role = "id") %>% 
#   step_text_normalization(text) %>% 
#   step_mutate(text_copy = text,
#               profane_n = map_int(text_copy, count_profane, profane_list = schimpfwoerter$word),
#               emo_words_n = map_int(text_copy, count_emo_words, emo_list = sentiws$word),
#               emojis_n = map_int(text_copy, count_emojis, emoji_list = emoji(list_emoji(), pad = FALSE)),
#               wild_emojis_n = map_int(text_copy, count_wild_emojis, wild_emoji_list = wild_emojis$emojis)
#   ) %>% 
#   step_tokenize(text) %>% 
#   step_stopwords(text, language = "de", stopword_source = "snowball") %>% 
#   step_stem(text) %>% 
#   step_tokenfilter(text, max_tokens = 1e2) %>% 
#   step_tfidf(text) %>%  
#   step_zv(all_predictors()) %>% 
#   step_normalize(all_numeric_predictors())
# 
# rec1_prepped <- prep(rec1a)

rec1_prepped <- read_rds("/Users/sebastiansaueruser/github-repos/datascience-text/objects/rec2_prepped.rds")




# recipe 2


rec2_prepped <- read_rds("/Users/sebastiansaueruser/github-repos/datascience-text/objects/rec2_prepped.rds")


# source helper funs:
source("/Users/sebastiansaueruser/github-repos/datascience-text/funs/helper-funs-recipes.R")


# import helper data:
data("schimpwoerter")
data("sentiws")
data("wild_emojis")


# predict data, unbaken:
ds <- read_feather(path = "/Users/sebastiansaueruser/datasets/Twitter/hate-classific/ds.feather")


# predict data, baken:
d_predict_baken <- read_rds("/Users/sebastiansaueruser/datasets/Twitter/hate-classific/d_predict.rds")





# add metadata to predict dataset:
d_predict2 <-
  d_predict_baken %>% 
  left_join(ds, by = "id") %>% 
  relocate(dataset, id, author_id, created_at, text, retweet_count, reply_count, quote_count, .after = id) %>% 
  mutate(id2 = id,
         id = as.integer(id)) %>% 
  mutate(tranch_id = row_number() %% 1e2)


# rm, in order to save memory:
rm(ds)
rm(d_predict_baken)



# load model:
fit3_final_train <- read_rds("/Users/sebastiansaueruser/datasets/Twitter/hate-classific/fit3_final_train.rds")




# simple test:
tic()
d_predicted_values_tiny <- predict(fit3_final_train, head(d_predict2, 1e4))
toc()




predict_and_tell <- function(x, x_name) {
  
  pred_file <- predict(fit3_final_train, x)
  write_rds(pred_file, paste0("objects/predict2_classific_", x_name, ".rds"))
  cat("completed.\n")
}



n_tranches <- length(unique(d_predict2$tranch_id))






for (i in 1:2){
  
  tic()
  current_data <- 
    d_predict2 %>% 
    filter(tranch_id == i)
  
  current_preds <-
    predict(fit3_final_train, current_data)
  
  current_i_str <- str_pad(i, width = 4, side = "left", pad = "0")
  
  write_rds(current_preds, paste0("objects/predict2_classific_", current_i_str, ".rds"))
  cat("completed.\n")
  toc()
  
}
