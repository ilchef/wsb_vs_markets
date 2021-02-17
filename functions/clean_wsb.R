clean_wsb <- function(df) {

        df <- df %>%
                mutate_if(is.factor, as.character)
}