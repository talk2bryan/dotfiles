function heic2jpg -d "Convert all HEIC files to jpg"
    for file in *.heic; heif-convert "$file" (string replace -ar "\.heic\$" "\.jpg" "$file"); rm $file end
    for file in *.HEIC; heif-convert "$file" (string replace -ar "\.HEIC\$" "\.jpg" "$file"); rm $file end
end
