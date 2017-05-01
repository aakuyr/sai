#include "octave/oct.h"

DEFUN_DLD (hell, args, nargs, "Hey")
{
	if (args.length () < 1)
    		print_usage ();
	octave_stdout<<"Hello World\n";
	NDArray tarunu = args(0).array_value();
	return octave_value(tarunu);
}
