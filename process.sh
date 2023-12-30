div_end="<\/div>"
pandoc -so res.md out.html
sed -i '' "s/\(<h2 id=\(\"\w+\"\).+\)/<div class=\2>\n\1/" "out.html"
sed -i '' "s/\(<div class.+\)/$div_end\1/" "out.html"
sed -i '' "s/^$div_end\(.+contacts\)/\1/" "out.html"
sed -i '' "s/<\/body>/$div_end\n&/" "out.html"
sed -i '' "s/<head>/&\n<link rel=\"stylesheet\" href=\"styles.css\">/" "out.html"
wkhtmltopdf --enable-local-file-access out.html processed_resume.pdf
rm out.html
