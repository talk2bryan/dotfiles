function mongodb_stop -d "Stop MongoDB service"
  switch (uname)
  case Linux
    sudo service mongod stop
  end
end
