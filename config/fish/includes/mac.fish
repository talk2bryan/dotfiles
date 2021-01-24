set -g PATH "/usr/local/opt/mysql-client/bin" $PATH

set -g fish_user_paths "/usr/local/opt/mysql-client/bin" $fish_user_paths
set -gx LDFLAGS "-L/usr/local/opt/mysql-client/lib"
set -gx CPPFLAGS "-I/usr/local/opt/mysql-client/include"
