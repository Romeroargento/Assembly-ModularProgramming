.586 
.XMM
.MODEL flat,C 

.DATA 
result DD 10 dup (0.0)

.CODE 
extern fun_el:near ; îáúÿâëåíèå âíåøíåé ôóíêöèè fun_el 

public FuncValue 
FuncValue proc C n:DWORD, x:DWORD
	FINIT
	xor ebx, ebx

loop_start:
	cmp ebx, ecx; ñðàâíåíèå èòåðàöèè è ðàçìåðà ìàññèâà
	jge endo

	mov edx, dword ptr [eax] ; ïåðåäà÷à ïåðâîãî ýëåìåíòà ìàññèâà â edx
	push ecx ; ñîõðàíåíèå ðàçìåðà ìàññèâà
	push eax ; ñîõðàíåíèå ìàññèâà
	push edx ; ïåðåäà÷à ýëåìåíòà ìàññèâà â ôóíêöèþ fun_el
	call fun_el
	pop edx
	pop eax
	pop ecx
	add eax, 4 ; ïåðåõîä íà ñëåäóþùèé ýëåìåíò ìàññèâà 
	fstp result[ebx*4] ; ïåðåäà÷à îòâåòà â ìàññèâ result
	inc ebx; óâåëè÷åíèå èòåðàöèè 

	jmp loop_start

endo:
	mov eax, offset result ; ïåðåäà÷à àäðåñà ìàññèâà result â eax
	ret
	FuncValue endp 
End 
