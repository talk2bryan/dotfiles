for file in aliases linux  mac private_aliases
    source ~/.config/fish/includes/$file.fish
end

for file in ~/.config/fish/functions/*
    source $file

status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

direnv hook fish | source

