function v = saizag(A)
	v = []
 for i=1:rows(A)+columns(A)-1
									J=max(1,i-rows(A)+1)
									count=min(min(rows(A), i), columns(A)-J+1)
									for j=0:count-1
																	if(mod(i,2)==0)
																			min(i,rows(A))
																	else
																	end	
										endfor
	endfor
	return 
	endfunction

function isaizag(v)
	A = zeros(3); erza=1;
	for i=1:rows(A)+columns(A)-1
									J=max(1,i-rows(A)+1);
									count=min(min(rows(A), i), columns(A)-J+1);
									for j=0:count-1
																	if(mod(i,2)==0)
																			A(min(i, rows(A))-j,j+J)=v(erza)
																	else
																			A(j+J,min(i, rows(A))-j)=v(erza)
																	end	
																	erza+=1
										endfor
	endfor
	endfunction

