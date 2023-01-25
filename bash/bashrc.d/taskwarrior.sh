# task warrior aliases
alias in='task add +in'
tickle (){
    deadline=$1
    shift
    in +tickle wait:$deadline $@
}
alias tick=tickle
alias think='tickle +1d'
alias tn='task +next'
alias ti='task in'
alias tl='task list'
alias td='task +DUE'
alias tod='task +OVERDUE'
alias rnd='task add +research +next +@computer +@online'
