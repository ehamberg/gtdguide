TEMPLATE=src/lyagtd.template
SRC=src/lyagtd.markdown
TARGET=build/index.html

$(TARGET): build/lyagtd.css build/bootstrap.min.css $(SRC) build/images src/lyagtd.template
	cat $(SRC)\
	| gsed ':a;N;$$!ba;s/@@\([^@]*\)@@/<span class="listname">\1<\/span>/g'\
	| gsed ':a;N;$$!ba;s/\^\^\([^\^]*\)\^\^/<span class="action">\1<\/span>/g'\
	| gsed ':a;N;$$!ba;s/!!\([^!]*\)!!/<span class="context">\1<\/span>/g'\
	| gsed ':a;N;$$!ba;s/~~\([^~]*\)~~/<span class="calendar">\1<\/span>/g'\
	| pandoc -f markdown+smart -s --toc --template=$(TEMPLATE) \
	-c /gtd/bootstrap.min.css \
	-c /gtd/lyagtd.css \
	-o $(TARGET)

build/images: images
	mkdir -p build/images
	cp -R images/* build/images

build/lyagtd.css:
	mkdir -p build
	cp src/lyagtd.css build/lyagtd.css

build/bootstrap.min.css:
	mkdir -p build
	cp src/bootstrap.min.css build/bootstrap.min.css

deploy: $(TARGET)
	aws --profile hamberg.no s3 sync build s3://hamberg.no/gtd/
	aws --profile hamberg.no cloudfront create-invalidation \
		--distribution-id EINNQNCHBL80C \
		--paths /gtd '/gtd/*'
