function cpu-arch
    gcc -march=native -Q --help=target | sed -ne'/^\s\+-march=\s\+/ { s///; p }'
end
