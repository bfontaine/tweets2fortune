#! /usr/local/bin/io

args := System args

if (args size < 3,
    """Usage:
        tweets2fortune <username> [<count>] <filename>
            Fetch <count> (default: 200) tweets of <username>, and write it
            in <filename> using fortune format.
    """ println
)


# u := URL with("http://…")
# respond := u fetch
