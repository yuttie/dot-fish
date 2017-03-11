function encrypt
  for f in $argv
    gpg --output $f.gpg --cipher-algo AES256 -z 0 --symmetric $f
  end
end
