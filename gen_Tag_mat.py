import os
import sys

f = open('../Info.txt','r');
flines = f.readlines();

fout = open('../Outputmat.txt','w')

for line in flines:
	#  0 -- Men
	if ("Men"in line) or ("Boys" in line):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 1 -- Women
	if ("Women" in line) or ("Girls" in line):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 2 -- Men shirts
	if (("Men" in line) or ("Boys" in line)) and ((" Shirt" in line) or (" shirt" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 3 -- Men checked shirts
	if (("Men" in line) or ("Boys" in line)) and ((" Shirt" in line) or (" shirt" in line)) and (("Checked" in line) or ("checked" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 4 -- Men striped shirts
	if (("Men" in line) or ("Boys" in line)) and ((" Shirt" in line) or (" shirt" in line)) and (("Striped" in line) or ("striped" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 5 -- Men T-shirts
	if (("Men" in line) or ("Boys" in line)) and (("T-Shirt" in line) or ("T-shirt" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 6 -- Men polo T-shirts
	if (("Men" in line) or ("Boys" in line)) and ((" Shirt" in line) or (" shirt" in line)) and (("Polo" in line) or ("polo" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 7 -- Men striped T-shirts
	if (("Men" in line) or ("Boys" in line)) and (("T-Shirt" in line) or ("T-shirt" in line)) and (("Striped" in line) or ("striped" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 8 -- Men checked T-shirts
	if (("Men" in line) or ("Boys" in line)) and (("T-Shirt" in line) or ("T-shirt" in line)) and (("Checked" in line) or ("checked" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 9 -- Men Jackets
	if (("Men" in line) or ("Boys" in line)) and (("Jacket" in line) or ("jacket" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 10 -- Men Hooded Jackets
	if (("Men" in line) or ("Boys" in line)) and (("Jacket" in line) or ("jacket" in line)) and (("Hooded" in line) or ("hooded" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 11 -- Men Sleeveless Jackets
	if (("Men" in line) or ("Boys" in line)) and (("Jacket" in line) or ("jacket" in line)) and (("Sleeveless" in line) or ("sleeveless" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 12 -- Men Sweaters
	if (("Men" in line) or ("Boys" in line)) and (("Sweater" in line) or ("sweater" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 13 -- Men Jeans
	if (("Men" in line) or ("Boys" in line)) and (("Jeans" in line) or ("jeans" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 14 -- Men Shorts
	if (("Men" in line) or ("Boys" in line)) and (("Shorts" in line) or ("shorts" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 15 -- Men Trousers/Pants
	if (("Men" in line) or ("Boys" in line)) and (("Trousers" in line) or ("Pants" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 16 -- women shirts
	if (("Women" in line) or ("Girls" in line)) and ((" Shirt" in line) or (" shirt" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 17 -- women dress
	if (("Women" in line) or ("Girls" in line)) and (("Dress|" in line) or ("dress|" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 18 -- women tops
	if (("Women" in line) or ("Girls" in line)) and (("Top|" in line) or ("top|" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 19 -- women printed tops
	if (("Women" in line) or ("Girls" in line)) and (("Top|" in line) or ("top|" in line)) and(("Printed" in line) or ("printed" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 20 -- women striped tops
	if (("Women" in line) or ("Girls" in line)) and (("Top|" in line) or ("top|" in line)) and(("Striped" in line) or ("striped" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 21 -- women leggings
	if (("Women" in line) or ("Girls" in line)) and (("Leggings" in line) or ("leggings" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 22 -- women skirts
	if (("Women" in line) or ("Girls" in line)) and (("Skirt" in line) or ("skirt" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 23 -- women pants/trousers
	if (("Women" in line) or ("Girls" in line)) and (("Pants" in line) or ("Trousers" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 24 -- Women T-shirts
	if (("Women" in line) or ("Girls" in line)) and (("T-Shirt" in line) or ("T-shirt" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 25 -- Women printed T-shirts
	if (("Women" in line) or ("Girls" in line)) and (("T-Shirt" in line) or ("T-shirt" in line)) and (("Printed"in line) or("printed" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 26 -- Women Sweaters
	if (("Women" in line) or ("Girls" in line)) and (("Sweater" in line) or ("sweater" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 27 -- Women Kurta
	if (("Women" in line) or ("Girls" in line)) and (("Kurta" in line) or ("kurta" in line)or ("kurti" in line) or ("Kurti" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 28 -- Women printed Kurta
	if (("Women" in line) or ("Girls" in line)) and (("Kurta" in line) or ("kurta" in line)or ("kurti" in line) or ("Kurti" in line)) and (("Printed" in line) or ("printed" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 29 -- Women anarkali Kurta
	if (("Women" in line) or ("Girls" in line)) and (("Kurta" in line) or ("kurta" in line)or ("kurti" in line) or ("Kurti" in line)) and (("Anarkali" in line) or ("anarkali" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')
	
	# 30 -- Women churidar Kurta
	if (("Women" in line) or ("Girls" in line)) and (("Kurta" in line) or ("kurta" in line)or ("kurti" in line) or ("Kurti" in line)) and (("Churidar" in line) or ("churidar" in line)):
		fout.write('1 ')
	else:
		fout.write('0 ')

	fout.write('\n')

f.close()
fout.close();
