function subl -d 'Open Sublime Text'
  switch (uname)
      case Linux
        /usr/bin/subl $argv
      case Darwin
        /usr/local/bin/subl $argv
  end
end
