

getForex <- function(start_date, end_date, from, to) {
  ## from <- "USD"; to <- "PHP"; start_date <- "2022-04-01"; end_date <- "2022-04-10"
  forex_raw <- priceR::historical_exchange_rates(
    from = from, to = to,
    start_date = start_date, end_date = end_date)

  ## Clean data
  forex_clean <- forex_raw %>%
    dplyr::rename(PHP = `one_USD_equivalent_to_x_PHP`, Date = date) %>%
    dplyr::mutate(
      ## Set data source
      SOURCE = "European Central Bank Statistical Data Warehouse",
      ## Set ActivityInfo ID for upload
      X.id = sprintf(fmt = "c%d", as.integer(Date)))

  return(forex_clean)
}

