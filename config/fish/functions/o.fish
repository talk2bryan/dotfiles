function o -d 'Open files or current dir if no args'
    if test -z $argv[1]
        xdg-open .
    else
        xdg-open $argv
    end
end
