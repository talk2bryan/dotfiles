function subl -d 'Open Sublime Text'
  switch (uname)
      case Linux
        /opt/sublime_text_3/sublime_text
      case Darwin
        /usr/local/bin/subl
      end
end
