#include "octave/oct.h"
#include "bits/stdc++.h"
using namespace std;
DEFUN_DLD (hell, args, nargs, "Hey")
{
	NDArray tarunu = args(0).array_value();
	vector<int> a;
	a.push_back(tarunu(0));
	return octave_value(a[0]);
}
