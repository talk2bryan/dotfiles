for file in aliases linux
    source ~/.config/fish/includes/$file.fish
end

switch (uname)
case Linux
	set -gx PATH $PATH /opt/idea-IU-171.4249.39/bin
end
