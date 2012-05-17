#! /usr/local/bin/io

args := System args

if ((args size < 3) or (args size > 4),
    """Usage:
        tweets2fortune <username> [<count>] <filename>
            Fetch <count> (default: 200) tweets of <username>, and write it
            in <filename> using fortune format.
    """ println

    System exit
)

username := URL escapeString(args at(1))
count := if(args size >= 4,
                (args at(2)) asNumber,
                200
         )
filename := args at(-1)

if (count <= 0,
    "Tweets count must be a valid positive number." println
    System exit
)

# TODO use a loop when count > 200
query := "screen_name=" .. username .. "&count=" .. count

url := URL with("http://api.twitter.com/1/statuses/user_timeline.json")
url query := query
url request := url request .. "?" .. query

response := url fetch
tweets := Yajl parseJson(response) map(t, t at("text"))

# TODO delete URLs from tweets

# TODO continue
