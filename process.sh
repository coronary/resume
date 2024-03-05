div_end="<\/div>"
pandoc -s res.md -o out.html
sed -i '' "s/\(<h2 id=\(\"\w+\"\).+\)/<div class=\2>\n\1/" "out.html"
sed -i '' "s/\(<div class.+\)/$div_end\1/" "out.html"
sed -i '' "s/^$div_end\(.+contacts\)/\1/" "out.html"
sed -i '' "s/<\/body>/$div_end\n&/" "out.html"
sed -i '' "s/<head>/&\n<link rel=\"stylesheet\" href=\"styles.css\">/" "out.html"
current_date="$(date -u +%d-%m-%Y)"
wkhtmltopdf --enable-local-file-access out.html "$current_date_resume.pdf"
