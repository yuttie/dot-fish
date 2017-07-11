function eg
  set -q DISPLAY; or set DISPLAY :0
  emacs --display=$DISPLAY $argv&
  disown
end
