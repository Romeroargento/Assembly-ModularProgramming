.586 
.XMM
.MODEL flat,C 

.DATA 
result DD 10 dup (0.0)
temp DD ?
index dd 0

.CODE 
extern fun_el:near ; объ€вление внешней функции fun_el 

public FuncValue 
FuncValue proc C n:DWORD, x:DWORD
	FINIT
	xor ebx, ebx

loop_start:
	cmp ebx, ecx; сравнение итерации и размера массива
	jge endo

	mov edx, dword ptr [eax] ; передача первого элемента массива в edx
	push ecx ; сохранение размера массива
	push eax ; сохранение массива
	push edx ; передача элемента массива в функцию fun_el
	call fun_el
	pop edx
	pop eax
	pop ecx
	add eax, 4 ; переход на следующий элемент массива 
	fstp result[ebx*4] ; передача ответа в массив result
	inc ebx; увеличение итерации 

	jmp loop_start

endo:
	mov eax, offset result ; передача адреса массива result в eax
	ret
	FuncValue endp 
End 
