function cpu-arch
  gcc -march=native -Q --help=target | grep march | cut -f3
end
