for file in aliases linux private_aliases
    source ~/.config/fish/includes/$file.fish
end

switch (uname)
case Linux
	set -gx PATH /opt/idea-IU-171.4249.39/bin $PATH
	set -gx PATH /usr/local/cuda-9.0/bin $PATH
end
