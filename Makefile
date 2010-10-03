all:
	pandoc -S -s --template=lyagtd.template -c lyagtd.css --toc lyagtd.markdown -o lyagtd.html
