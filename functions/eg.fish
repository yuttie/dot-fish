function eg
  set -q DISPLAY; or set DISPLAY :0
  emacs --display=$DISPLAY $argv >/dev/null 2>&1&
  disown
end
