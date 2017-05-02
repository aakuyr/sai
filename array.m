function [V, B] = array(A);
	V = []
	for i = 1:prod(size(A))
		if (sum(V(:) == A(i)) == 0)
			V = [ V A(i) ]
		end
	end
	B = []
	for i = 1:prod(size(V))
		B = [ B sum(A(:) == V(i)) ]
	end
return 	
endfunction	
