process_bloomberg_file <- function(year){

  file.name <- paste0(year, "_a.xlsx")
  
  path.to.file <- system.file(paste0("extdata/", file.name), package = "April11")
  
  x <- read_excel(path.to.file)
  x$date <- as.Date(x$Date)
  x$figi <- x$FIGI
  x$ticker <- x[, 7] %>% .$Ticker
  x$name <- x$Name
  x$exchange <- x$"Exchange Code"
  x$weight <- x$"Weight as of date"
  x$price <- x$"Price as of date"
  x <- x[c("date", "figi", "ticker", "name", "exchange", "weight", "price")]

  return(x)
}
