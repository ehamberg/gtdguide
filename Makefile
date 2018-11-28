TEMPLATE=src/lyagtd.template
CSS=src/lyagtd.css
SRC=src/lyagtd.markdown
TARGET=lyagtd.html

all:
	cat $(SRC)\
	| gsed ':a;N;$$!ba;s/@@\([^@]*\)@@/<span class="listname">\1<\/span>/g'\
	| gsed ':a;N;$$!ba;s/\^\^\([^\^]*\)\^\^/<span class="action">\1<\/span>/g'\
	| gsed ':a;N;$$!ba;s/!!\([^!]*\)!!/<span class="context">\1<\/span>/g'\
	| gsed ':a;N;$$!ba;s/~~\([^~]*\)~~/<span class="calendar">\1<\/span>/g'\
	| pandoc -f markdown+smart -s --toc --template=$(TEMPLATE) -c src/bootstrap.min.css -c $(CSS) -o $(TARGET)
