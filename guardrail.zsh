
do-ls() {emulate -L zsh; ls;}


# add do-ls to chpwd hook
add-zsh-hook chpwd do-ls


dco_tag="-s"
cwd=$(pwd)
opensearch="opensearch"

add-dco-for-git-commit() { 
 [[ $cwd =~ $opensearch ]] && ! [[ $BUFFER =~ $dco_tag ]] && BUFFER="${BUFFER//git commit/git commit -s}"; zle .$WIDGET "$@";
}

zle -N accept-line add-dco-for-git-commit

