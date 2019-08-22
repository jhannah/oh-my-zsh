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
# Make vagrant happy
ssh-add ~/.ssh/id_rsa

# perl6 stuff
export PATH=/Users/jhannah/src/perl6/rakudobrew/bin:/Users/jhannah/src/perl6/rakudo/bin:$PATH

# python3 stuff
export PATH=/Users/jhannah/Library/Python/3.5/bin:$PATH

# pg stuff
export PATH=/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH
export PGHOST=localhost

# fancy vim
export PATH=/usr/local/Cellar/macvim/7.4-77/bin:$PATH

# ✗ git reset --hard HEAD^
# zsh: no matches found: HEAD^
#     Damn you zsh!
# https://github.com/robbyrussell/oh-my-zsh/issues/449
setopt no_nomatch    # if there are no matches for globs, leave them alone and execute

# Make sbt (Scala) happy
# http://www.jayway.com/2014/01/15/how-to-switch-jdk-version-on-mac-os-x-maverick/
function setjdk() {
  if [ $# -ne 0 ]; then
    removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
    if [ -n "${JAVA_HOME+x}" ]; then
      removeFromPath $JAVA_HOME
    fi
    export JAVA_HOME=`/usr/libexec/java_home -v $@`
    export PATH=$JAVA_HOME/bin:$PATH
  fi
}
function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}
# Uhh... I haven't used Scala in forever
# setjdk 1.7


# kubernetes (k8s)
getpodid() {
  kubectl get pods -o=name | grep $1 | awk -F "/" '{print $2}'
}
if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi

# 95% of the time I'm working in here
cd src/ii/mm/adama

