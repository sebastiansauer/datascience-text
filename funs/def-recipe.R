def_recipe <- function(data_train, small = TRUE) {
  
  data("schimpwoerter", package = "pradadata")
  data("sentiws", package = "pradadata")
  data("wild_emojis", package = "pradadata")
  source("helper-funs/helper-funs-recipes.R")
  
  n_tokens <- 1e2
  
  if (small) n_tokens = 1e1
  
  d_reduced <- data_train %>% select(text, c1, id)
  
  recipe(c1 ~ ., data = d_reduced) %>%
    update_role(id, new_role = "id") %>%
    #textrecipes::step_text_normalization(text) %>%
    #recipes::step_mutate(text_copy = text
                # profane_n = map_int(text_copy, count_profane, profane_list = schimpfwoerter$word),
                # emo_words_n = map_int(text_copy, count_emo_words, emo_list = sentiws$word),
                # emojis_n = map_int(text_copy, count_emojis, emoji_list = remoji::emoji(remoji::list_emoji(), 
                #                                                                        pad = FALSE)),
                # wild_emojis_n = map_int(text_copy, count_wild_emojis, wild_emoji_list = wild_emojis$emojis)
    #) %>%
    #textrecipes::step_textfeature(text_copy) %>% 
    step_tokenize(text) %>%
    #textrecipes::step_stopwords(text, language = "de", stopword_source = "snowball") %>%
    #textrecipes::step_stem(text) %>%
    step_tokenfilter(text, max_tokens = n_tokens) %>%
    step_tfidf(text) %>%
    step_zv(all_predictors()) %>%
    step_normalize(all_numeric_predictors())
}


# 
# rec1 <- def_recipe(dd)
# rec1

