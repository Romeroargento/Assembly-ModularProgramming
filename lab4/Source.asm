.586 
.XMM
.MODEL flat,C 

.DATA 
result DD 10 dup (0.0)
temp DD ?
index dd 0

.CODE 
extern fun_el:near ; ���������� ������� ������� fun_el 

public FuncValue 
FuncValue proc C n:DWORD, x:DWORD
	FINIT
	xor ebx, ebx

loop_start:
	cmp ebx, ecx; ��������� �������� � ������� �������
	jge endo

	mov edx, dword ptr [eax] ; �������� ������� �������� ������� � edx
	push ecx ; ���������� ������� �������
	push eax ; ���������� �������
	push edx ; �������� �������� ������� � ������� fun_el
	call fun_el
	pop edx
	pop eax
	pop ecx
	add eax, 4 ; ������� �� ��������� ������� ������� 
	fstp result[ebx*4] ; �������� ������ � ������ result
	inc ebx; ���������� �������� 

	jmp loop_start

endo:
	mov eax, offset result ; �������� ������ ������� result � eax
	ret
	FuncValue endp 
End 
