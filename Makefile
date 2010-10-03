all:
	pandoc -s -H header.txt -c lyagtd.css --toc lyagtd.markdown -o lyagtd.html
