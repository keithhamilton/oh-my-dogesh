# functions

# _sssh
# runs arbitrary command silently, sends all output to /dev/null
_sssh(){ 2>/dev/null 1>&2 $* }

# _git
# substitute for common git commands.
# uses other aliased commands in combination to perform git subcommands
_git(){
    array=($*)
    case "$1" in
        lol)
            git clone "$2"
            ;;
        very)
            git pull ${array[2,-1]}
            ;;
        rly)
            git push ${array[2,-1]}
            ;;
        many)
            git add ${array[2,-1]}
            ;;
        lots)
            git add --all .
            ;;
        plz)
            git commit -m "$2"
            ;;
        *)
            git status
            ;;
    esac        
}

# _shell
# ssh and scp aliases.
# uses other aliased commands in combination to perform ssh subcommands.
_shell(){
    array=($*)
    case "$1" in
        lol)
            ssh -i "$2" "$3"@"$4"
            ;;
        their)
            scp -r "$2" "$3"@"$4":"$5"
            ;;
        heer)
            scp -r "$2"@"$3":"$4" "$5"
            ;;
        *)
            ssh ${array[@]}
            ;;
    esac
}


# command aliases
alias doge='open http://dogeforall.biz/'
alias fetch='wget'
alias lots='find'
alias many='cp -r'
alias much='_shell'
alias notrly='rm -rf'
alias plz='cd'
alias rly='ls -la'
alias so='echo'
alias sssh='_sssh'
alias such='man'
alias very='mkdir -p'
alias want='curl'
alias wow='_git'




