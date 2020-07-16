#!/bin/sh

for file in src/*; do
    name="${file##*/}"
    {
        cat _header.html
        lowdown --html-no-skiphtml --html-no-escapehtml "$file"
        cat _footer.html
    } >"$1${name%.*}.html"
done

cp -r images css "$1"
