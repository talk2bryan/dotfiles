for file in aliases linux
    source ~/.config/fish/includes/$file.fish
end

for file in private
    source ~/.config/fish/private/$file.fish
end

switch (uname)
case Linux
	set -gx PATH /opt/idea-IU-171.4249.39/bin $PATH
	set -gx PATH /usr/local/cuda-9.0/bin $PATH
end
