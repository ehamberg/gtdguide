TEMPLATE=src/lyagtd.template
CSS=src/lyagtd.css
SRC=src/lyagtd.markdown
TARGET=lyagtd.xhtml

all:
	pandoc -S -s --toc --template=$(TEMPLATE) -c $(CSS) $(SRC) -o $(TARGET)
