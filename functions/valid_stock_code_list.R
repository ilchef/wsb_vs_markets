valid_stock_code_list <- function(df) {

valid_nasdaq <- read.delim("http://ftp.nasdaqtrader.com/dynamic/SymDir/nasdaqlisted.txt",sep = "|") %>%
        select(Symbol,Security.Name) %>%
        mutate(Stock.Exchange = "NASDAQ")
valid_nyse <- read.delim("http://ftp.nasdaqtrader.com/dynamic/SymDir/otherlisted.txt",sep = "|") %>%
        transmute(Symbol = ACT.Symbol
                  , Security.Name = Security.Name
                  , Stock.Exchange = "Other")
rbind(valid_nasdaq,valid_nyse)
}