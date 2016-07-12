


## Load stuff


```r
library(request)
```

## Full and partial URLs


```r
api('http://localhost:9200')
```

```
#> URL: http://localhost:9200
```

```r
api('localhost/9200')
```

```
#> URL: http://localhost:localhost/9200
```

```r
api(':9200')
```

```
#> URL: http://localhost:9200
```

```r
api('9200')
```

```
#> URL: http://localhost:9200
```

## Examine request


```r
api('api.github.com') %>%
 api_path(orgs, ropensci, events) %>%
    peep()
```

```
#> <http request> 
#>   url: http://api.github.com
#>   paths: orgs/ropensci/events
#>   query: 
#>   body: 
#>   paging: 
#>   headers: 
#>   rate limit: 
#>   retry (n/delay (s)): /
#>   error handler: 
#>   write: 
#>   config:
```


## Paths

- Build up URL piece by piece


```r
api_path(api("stuff.com"), the, red, fox)
```

```
#> <http request> 
#>   url: http://stuff.com
#>   paths: the/red/fox
#>   query: 
#>   body: 
#>   paging: 
#>   headers: 
#>   rate limit: 
#>   retry (n/delay (s)): /
#>   error handler: 
#>   write: 
#>   config:
```

```r
# gives ‘the/red/fox’
```

## Path templating


```r
x <- list(user = 'a', repo = 'b')
api_template('{{user}}/{{repo}}/', x)
```

```
#> <http request> 
#>   url: http://{{user}}/{{repo}}/
#>   paths: 
#>   query: 
#>   body: 
#>   paging: 
#>   headers: 
#>   rate limit: 
#>   retry (n/delay (s)): /
#>   error handler: 
#>   write: 
#>   config:
```

## Query


```r
api_query(api("stuff.com"), q = ecology, wt = json)
```

```
#> <http request> 
#>   url: http://stuff.com
#>   paths: 
#>   query: q=ecology, wt=json
#>   body: 
#>   paging: 
#>   headers: 
#>   rate limit: 
#>   retry (n/delay (s)): /
#>   error handler: 
#>   write: 
#>   config:
```

## Pipes

 - It’s easy to use pipes or not


```r
'httpbin.org/get' %>% api()
```

```
#> $args
#> named list()
#> 
#> $headers
#> $headers$Accept
#> [1] "application/json, text/xml, application/xml, */*"
#> 
#> $headers$`Accept-Encoding`
#> [1] "gzip, deflate"
#> 
#> $headers$Host
#> [1] "httpbin.org"
#> 
#> $headers$`User-Agent`
#> [1] "libcurl/7.43.0 r-curl/0.9.7 httr/1.2.1 request/0.1.3.9940"
#> 
#> 
#> $origin
#> [1] "71.63.223.113"
#> 
#> $url
#> [1] "http://httpbin.org/get"
```

```r
http(api('httpbin.org/get'))
```

```
#> $args
#> named list()
#> 
#> $headers
#> $headers$Accept
#> [1] "application/json, text/xml, application/xml, */*"
#> 
#> $headers$`Accept-Encoding`
#> [1] "gzip, deflate"
#> 
#> $headers$Host
#> [1] "httpbin.org"
#> 
#> $headers$`User-Agent`
#> [1] "libcurl/7.43.0 r-curl/0.9.7 httr/1.2.1 request/0.1.3.9940"
#> 
#> 
#> $origin
#> [1] "71.63.223.113"
#> 
#> $url
#> [1] "http://httpbin.org/get"
```

## Evaluate on last pipe

We don’t perform http request if not piped


```r
# http request made
'httpbin.org/get' %>% api()
```

```
#> $args
#> named list()
#> 
#> $headers
#> $headers$Accept
#> [1] "application/json, text/xml, application/xml, */*"
#> 
#> $headers$`Accept-Encoding`
#> [1] "gzip, deflate"
#> 
#> $headers$Host
#> [1] "httpbin.org"
#> 
#> $headers$`User-Agent`
#> [1] "libcurl/7.43.0 r-curl/0.9.7 httr/1.2.1 request/0.1.3.9940"
#> 
#> 
#> $origin
#> [1] "71.63.223.113"
#> 
#> $url
#> [1] "http://httpbin.org/get"
```

```r
# http request NOT made
api('httpbin.org/get')
```

```
#> URL: http://httpbin.org/get
```

```r
# call http explicitly
api('httpbin.org/get') %>% http()
```

```
#> $args
#> named list()
#> 
#> $headers
#> $headers$Accept
#> [1] "application/json, text/xml, application/xml, */*"
#> 
#> $headers$`Accept-Encoding`
#> [1] "gzip, deflate"
#> 
#> $headers$Host
#> [1] "httpbin.org"
#> 
#> $headers$`User-Agent`
#> [1] "libcurl/7.43.0 r-curl/0.9.7 httr/1.2.1 request/0.1.3.9940"
#> 
#> 
#> $origin
#> [1] "71.63.223.113"
#> 
#> $url
#> [1] "http://httpbin.org/get"
```

## NSE & SE

NSE


```r
api('https://api.github.com') %>%
    api_path(repos, ropensci, rgbif)
```

```
#> $id
#> [1] 2273724
#> 
#> $name
#> [1] "rgbif"
#> 
#> $full_name
#> [1] "ropensci/rgbif"
#> 
#> $owner
...
```

SE


```r
api('https://api.github.com') %>%
    api_path_('repos', 'ropensci', 'rgbif')
```

```
#> $id
#> [1] 2273724
#> 
#> $name
#> [1] "rgbif"
#> 
#> $full_name
#> [1] "ropensci/rgbif"
#> 
#> $owner
...
```

## Automatic POST w/ body


```r
api('http://httpbin.org/post') %>%
    api_body(foo = 'bar')
```

```
#> $args
#> named list()
#> 
#> $data
#> [1] ""
#> 
#> $files
#> named list()
#> 
#> $form
#> $form$foo
#> [1] "bar"
#> 
#> 
#> $headers
#> $headers$Accept
#> [1] "application/json, text/xml, application/xml, */*"
#> 
#> $headers$`Accept-Encoding`
#> [1] "gzip, deflate"
#> 
#> $headers$`Content-Length`
#> [1] "141"
#> 
#> $headers$`Content-Type`
#> [1] "multipart/form-data; boundary=------------------------a559ee09ea1c115c"
#> 
#> $headers$Host
#> [1] "httpbin.org"
#> 
#> $headers$`User-Agent`
#> [1] "libcurl/7.43.0 r-curl/0.9.7 httr/1.2.1 request/0.1.3.9940"
#> 
#> 
#> $json
#> NULL
#> 
#> $origin
#> [1] "71.63.223.113"
#> 
#> $url
#> [1] "http://httpbin.org/post"
```

## Write to disk helper


```r
api('api.github.com') %>%
 api_path(orgs, ropensci, events) %>%
    api_write(ff <- tempfile())
```

```
#> [1] "/var/folders/gs/4khph0xs0436gmd2gdnwsg080000gn/T//RtmpHIO20U/file922a711e0786"
```
