#include "math.h"

extern "C" float fun_el(float x) {
	float f;
	f = fabsf(1 / tanf(x) - sinf(x));
	return f;
}