10 L=0
20 CLS:PRINT "������� ����":INPUT X$
30 PRINT "������� �����":INPUT A$
40 N=LEN(A$):K=LEN(X$)
50 DIM A$(N),B(N),C$(N),X$(N)
60 FOR I=1 TO N
70 L=L+1
80 A$(I)=MID$(A$,I,1)
90 X$(I)=MID$(X$,L,1)
100 B(I)=ASC(A$(I))+ASC(X$(I))
110 IF L=K THEN L=0
120 NEXT I
130 PRINT "������"
140 FOR I=1 TO N
150 C$(I)=CHR$(B(I))
160 NEXT I
170 CLS
180 PRINT "����� �� ����� �������������� ������.���� ���,�� ������� N"
190 INPUT S$
200 IF S$="N" THEN 390
210 FOR I=1 TO N
220 PRINT C$(I);
230 NEXT I
240 X$="0"
250 PRINT
260 PRINT "������� 1 ��� ���������� ����� ����� �����"
270 INPUT S:IF S<>1 THEN 390
280 PRINT "����� ����������.��� ���������� ������� ����"
290 INPUT X$
300 FOR I=1 TO N
310 A$(I)=CHR$(B(I)-ASC(X$(I)))
320 NEXT I
330 PRINT "���������� �����������.�������� �����"
340 PRINT
350 FOR I=1 TO N
360 PRINT A$(I);
370 NEXT  I
380 PRINT
390 PRINT "������ ��������.GOOD BUY"
400 END
