INCLUDE Irvine32.inc
.data
    t1 dd 0
    t2 dd 0
    v dd 0
    v1 dd 0
    v2 dd 0
    v3 dd 0
  over dd 0
   bal dd 0
     msg BYTE " Computer played:", 0
    msg1 byte " You are Out",0
    msg2 byte " Total:",0
   choic byte " Enter your choice:",0
    toss byte " Press 1 for Head and 0 for tails:",0
    msg5 byte " You lost the toss",0
     bat byte " You won the toss and you are batting now!",0
   intro byte "                                                  Welcome to BSCS-3D Cricket league! ",0
    msg8 byte " Your total Score:",0
    msg9 byte " Computer is batting now!",0
   msg10 byte " Enter your ball:",0
   msg11 byte " Computer is out!",0
   msg12 byte " Hurraahhhh :)! You won!",0
   msg13 byte " Alas :( You lost!",0
   msg14 byte " You are batting now!",0
   msg15 byte " Your total score: ",0
   msg16 byte " Computer total score: ",0
   msg17 byte " Do you want to play again? (y/n)",0
   msg18 byte " You are bowling now!",0 
   msg19 byte " Enter number of overs: ",0
   msg20 byte " Total number of balls: ",0
   msg21 byte " Balls left: ",0
   msg22 byte " Invalid number entered! select 1 minimum",0
   game1 byte "                                                    This game is brought to you by ",0
   game2 byte "                                Abdullah Ghazi-196    Muhammad Abdullah-161    Badar Khalid-192  ",0
.code
main PROC
   mov edx,OFFSET intro
   call writestring
   call crlf
   mov edx,offset game1
   call writestring
   call crlf
   mov edx,offset game2
   call writestring
   call crlf
main1:
   mov v1,0
   mov v2,0
   mov v3,0
   mov v,0
   mov edx,offset msg19
   call writestring
   call readint
   mov ecx,eax
   cmp ecx,0
   jle invalid
   jg valid
invalid:
   mov edx,offset msg22
   call writestring
   call crlf
   jmp main1
valid:
   mov ebx,6
   mul ebx
   mov over,eax
   mov bal,eax
   mov edx,offset msg20
   call writestring
   mov eax,over
   call writedec
   call crlf
   call crlf
   call randomize
   mov eax, 2
   call RandomRange
   mov t1,eax
   mov edx,offset toss
   call writestring
   call readint
   mov t2,eax
   mov eax,t1
   cmp t2,eax
   je batting
   jne bowling

batting proc
   mov edx,OFFSET bat
   call writestring
   call crlf
batt1:
    mov v1,0
    mov v2,0
    mov v3,0
    sub bal,1
    cmp bal,0
    jl ball1
    mov edx,OFFSET choic
    call WriteString
    call Randomize
    mov eax, 10
    call RandomRange
    mov ebx,eax
    call readint
    mov ecx,eax
    mov edx,OFFSET msg
    call WriteString
    mov eax,ebx
    call writedec
    call crlf
    mov edx,offset msg21
    call writestring
    cmp ecx,ebx
    je o
    add v,ecx
    mov eax,bal
    call Writedec
    call crlf
    mov edx,offset msg2
    call writestring
    mov eax,v
    call writedec
    call crlf
    jmp batt1
o:
    mov eax,ebx
    call Writedec
    call crlf
    call crlf
    mov edx,offset msg1
    call writestring
    call crlf
    call crlf
    mov edx,offset msg8
    call writestring
    mov eax,v
    call writedec
    call crlf
ball1:
    call crlf
    mov ebx,over
    mov edx,offset msg18
    call writestring
    call crlf
    call crlf
balll1:
    mov edx,offset msg10
    call writestring
    call readint
    mov ebx,eax
    mov edx,offset msg
    call writestring
    call Randomize
    mov eax, 10
    call RandomRange
    mov ecx,eax
    call writedec
    call crlf
    mov edx,offset msg21
    call writestring
    sub over,1
    mov eax,over
    call writedec
    call crlf
    cmp over,0
    je decision
    cmp ecx,ebx
    je o1
    add v1,ecx
    mov ebx,v1
    cmp ebx,v
    jge l
    mov edx,offset msg2
    call writestring
    mov eax,v1
    call writedec
    call crlf
    jmp balll1
o1:
    call crlf
    mov edx,offset msg11
    call writestring
    call crlf
decision:
    mov edx,offset msg15
    call writestring
    mov eax,v
    call writedec
    call crlf
    mov edx,offset msg16
    call writestring
    mov eax,v1
    call writedec
    call crlf
    mov ecx,v
    cmp v1,ecx
    jl w
    jg l

w:
    call crlf
    mov edx,offset msg12
    call writestring
    call crlf
    jmp endd1
l:
    call crlf
    mov edx,offset msg2
    call writestring
    mov eax,v1
    call writedec
    call crlf
    mov edx,offset msg8
    call writestring
    mov eax,v
    call writedec
    call crlf
    mov edx,offset msg13
    call writestring
    call crlf
    jmp endd1

endd1: 
    batting endp
    mov edx,offset msg17
    call writestring
    call readchar
    mov ebx,eax
    call crlf
    cmp bl,"y"
    je main1
    exit

bowling proc
    bolling:
    mov edx,OFFSET msg5
    call writestring
ball2:
    call crlf
    call crlf
    mov edx,offset msg9
    call writestring
    call crlf
    mov v1,0
    mov v2,0
    mov v3,0
balll2:
    sub bal,1
    cmp bal,0
    jl batt2
    call crlf
    mov edx,offset msg10
    call writestring
    call readint
    mov ecx,eax
    mov edx,offset msg
    call writestring
    call Randomize
    mov eax, 10
    call RandomRange
    mov ebx,eax
    mov eax,ebx
    call writedec
    call crlf
    mov edx,offset msg21
    call writestring
    mov eax,bal
    call writedec
    cmp ebx,ecx
    je o2
    add v1,ebx
    call crlf
    mov edx,offset msg2
    call writestring
    mov eax,v1
    call writedec
    jmp balll2
o2:
    call crlf
    mov edx,offset msg11
    call writestring
    call crlf
    call crlf
    mov edx,offset msg16
    call writestring
    mov eax,v1
    call writedec
    call crlf
batt2:
    call crlf
    mov edx,offset msg14
    call writestring
    call crlf
    call crlf
battt2:
    sub over,1
    cmp over,0
    jl next
    mov edx,offset choic
    call writestring
    call readint
    mov ecx,eax
    call Randomize
    mov eax, 10
    call RandomRange
    mov ebx,eax
    mov v3,ebx
    mov edx,offset msg
    call writestring
    mov eax,ebx
    call writedec
    call crlf
    mov edx,offset msg21
    call writestring
    mov eax,over
    call writedec
    call crlf
    mov ebx,v1
    cmp v,ebx
    jge w1
    cmp ecx,v3
    je next
    add v,ecx
    mov edx,offset msg2
    call writestring
    mov eax,v
    call writedec
    call crlf
    jmp battt2
  
next:
    mov edx,offset msg1
    call writestring
    call crlf
    mov edx,offset msg2
    call writestring
    mov eax,v
    call writedec
    call crlf
    mov eax,v1
    cmp eax,v
    jl w1
    jg l1

w1:
    mov edx,offset msg2
    call writestring
    mov eax,v
    call writedec
    call crlf
    mov edx,offset msg12
    call writestring
    jmp endd2
l1:
    call crlf
    mov edx,offset msg13
    call writestring
    jmp endd2
endd2:
    bowling endp
    mov edx,offset msg17
    call writestring
    call readchar
    mov ebx,eax
    call crlf
    cmp bl,"y"
    je main1
    exit
main ENDP
END main