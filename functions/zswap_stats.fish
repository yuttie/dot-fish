function zswap_stats
  set -l stored_pages $(sudo cat /sys/kernel/debug/zswap/stored_pages)
  set -l pool_total_size $(sudo cat /sys/kernel/debug/zswap/pool_total_size)
  set -l stored_size $(math "4096 * $stored_pages")
  echo Page size: $(math "$stored_size / 1024^2") MiB
  echo Comp. size: $(math "$pool_total_size / 1024^2") MiB
  echo Comp. ratio: $(math "$stored_size / $pool_total_size")
end
