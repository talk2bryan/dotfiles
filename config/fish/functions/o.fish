function o -d 'Open files or current dir if no args'
    if test -z $argv[1]
        switch (uname)
            case Linux
              xdg-open .
            case Darwin
              open .
        end
    else
        switch (uname)
            case Linux
              xdg-open $argv
            case Darwin
              open $argv
        end
    end
end
