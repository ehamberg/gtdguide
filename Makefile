TEMPLATE=src/lyagtd.template
CSS=src/lyagtd.css
SRC=src/lyagtd.markdown
TARGET=lyagtd.html

all:
	cat $(SRC)\
	| sed ':a;N;$$!ba;s/@@\([^@]*\)@@/<span class="listname">\1<\/span>/g'\
	| sed ':a;N;$$!ba;s/\^\^\([^\^]*\)\^\^/<span class="action">\1<\/span>/g'\
	| sed ':a;N;$$!ba;s/!!\([^!]*\)!!/<span class="context">\1<\/span>/g'\
	| sed ':a;N;$$!ba;s/~~\([^~]*\)~~/<span class="calendar">\1<\/span>/g'\
	| pandoc -S -s --toc --template=$(TEMPLATE) -c $(CSS) -o $(TARGET)
