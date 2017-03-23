function compress 
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
for J=1:H
								for K = 1:W
																for D=1:3
																								for j=1:8
																																for k=1:8
																																						X(j,k,D,J,K) = I((J-1)*8+j,(K-1)*8+k,D);
																																endfor
																								endfor
																endfor
								endfor
endfor
for i=1:H
								for j=1:W
																for D=1:3
																								X(:,:,D,i,j) = dct2(X(:,:,D,i,j));
																endfor
								endfor
endfor
for tarun=1:8
								for sohil=1:8
																for i=1:H
																								for j=1:W
																																for D=1:3
																																								X(tarun,sohil,D,i,j) /= Q(tarun,sohil);
																																endfor
																								endfor
																endfor
								endfor
endfor
ceil(X);
endfunction

function decompress(X,H,W,I,A)
for tarun=1:8
								for sohil=1:8
																for i=1:H
																								for j=1:W
																																for D=1:3
																																								X(tarun,sohil,D,i,j) *= Q(tarun,sohil);
																																endfor
																								endfor
																endfor
								endfor
endfor
for i=1:H
								for j=1:W
																for D=1:3
																								A =  zigzag(X(:,:,D,i,j));
																endfor
								endfor
endfor
for i=1:H
								for j=1:W
																for D=1:3
																								X(:,:,D,i,j) = idct2(X(:,:,D,i,j));
																endfor
								endfor
endfor
for J=1:H
								for K = 1:W
																for D=1:3
																								for j=1:8
																																for k=1:8
																																						I((J-1)*8+j,(K-1)*8+k,D) = X(j,k,D,J,K) ;
																																endfor
																								endfor
																endfor
								endfor
endfor
endfunction
