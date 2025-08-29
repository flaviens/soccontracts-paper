all: main

main:
		latexmk -pdflatex="pdflatex -halt-on-error -shell-escape %O %S" -pdf main

.PHONY:
clean:
		latexmk -c
		rm -f ./main.aux ./main.log ./main.pdf ./main.bbl ./main.blg ./main.out

.PHONY:
latexdiff:
		git latexdiff sec23-round1 HEAD -o diff.pdf -v --filter="sed 's/^.*pgfpicture.*//g'" --exclude-safecmd=ref,cref,Cref,cite,SI,cmidrule,numrange,hspace,SIrange,mited --config='PICTUREENV=(?:DIFnomarkup|minted|table)[\w\d*@]*'
