ShowTweets <- function(name){

  library(bitops)
  library(twitteR)
  library(httr)
  library(RCurl)
  library(ROAuth)

  tws <- searchTwitter(name,n=10)
  var_tw <- sapply(tws, function(x) x$getText())
  var_tw
}
