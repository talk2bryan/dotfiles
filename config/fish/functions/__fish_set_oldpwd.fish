function __fish_set_oldpwd --on-variable dirprev
  set -g OLDPWD $dirprev[-1]
end
