function [X, I, A] = sohil1
source("z.m")
pkg load signal;
pkg load image;
I = imread(input("Please enter the path of image\n"));
Q=[...
    16  11  10  16  1   1   1   1
    12  12  14  1   1   1   1   55
    14  13  1   1   1   1   69  56
    14  1   1   1   1   87  80  62
    1   1   1   1   68  109 103 77
    1   1   1   64  81  104 113 92
    1   1   78  87  103 121 120 101
    1  92  95  98  112 100 103 99];
H = rows(I)/8;
W = columns(I)/8;
X = zeros(8,8,3,H,W);
A = []
for J=1:H
printf("One")
	for K = 1:W
		X(:,:,[1:3],J,K) = I((J-1)*8+[1:8],(K-1)*8+[1:8],[1:3]);
	end
end
for i=1:H
printf("Two")
	for j=1:W
			for D=1:3
			X(:,:,D,i,j) = dct2(X(:,:,D,i,j));
			end
	end
end
	X = X ./ Q;
	X = round(X);
for i=1:H
	printf("Hey");
	for j=1:W
			A = [A ; saizag(X(:,:,[1:3],i,j))];

	end
end
return
endfunction

function [X, I] = decompress(A, J)
source("z.m")
pkg load signal;
H = rows(J)/8;
W = columns(J)/8;
X = zeros(8,8,3,H,W);
Q=[...
    16  11  10  16  1   1   1   1
    12  12  14  1   1   1   1   55
    14  13  1   1   1   1   69  56
    14  1   1   1   1   87  80  62
    1   1   1   1   68  109 103 77
    1   1   1   64  81  104 113 92
    1   1   78  87  103 121 120 101
    1  92  95  98  112 100 103 99];
for i=1:H
	for j=1:W
		for D=1:3
			X(:,:,D,i,j) = isaizag(A(j+(i-1)*W,:,D));
		end
	end
end
X = X .* Q;
X = floor(X);
for i=1:H
	printf("Five");
	for j=1:W
		for D=1:3
		X(:,:,D,i,j) = idct2(X(:,:,D,i,j));
		end
	end
end
for J=1:H
	printf("Six")
	for K = 1:W
		I((J-1)*8+[1:8],(K-1)*8+[1:8],[1:3]) = X(:,:,[1:3],J,K) ;
	end
end
return 
endfunction
