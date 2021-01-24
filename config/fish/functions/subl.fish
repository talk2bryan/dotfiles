function subl -d 'Open Sublime Text'
  switch (uname)
      case Linux
        /opt/sublime_text_3/sublime_text $argv
      case Darwin
        /usr/local/bin/subl $argv
  end
end
