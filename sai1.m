function [X, I] = sohil
source("z.m")
pkg load signal;
I = imread(input("Please enter the path of image\n"));
Q=[...
    16  11  10  16  24  40  51  61
    12  12  14  19  26  58  60  55
    14  13  16  24  40  57  69  56
    14  17  22  29  51  87  80  62
    18  22  37  56  68  109 103 77
    24  35  55  64  81  104 113 92
    49  64  78  87  103 121 120 101
    72  92  95  98  112 100 103 99];
H = rows(I)/8;
W = columns(I)/8;
X = zeros(8,8,3,H,W);
for J=1:H
printf("One")
	for K = 1:W
		X(:,:,J,K,[1:3]) = I((J-1)*8+[1:8],(K-1)*8+[1:8],[1:3]);
	end
end
Y = X;
for i=1:H
printf("Two")
	for j=1:W
			for D=1:3
			X(:,:,i,j,D) = dct2(X(:,:,i,j,D));
			end
	end
end
	X = X ./ Q;
return
endfunction

function [X, I] = decompress(X, J)
source("z.m")
pkg load signal;
Q=[...
    16  11  10  16  24  40  51  61
    12  12  14  19  26  58  60  55
    14  13  16  24  40  57  69  56
    14  17  22  29  51  87  80  62
    18  22  37  56  68  109 103 77
    24  35  55  64  81  104 113 92
    49  64  78  87  103 121 120 101
    72  92  95  98  112 100 103 99];
H = rows(J)/8;
W = columns(J)/8;
X = X .* Q;
for i=1:H
	printf("Five");
	for j=1:W
		for D=1:3
		X(:,:,i,j,D) = idct2(X(:,:,i,j,D));
		end
	end
end
X = floor(X);
for J=1:H
	printf("Six")
	for K = 1:W
		I((J-1)*8+[1:8],(K-1)*8+[1:8],[1:3]) = X(:,:,J,K,[1:3]) ;
	end
end
	I = I/256;
return 
endfunction
