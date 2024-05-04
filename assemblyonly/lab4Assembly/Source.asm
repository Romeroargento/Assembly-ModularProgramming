.686
.model flat,stdcall
.stack 100h
.data
x dw 5
f dd ?
.code
ExitProcess PROTO STDCALL :DWORD
Start:
	xor eCx, eCx

	mov ecx, 1000000

	FINIT

loop_start:
	FILD x
	FPTAN
	FDIVR
	FILD x
	FSIN
	FSUB
	FABS
	FSTP f
loop loop_start

exit:
Invoke ExitProcess,1
End Start