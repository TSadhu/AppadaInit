#' An Appada Initialization Function
#'
#' This function allows you to do all the Appada twitter Initialization in one step.
#' @param No parameter needed
#' @keywords Appada
#' @export
#' @examples
#' AppadaInit()


AppadaInit <- function(){
  library(bitops)
  library(twitteR)
  library(httr)
  library(RCurl)
  library(ROAuth)

  consumer_key <- 'lpwWWtsF0fsEPh8oqkTkQUz3d'
  consumer_secret <- 'v5RTADyE1jPifpmMA4DoHdjsawMVMZ4wt7tkXYz7x3x0orRjMG'
  access_token <- '2778162067-92UZJdNRHt3a65hdVSy9xcur3rRP6jmVdL2VFZE'
  access_secret <- ' gMxgo1doNcSa0y0PNyafhpvC9GJ2DHALdVvQ1iIRd87ad'

  requestURL <- "https://api.twitter.com/oauth/request_token"
  accessURL <- "https://api.twitter.com/oauth/access_token"
  authURL <- "https://api.twitter.com/oauth/authorize"

  twitCred <- OAuthFactory$new(consumerKey=consumer_key,
                               consumerSecret=consumer_secret,
                               requestURL=requestURL,
                               accessURL=accessURL,
                               authURL=authURL)
  twitCred$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))
  save(twitCred, file="twitter authentication.Rdata")
  load("twitter authentication.Rdata")

  consumer_key = twitCred$consumerKey
  consumer_secret = twitCred$consumerSecret
  access_token = twitCred$oauthKey
  access_secret = twitCred$oauthSecret

  setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)


}
