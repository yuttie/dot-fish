function ppjson --argument-names file
    zstdcat $file | jq . | bat -l json --file-name $file
end
