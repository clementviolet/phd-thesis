#!/bin/bash

# Functions
## Function to convert Markdown to LaTeX
convert_markdown_to_latex() {
    pandoc -f markdown -t latex "$1" -o "$2" --top-level-division=chapter --filter pandoc-crossref --citeproc --biblatex --bibliography=Src/biblio.bib
}

## Function to convert LaTeX to MS Word and move the file
convert_markdown_to_word() {
    pandoc -f markdown -t docx "$1" -o "$2" --filter pandoc-crossref --citeproc --bibliography=Src/biblio.bib
    mv "$2" Rendered/Word/
}

## Function to convert LaTeX to PDF and clean up
convert_latex_to_pdf() {

    cd Src

    # pdflatex main.tex
    lualatex main.tex
    biber main.bcf
    lualatex main.tex
    lualatex main.tex 
    rm -f main.{ps,bcf,run.xml}

    # Cleaning -up
    for suffix in dvi aux bbl blg toc lof lot ind out brf ilg idx synctex.gz log; do
        find . -type d -name ".git" -prune -o -type f -name "*.$suffix" -print -exec rm {} \;
    done

    mv main.pdf ../Rendered/pdf

    cd -
}

## Function to move LaTeX files
move_latex_files() {
    mv "$1" Rendered/LaTeX/
}

# Determine action based on argument
if [ "$1" == "latex" ] || [ "$1" == "pdf" ]; then
    # Convert Markdown to LaTeX
    convert_markdown_to_latex "Src/01-Acknowledgement/acknowledgement.md" "Src/01-Acknowledgement/acknowledgement.tex"
    convert_markdown_to_latex "Src/02-Introduction/introduction.md" "Src/02-Introduction/introduction.tex"
    convert_markdown_to_latex "Src/03-Chapitre1/chapitre1.md" "Src/03-Chapitre1/chapitre1.tex"
    convert_markdown_to_latex "Src/03-Chapitre2/chapitre2.md" "Src/03-Chapitre2/chapitre2.tex"
    convert_markdown_to_latex "Src/03-Chapitre3/chapitre3.md" "Src/03-Chapitre3/chapitre3.tex"
    convert_markdown_to_latex "Src/04-Conclusion/conclusion.md" "Src/04-Conclusion/conclusion.tex"

    if [ "$1" == "pdf" ]; then
        convert_latex_to_pdf
    fi
    mv Src/01-Acknowledgement/acknowledgement.tex  Src/02-Introduction/introduction.tex Src/03-Chapitre*/chapitre*.tex Src/04-Conclusion/conclusion.tex Rendered/LaTeX
elif [ "$1" == "docx" ]; then
    case "$2" in
        all)
            convert_markdown_to_word "Src/02-Introduction/introduction.md" "02-introduction.docx"
            chapters=("chapitre1" "chapitre2" "chapitre3")
            for chapter in "${chapters[@]}"; do
                convert_markdown_to_word "Src/03-$chapter/$chapter.md" "03-$chapter.docx"
            done
            convert_markdown_to_word "Src/04-Conclusion/conclusion.md" "04-conclusion.docx"
            ;;
        standalone)
            pandoc -f markdown -t docx Src/02-Introduction/introduction.md \
                Src/03-Chapitre1/chapitre1.md Src/03-Chapitre2/chapitre2.md \
                Src/03-Chapitre3/chapitre3.md \
                Src/04-Conclusion/conclusion.md -o Rendered/Word/05-Standalone.docx \
                --filter pandoc-crossref --citeproc --bibliography=Src/biblio.bib
            ;;
        introduction)
            convert_markdown_to_word "Src/02-${2}/${2}.md" "02-${2}.docx"
            ;;
        chapitre1|chapitre2|chapitre3)
            convert_markdown_to_word "Src/03-${2}/${2}.md" "03-${2}.docx"
            ;;
        conclusion)
            convert_markdown_to_word "Src/04-${2}/${2}.md" "04-${2}.docx"
            ;;
        *)
            echo "Invalid argument: $2"
            ;;
    esac
fi
