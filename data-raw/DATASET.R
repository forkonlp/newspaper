## code to prepare `DATASET` dataset goes here

library(readr)

config_main <- read_csv("./data-raw/config.main.csv")
config_reply <- read_csv("./data-raw/config.reply.csv")

usethis::use_data(config_main,
                  config_reply,
                  overwrite = TRUE, internal = TRUE)
