echo "brew-dependencies"
function brew-deps {
	echo -n $fg[green] $1: $fg[white]; brew deps $1 | awk '{ printf(" %s ", $0) }' ; echo ""
}

function brew-all-deps {
	brew list | while read formula; do echo -n $fg[green] $formula $fg[white]; brew deps $formula | awk '{ printf(" %s ", $0) }'; echo ""; done
}

# vi: ft=zsh
