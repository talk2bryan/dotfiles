for file in aliases linux  mac private_aliases
    source ~/.config/fish/includes/$file.fish
end

direnv hook fish | source

