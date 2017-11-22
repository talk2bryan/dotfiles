
function cleanupds -d 'Recursively remove .DS_Store files'
  find . -type f -name '*.DS_Store' -ls -delete
end

function drjava -d 'Run DrJava in background'
  java -jar /usr/share/applications/drjava-beta-20160913-225446.jar &
end

# Simple functions that are basically aliases

function .. -d 'Go to prev dir'
  cd ..
end

function ... -d 'Go up 2 dirs'
  cd ../..
end

function .... -d 'Go up 3 dirs'
  cd ../../..
end

function ..... -d 'Go up 4 dirs'
  cd ../../../..
end

function mkcd -d 'mkdir and cd'
  mkdir $argv
  cd $argv
end

####################################
# Setting -- as a function does    #
# work for now. Quick fix.         #
####################################
#function -- -d 'Go to previous dir'
#  cd -
#end 
abbr -a -- - 'cd -'
####################################

alias cl 'wc -l'

function cloc -d 'Count Lines of Code (except node_modules)'
  command cloc --exclude-dir=node_modules $argv
end

function cx -d 'Make file executable'
  chmod +x $argv
end

function d -d 'Go to Dropbox'
    cd ~/Dropbox
end

function proj -d 'Got to Projects dir'
  cd ~/Projects
end

function md -d 'Shortcut for creating dirs'
  mkdir $argv
end

function dblab -d 'Go to COMP4710'
    cd ~/Dropbox/University/Summer17/COMP4710
end

function dl -d 'Go to Downloads'
    cd ~/Downloads
end

# TODO (whoami): look for a clever alias for desktop
#function dt -d 'Go to Desktop'
#    cd ~/Desktop
#end

function dt -d 'ISO 8601 format for the current date'
  date "+%Y-%m-%d" $argv
end

function fn -d 'Shorthand for (functions)'
  functions $argv
end

function g -d 'Alias for (git)'
    git $argv
end

function gs -d 'Concise (git status)'
    git status -sb
end

function ga -d 'Concise (git add)'
    git add $argv
end

function gaa -d 'Concise (git add all)'
    git add .
end

function gc -d 'Concise (git commit)'
    git commit -m $argv
end

# Shorthand for all the common HTTP methods
for method in GET HEAD POST PUT DELETE TRACE OPTIONS
    # Using backwards-compatible alias syntax in Fish
    alias $method "lwp-request -m $method"
end

function grunt -d 'Grunt (with stack traces)'
    command grunt --stack $argv
end

function l -d 'List files'
    ll $argv
end

function lha -d 'Lish all files including hidden files as a list in human readable format'
  ls -lahA $argv
end

function lsa -d 'List all files in short format'
  ls -aFG $argv
end

function lsd -d 'List only directories in current directory'
  ls -ld */
end

function ldi -d 'List only directories in given directory'
  ls -l $argv | grep "^d" --color=never
end

function map -d 'Intuitive map function'
 xargs -n1 $argv
end

function nout -d 'npm outdated --depth=0'
  npm outdated --depth=0 $argv
end

function pgl -d 'Find matching running processes'
  pgrep -lf $argv
end

function install -d 'Install packages'
  sudo apt-get install -y $argv
end

function remove -d 'uninstall packages'
  sudo apt-get remove -y $argv
end

function cls -d 'clear terminal console'
  clear
end
