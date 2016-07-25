    library(elasticdsl)

Connect
-------

    elastic::connect()

    #> transport:  http 
    #> host:       127.0.0.1 
    #> port:       9200 
    #> path:       NULL 
    #> username:   NULL 
    #> password:   <secret> 
    #> errors:     simple 
    #> headers (names):  NULL

list indices
------------

    indices()

    #>  [1] "testlist"              "diamonds"             
    #>  [3] "geonames"              "shakespeare2"         
    #>  [5] "my-index"              "gbif"                 
    #>  [7] "logstash-2018.02.28"   "twitter"              
    #>  [9] "stuff_x"               "fart"                 
    #> [11] "stuff_w"               "things"               
    #> [13] "asdf"                  "animals"              
    #> [15] "stuff_m"               "stuff_k"              
    #> [17] "stuff_j"               "stuff_i"              
    #> [19] "iris"                  "flowers"              
    #> [21] "stuff_g"               "stuff_e"              
    #> [23] "geoshape"              "diamonds_small"       
    #> [25] "arrests"               "gbifgeopoint"         
    #> [27] "shakespeare"           "diamfromlist"         
    #> [29] "gbifnewgeo"            "hello"                
    #> [31] "asdfdf"                "deer"                 
    #> [33] "afjaljfalsfjalksdf"    "testrgdal"            
    #> [35] "things2"               "gbifgeo"              
    #> [37] "test1"                 "ploss"                
    #> [39] "bbbbbbb"               "foobar"               
    #> [41] "florian"               "pos"                  
    #> [43] "mtcars"                "asdfasd.adf"          
    #> [45] "steam"                 "myindex"              
    #> [47] "diam"                  "omdb"                 
    #> [49] "glopnet"               "alsothat"             
    #> [51] "traitdb"               "afjaljfalsfjalksdfadf"
    #> [53] "testes"                "asdfasfasf"           
    #> [55] "flights"               "diamponds"            
    #> [57] "stuff"

get an index
------------

    index("mtcars")

    #> <index> mtcars 
    #>   type: 
    #>   mappings: 
    #>     mtcars: 
    #>       am: long 
    #>       carb: long 
    #>       cyl: long 
    #>       disp: long 
    #>       drat: double 
    #>       gear: long 
    #>       hp: long 
    #>       mpg: double 
    #>       qsec: double 
    #>       vs: long 
    #>       wt: double

    index("omdb")

    #> <index> omdb 
    #>   type: 
    #>   mappings: 
    #>     omdb: 
    #>       Actors: string 
    #>       Awards: string 
    #>       Country: string 
    #>       Director: string 
    #>       Error: string 
    #>       Genre: string 
    #>       Language: string 
    #>       Metascore: string 
    #>       Plot: string 
    #>       Poster: string 
    #>       Rated: string 
    #>       Released: string 
    #>       Response: string 
    #>       Runtime: string 
    #>       Title: string 
    #>       Type: string 
    #>       Writer: string 
    #>       Year: string 
    #>       fullname: string 
    #>       imdbID: string 
    #>       imdbRating: string 
    #>       imdbVotes: string 
    #>       plot: string 
    #>       totalSeasons: string

    index("shakespeare")

    #> <index> shakespeare 
    #>   type: 
    #>   mappings: 
    #>     act: 
    #>       line_id: long 
    #>       line_number: string 
    #>       play_name: string 
    #>       speaker: string 
    #>       speech_number: string 
    #>       text_entry: string 
    #>     line: 
    #>       line_id: long 
    #>       line_number: string 
    #>       play_name: string 
    #>       speaker: string 
    #>       speech_number: string 
    #>       text_entry: string 
    #>     scene: 
    #>       line_id: long 
    #>       line_number: string 
    #>       play_name: string 
    #>       speaker: string 
    #>       speech_number: string 
    #>       text_entry: string

    index("shakespeare", "scene")

    #> <index> shakespeare 
    #>   type: scene 
    #>   mappings: 
    #>     scene: 
    #>       line_id: long 
    #>       line_number: string 
    #>       play_name: string 
    #>       speaker: string 
    #>       speech_number: string 
    #>       text_entry: string

basic query
-----------

    res <- index("shakespeare") %>% query("prefix", speaker = "we")
    vapply(res$hits$hits, "[[", "", c('_source', 'speaker'))

    #>  [1] "WESTMORELAND" "WESTMORELAND" "WESTMORELAND" "WESTMORELAND"
    #>  [5] "WESTMORELAND" "WESTMORELAND" "WESTMORELAND" "WESTMORELAND"
    #>  [9] "WESTMORELAND" "WESTMORELAND"

or use the function prefix

    res <- index("shakespeare") %>% prefix(speaker = "we")
    vapply(res$hits$hits, "[[", "", c('_source', 'speaker'))

    #>  [1] "WESTMORELAND" "WESTMORELAND" "WESTMORELAND" "WESTMORELAND"
    #>  [5] "WESTMORELAND" "WESTMORELAND" "WESTMORELAND" "WESTMORELAND"
    #>  [9] "WESTMORELAND" "WESTMORELAND"

`from()`, `size()`, `n()`

    index("shakespeare") %>% 
      from(1) %>% 
      size(5)

    #> $took
    #> [1] 2
    #> 
    #> $timed_out
    #> [1] FALSE
    #> 
    #> $`_shards`
    #> $`_shards`$total
    #> [1] 5
    #> 
    ...

`n()`

    index("shakespeare") %>% 
      size(5) %>% 
      n()

    #> [1] 4999

inspect query
-------------

    index("shakespeare") %>% 
      prefix(speaker = "we") %>% 
      describe()

    #> <elasticdsl query>
    #>   base: :9200
    #>   index: shakespeare
    #>   query: 
    #> {
    #>     "query": {
    #>         "prefix": {
    #>             "speaker": "we"
    #>         }
    #>     }
    #> }

Access results
--------------

Same as with `elastic` package

Parse
-----

Get hits directly

    index("shakespeare") %>% ids(1, 2, 150) %>% hits()

    #> [[1]]
    #> [[1]]$`_index`
    #> [1] "shakespeare"
    #> 
    #> [[1]]$`_type`
    #> [1] "line"
    #> 
    #> [[1]]$`_id`
    #> [1] "2"
    #> 
    ...

`tabl()` attempts to parse hits to a data.frame

    index("shakespeare") %>%
      prefix(speaker = "we") %>%
      size(50) %>% 
      tabl()

    #> # A tibble: 44 x 6
    #>    line_id play_name speech_number line_number      speaker
    #>      <int>     <chr>         <int>       <chr>        <chr>
    #> 1       41  Henry IV             2      1.1.38 WESTMORELAND
    #> 2       42  Henry IV             2      1.1.39 WESTMORELAND
    #> 3       45  Henry IV             2      1.1.42 WESTMORELAND
    #> 4       49  Henry IV             2      1.1.46 WESTMORELAND
    #> 5       53  Henry IV             4      1.1.50 WESTMORELAND
    #> 6       61  Henry IV             4      1.1.58 WESTMORELAND
    #> 7       80  Henry IV             6      1.1.77 WESTMORELAND
    #> 8       99  Henry IV             8      1.1.96 WESTMORELAND
    #> 9      100  Henry IV             8      1.1.97 WESTMORELAND
    #> 10     111  Henry IV            10     1.1.108 WESTMORELAND
    #> # ... with 34 more rows, and 1 more variables: text_entry <chr>

> not all data will parse so easily to a data.frame
