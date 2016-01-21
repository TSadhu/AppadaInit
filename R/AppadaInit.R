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

  consumer_key <- ''
  consumer_secret <- ''
  access_token <- ''
  access_secret <- ''

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
