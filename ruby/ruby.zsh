# bundler
alias b="bundle"
alias be="bundle exec"

# Tests and Specs
alias t="ruby -I test"
alias cuc="bundle exec cucumber"

# Rubygems
alias gi="gem install"
alias giv="gem install -v"

# Rails
alias migrate="rake db:migrate && rake db:rollback && rake db:migrate && rake db:test:prepare"
alias m="migrate"
alias rk="rake"
alias s="rspec"
alias z="zeus"

# rspec
alias specs="rspec --format=documenation"
