function a = encrypt
	a = input("Enter your message\n");
	a = toascii(a);
	a += 1;
	a = char(a);
	return
endfunctn
