function tcp_listeners -d "List all the processes listening to TCP connections"
  sudo lsof -iTCP -sTCP:LISTEN -n -P
end
