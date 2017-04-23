function clean-home
  find ~/ -name '*~' -o -name 'nohup.out' -o -name 'persp-auto-save*' | xargs --max-args=1 rm -fv
end
