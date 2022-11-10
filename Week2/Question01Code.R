library(httr)
oauth_endpoints("github")

myapp <- oauth_app("github",
  key = "mykey",
  secret = "mysecret"
)

myapp <- oauth_app("github",
  key = "473be86f22a24a32aed3",
  secret = "7e2483f3970c36642619cd185fbd133fd316adf1"
)

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

gtoken <- config(token = github_token)
req <- GET("https://api.github.com/rate_limit", gtoken)
stop_for_status(req)
content(req)
