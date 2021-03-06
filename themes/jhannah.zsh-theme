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

# perl6 stuff
export PATH=/Users/jhannah/src/perl6/rakudobrew/bin:/Users/jhannah/src/perl6/rakudo/bin:$PATH

# python3 stuff
export PATH=/Users/jhannah/Library/Python/3.5/bin:$PATH

# pg stuff
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH
export PGHOST=localhost

# brew stuff
export PATH=/usr/local/Cellar/macvim/7.4-77/bin:$PATH
export PATH=/usr/local/Cellar/ruby/3.0.1/bin:$PATH

# ✗ git reset --hard HEAD^
# zsh: no matches found: HEAD^
#     Damn you zsh!
# https://github.com/robbyrussell/oh-my-zsh/issues/449
setopt no_nomatch    # if there are no matches for globs, leave them alone and execute

# Make sbt (Scala) happy
# http://www.jayway.com/2014/01/15/how-to-switch-jdk-version-on-mac-os-x-maverick/
#function setjdk() {
#  if [ $# -ne 0 ]; then
#    removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
#    if [ -n "${JAVA_HOME+x}" ]; then
#      removeFromPath $JAVA_HOME
#    fi
#    export JAVA_HOME=`/usr/libexec/java_home -v $@`
#    export PATH=$JAVA_HOME/bin:$PATH
#  fi
#}
#function removeFromPath() {
#  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
#}
# Uhh... I haven't used Scala in forever
# setjdk 1.7


# kubernetes (k8s)
getpodid() {
  kubectl get pods -o=name | grep $1 | awk -F "/" '{print $2}'
}
if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi

# 95% of the time I'm working in here recently
# cd ~/src/ii/mm/core-serializer
cd ~/src/ii/mm/campaigns-api

qadb() { psql -U adama -h "iad-qa$1db-n1.iad.mmracks.internal" "adama_qa$1"; }
qa() { ssh -p722 "iad-qa$1-n$2.iad.mmracks.internal"; }
getdevtoken() {
  export DEV_JWT=$(curl --silent --request POST --url 'https://mediamath-dev.auth0.com/oauth/token' --header 'content-type: application/json' --data '{"grant_type":"http://auth0.com/oauth/grant-type/password-realm","username": "'$T1_API_USERNAME'","password": "'$T1_API_PASSWORD'","audience": "https://api.mediamath.com/", "client_id": "'$AUTH0_DEV_CLIENTID'", "client_secret": "'$AUTH0_DEV_SECRET'", "realm": "MediaMathActiveDirectory"}' | jq -r '.access_token');
  echo "DEV_JWT is now set to $DEV_JWT";
}
getprodtoken() {
  curl --silent --request POST --url 'https://mediamath.auth0.com/oauth/token' --header 'content-type: application/json' --data '{"grant_type":"http://auth0.com/oauth/grant-type/password-realm","username": "'$T1_API_USERNAME'","password": "'$T1_API_PASSWORD'","audience": "https://api.mediamath.com/", "scope": "manage:services", "client_id": "'$AUTH0_PROD_CLIENTID'", "client_secret": "'$AUTH0_PROD_SECRET'", "realm": "MediaMathActiveDirectory"}' | jq -r '.access_token'
}

# Go stuff
export PATH=~/go/bin:$PATH
# go get github.com/jhannah/jira/cmd/jira

