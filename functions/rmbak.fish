function rmbak
  find ~/ -name '*~' | xargs --max-args=1 rm -fv
end
