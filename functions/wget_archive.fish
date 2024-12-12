function wget_archive
  wget \
    --mirror \
    --continue \
    --page-requisites \
    --convert-links \
    --adjust-extension \
    --content-disposition \
    --execute robots=off \
    --wait=1 \
    --span-hosts \
    $argv
end
