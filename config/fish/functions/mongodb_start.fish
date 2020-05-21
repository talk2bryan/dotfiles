function mongodb_start -d "Start MongoDB service"
  switch (uname)
  case Linux
	sudo service mongod start
  end
end
