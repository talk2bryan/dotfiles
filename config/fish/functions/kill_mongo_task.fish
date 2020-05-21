function kill_mongo_task -d "Kill mongo instance running in the background"
  tcp_listeners | grep mongod | awk '{print $2}' | xargs sudo kill
end
