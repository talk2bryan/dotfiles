switch (uname)
case Linux
	function upd -d 'Run common software updates'
	    sudo apt-get update -qq
	    sudo apt-get upgrade -y
	    sudo snap refresh
	end
end
