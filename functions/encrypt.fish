function encrypt
    if test $(count $argv) -eq 0
        # No args: read stdin, write to stdout
        gpg --symmetric --cipher-algo AES256 --no-compress
    else
        for f in $argv
            gpg --symmetric --cipher-algo AES256 --no-compress --output $f.gpg $f
        end
    end
end
