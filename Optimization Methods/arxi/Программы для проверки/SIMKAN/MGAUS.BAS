10 REM ��������� ������� ������� ��������� 1-�� �������
15 PRINT "������� ����������� � ������� N=";:INPUT N
20 DIM A(N ,N ),B(N ),A1(N ,N+1)
25 REM  �1 ������ �1 ��� ����������
40 REM ���� ��������� �������
50 FOR I=1 TO N : PRINT "����� �������� ";I;"-� ������"
60 FOR J=1 TO N: PRINT "A(";I;","J;")";:INPUT A(I,J)
70 NEXT J:PRINT "B(";I;")";:INPUT B(I)
80 PRINT "�������� ����� ��������� ������"
90 FOR J=1 TO N :PRINT A(I,J);" ";:NEXT J : PRINT B(I)
100 PRINT "��� �� �������� ����� ?(Y/N)";:INPUT L$
110 IF L$="Y" THEN 120
115 PRINT "������� ���� ������ ":GOTO 60
120 NEXT I
130 REM ������������� �������� ���������
140 FOR I=1 TO N :FOR J=1 TO N: PRINT A(I,J);" ";:NEXT J
150 PRINT B(I):NEXT I
155 REM ���������� ��� �������� �������
160 PRINT "��� �� ����� ? (Y/N)";:INPUT L$
165 IF L$<>"N" THEN 200
170 PRINT "������� ������ (I) � ������� (J) ";
175 INPUT I,J
180 IF J<>N+1 THEN 190
185 PRINT   "B(";I;")=";:INPUT B(I: GOTO 140
190 PRINT   "A(";I;",";J;")������ ���� ";: INPUT A(I,J)
195 GOTO 140
200 REM ���������� �������� ������
210 FOR I=1 TO N: FOR J=1 TO N:A1(I,J)=A(I,J):NEXT J
220 A1(I,N+1)=B(I): NEXT I
230 PRINT "��� �������"
240 FOR K=1 TO N-1 :GOSUB 300: REM ����������
250 GOSUB 400 :REM ������� �� ������ �������
260 GOSUB 500 :REM ��������� ������� ������
270 NEXT K:K=N: GOSUB 400 :REM ������� ��������� ������
280 GOSUB 600
290 GOSUB 700
300 REM
305 REM
310 M=ABS(A(K,K)):I1=K
315 REM
320 FOR I=K+1 TO N
330 IF M>=ABS(A(I,K)) THEN 340 :M=ABS(A(I,K)):I1=I
340 NEXT I:IF I1= K THEN 390 :REM
350 IFA(I1,K)<>0 THEN 360
355 PRINT "������������ ����� ����":STOP
360 FOR  J=K TO N :REM
370 P=A(I1,J):A(I1,J)=A(K,J):A(K,J)=P
380 NEXT J:P=B(I1):B(I1)=B(K):W(K)=P
390 RETURN
400 REM
410 FOR I=K TO N :A=A(I,K):IF A=0 THEN 440
420 FOR J=K TO N :A(I,J)=A(I,J)/A:NEXT J
430 B(I)=B(I)/A
440 NEXT I
500 REM
510 FOR I=K+1 TO N :IF A(I,K)=0 THEN 540
520 FOR J=K TO N :A(I,J)=A(I,J)-A(K,J):NEXT J
530 B(I)=B(I)-B(K)
540 NEXT I
550 RETURN
600 REM
610 FOR I=N-1 TO 1 STEP -1
620 FOR J=1 TO I
630 B(J)=B(J)-A(J,I+1)*B(I+1):A(J,I+1)=0
640 NEXT J
650 NEXT I
660 RETURN
700 PRINT "���������� ������� �������"
710 FOR I =1 TO N
720 PRINT "X(";I;")=";B(I):NEXT I
730 END
