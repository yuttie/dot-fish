function clean-home
  find ~/ -name '*~' -o -name 'nohup.out' -o -name 'persp-auto-save*' -exec rm -fv '{}' \;
end
