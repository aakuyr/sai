function v = saizag(A)
	v = [];
 	for i=1:rows(A)+columns(A)-1
	J=max(1,i-rows(A)+1);
	count=min(min(rows(A), i), columns(A)-J+1);
	for j=0:count-1
		if(mod(i,2)==0)
		    v = [ v A(min(i,rows(A))-j, j+J,[1:3]) ];
		else
			 v = [ v A(j+J, min(i,rows(A))-j, [1:3]) ];
		end	
		endfor
	endfor
	return 
	endfunction

function A=isaizag(v)
	A = zeros(8,8); erza=1;
	for i=1:rows(A)+columns(A)-1
		J=max(1,i-rows(A)+1);
		count=min(min(rows(A), i), columns(A)-J+1);
		for j=0:count-1
			if(mod(i,2)==0)
					A(min(i, rows(A))-j,j+J)=v(erza);
			else
					A(j+J,min(i, rows(A))-j)=v(erza);
			end	
			erza+=1;
		endfor
	end	
	endfunction

