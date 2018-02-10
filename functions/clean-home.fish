function clean-home
  find ~/ -type f \( -name '*~' -o -name 'nohup.out' -o -name 'persp-auto-save*' \) -exec rm -fv '{}' \;
end
