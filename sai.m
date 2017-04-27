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
A = [1:64];
H = rows(I)/8;
W = columns(I)/8;
X = zeros(8,8,3,H,W);
anirud = []
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
	for i=1:H
	printf("Three")
		for j=1:W
				X(:,:,[1:3],i,j) = Q(:,:) ./ X(:,:,[1:3],i,j);
		end
	end
ceil(X);
return 
endfunction

function I = decompress(X, J)
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
printf"%d",(size(J))
A = [1:64];
H = rows(J)/8;
W = columns(J)/8;
for i=1:H
printf("Four")
	for j=1:W
		X(:,:,[1:3],i,j) = Q(:,:) .* X(:,:,[1:3],i,j);
	end
end
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
