

count_profane <- function(text, profane_list = schimpf$word) {
  sum((tokenize_words(text, simplify = TRUE) %>% simplify()) %in% profane_list)
}



count_emo_words <- function(text, emo_list = sentiws$word) {
  sum((tokenize_words(text, simplify = TRUE) %>% simplify()) %in% emo_list)
}


count_emojis <- function(text, emoji_list = trimws(emj)){
  sum((tokenize_words(text, simplify = TRUE) %>% simplify()) %in% emoji_list)
}



count_wild_emojis <- function(text, wild_emoji_list = wild_emojis){
  sum((tokenize_words(text, simplify = TRUE) %>% simplify()) %in% wild_emoji_list)
}



