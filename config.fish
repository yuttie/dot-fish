set fish_greeting

if status --is-login
    set PATH $PATH /usr/bin /sbin
end

# https://bugs.funtoo.org/browse/FL-2006
if status --is-interactive
    keychain --eval --quiet --quick id_ed25519 id_rsa_4096 | source
end
