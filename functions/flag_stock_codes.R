flag_stock_codes <- function(df) {

        # NYSE has 3 digit codes, NASDAQ has 2-5. 
        # there arent a lot of 2 digit codes though so we will use 3-5 to avoid excess false positives       
       df <- df %>%
        mutate(sec_code_1 = unlist(str_extract_all(title,"\\b[A-Z]{3,5}+\\b")[[1]][1]) 
               , sec_code_2 = unlist(str_extract_all(title,"\\b[A-Z]{3,5}+\\b")[[1]][2]) 
               , sec_code_3 = unlist(str_extract_all(title,"\\b[A-Z]{3,5}+\\b")[[1]][3]))
       df
}


# test 1
test %>% filter(id %in% c("l98qhb","l98ppp")) %>% flag_stock_codes()





df <- data.frame(title = character(), id = numeric())%>%
        add_row(title= "THIS is an EXAMPLE where I DONT get the output i WAS hoping for", id = 6)

df <- df %>%
        mutate(sec_code_1 = unlist(str_extract_all(title,"\\b[A-Z]{3,5}\\b")[[1]][1]) 
               , sec_code_2 = unlist(str_extract_all(title,"\\b[A-Z]{3,5}\\b")[[1]][2]) 
               , sec_code_3 = unlist(str_extract_all(title,"\\b[A-Z]{3,5}\\b")[[1]][3]))
df


class(test$title)

