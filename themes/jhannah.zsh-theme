local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT='${ret_status}%{$fg_bold[green]%} %m:%{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

export PATH=~/perl5/perlbrew/bin:$PATH
source ~/perl5/perlbrew/etc/bashrc
# zsh SHARE_HISTORY is gross, and the default. Boo!
setopt no_share_history

# ooo macOS pgrep and pkill! yay!
alias killgoogledrive="pkill -9 -i 'google drive'"

# Javascript stuff
# 211-Connect/Norse wants 18, not 20
export PATH="/usr/local/opt/node@18/bin:$PATH"

# perl6 stuff
export PATH=/Users/jhannah/src/perl6/rakudobrew/bin:/Users/jhannah/src/perl6/rakudo/bin:$PATH

# python3 stuff
export PATH=/Users/jhannah/Library/Python/3.11/bin:$PATH

# sqlite stuff
export PATH="/usr/local/opt/sqlite/bin:$PATH"

# pg stuff
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH
export PGHOST=localhost

# brew stuff / Ruby for jekyll for podcast
export PATH=/usr/local/Cellar/macvim/7.4-77/bin:$PATH
export PATH=/usr/local/Cellar/ruby/3.2.2_1/bin:$PATH
export PATH=/Users/jhannah/.gem/ruby/3.1.0/bin:$PATH

# brew curl
export PATH=/usr/local/opt/curl/bin:$PATH

# ✗ git reset --hard HEAD^
# zsh: no matches found: HEAD^
#     Damn you zsh!
# https://github.com/robbyrussell/oh-my-zsh/issues/449
setopt no_nomatch    # if there are no matches for globs, leave them alone and execute

# Go stuff
export PATH=~/go/bin:$PATH
# Need this for macOS 12.1 Monterey
export MallocNanoZone=0
# go get github.com/jhannah/jira/cmd/jira

# For ssh'ing to jays.net
ssh-add ~/.ssh/github-jhannah.id_rsa

# 95% of the time I'm working in here recently
cd ~/src/ii/productinc/RiverdropAdmin

# --------------------------------------
# Old MediaMath stuff
# --------------------------------------
# qadb() { psql -U adama -h "iad-qa$1db-n1.iad.mmracks.internal" "adama_qa$1"; }
# kubernetes (k8s)
# getpodid() {
#   kubectl get pods -o=name | grep $1 | awk -F "/" '{print $2}'
# }
# if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi
# ssh-add -k ~/nemo_jumpbox.pem
# getdevtoken() {
#   export DEV_JWT=$(curl --silent --request POST --url 'https://mediamath-dev.auth0.com/oauth/token' --header 'content-type: application/json' --data '{"grant_type":"http://auth0.com/oauth/grant-type/password-realm","username": "'$T1_API_USERNAME'","password": "'$T1_API_PASSWORD'","audience": "https://api.mediamath.com/", "client_id": "'$AUTH0_DEV_CLIENTID'", "client_secret": "'$AUTH0_DEV_SECRET'", "realm": "MediaMathActiveDirectory"}' | jq -r '.access_token');
#   echo "DEV_JWT is now set to $DEV_JWT";
# }
# getprodtoken() {
#   export PROD_JWT=$(curl --silent --request POST --url 'https://auth.mediamath.com/oauth/token' --header 'content-type: application/json' --data '{"grant_type":"http://auth0.com/oauth/grant-type/password-realm","username": "'$T1_API_USERNAME'","password": "'$T1_API_PASSWORD'","audience": "https://api.mediamath.com/", "scope": "read:sample", "client_id": "'$AUTH0_PROD_CLIENTID'", "client_secret": "'$AUTH0_PROD_SECRET'", "realm": "MediaMathActiveDirectory"}' | jq -r '.access_token');
#   echo "PROD_JWT is now set to $PROD_JWT";
# }

