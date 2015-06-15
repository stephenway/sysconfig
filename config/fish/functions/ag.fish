set -g -x AG_BIN (which ag)

function actual_ag
  # Fuck you fish this is fucking ridiculous.  Let me use $AG_BIN as
  # a command.  Or at least give me a way to do it like run $AG_BIN args or
  # something jesus.
  if test $AG_BIN = '/usr/local/bin/ag'
    /usr/local/bin/ag $argv
  else
    if test $AG_BIN = '/usr/bin/ag'
      /usr/bin/ag $argv
    else
      echo "Fish is a dick, sorry."
    end
  end
end

function ag -d "Run Ag with appropriate options."
  if test -f '.agignore'
  # Extra if statement because I can't figure out how to && things in
  # a fish conditional and the documentation does not see fit to explain
  # that little tidbit and can we please get a shell without complete
  # bullshit as a scripting language syntax?
    if grep -q 'pragma: skipvcs' '.agignore'
    # If .agignore contains pragma: skipvcs, then we'll run ag in
    # "disregard .gitignore/.hgignore/svn:ignore" mode.  This lets us
    # still search in files the VCS has ignored.
    actual_ag --search-files -U $argv
  else
    actual_ag --search-files $argv
  end
  else
    actual_ag --search-files $argv
  end
end
