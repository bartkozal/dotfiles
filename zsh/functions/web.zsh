alias b='bundle'
alias be='bundle exec'

alias httpserver="ruby -run -e httpd . -p3000"

function diki {
  open -a WebKit "http://www.diki.pl/slownik-angielskiego/?q=$1"
}
