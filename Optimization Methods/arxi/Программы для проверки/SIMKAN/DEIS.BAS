10 CLS
20 PRINT ""
30 PRINT ""
40 PRINT ""
50 PRINT ""
60 PRINT TAB(25);"   BEAVIS AND BUTT-HEAD Corp."
65     PRINT TAB(25);"      in association with"
67     PRINT TAB(25);"' S P A C E   B O U N D S ' Inc."
70 PRINT TAB(25);"          present:"
80 PRINT " ";STRING$(78,"�")
90 PRINT TAB(25);"DATA ENCRYPTION INTEGRATED SHELL"
95 PRINT " ";STRING$(78,"�")
100 PRINT ""
110 PRINT ""
120 PRINT ""
130 GOSUB 1200
140 EXITPROG = 0
150 'Mainloop
160 WHILE EXITPROG = 0
170   CLS
180   PRINT ""
190   PRINT "                  ����� ������:"
200   PRINT ""
205   PRINT "     0. ��ᬮ�� 䠩��"
210   PRINT "     1. ���� �� ��ᠭ�樮��஢������ �⥭��"
215   PRINT "     2. �������"
220   PRINT "     3. �����஭��� �������"
225   PRINT "     4. �஢�ઠ �����஭��� ������"
230   PRINT "     5. ������� ����"
235   PRINT "     6. �६���� ��室 � ���"
240   PRINT "     7. ��室"
250 ' Uhoh:
260   K$ = "": WHILE K$ = ""
270     K$ = INKEY$
280   WEND
290   K = ASC(K$) - ASC("0")
300  '
350    IF K = 0 THEN GOSUB 7000: GOTO 900
400    IF K = 1 THEN GOSUB 1150: GOTO 900
450    IF K = 2 THEN GOSUB 4050 : GOTO 900
500    IF K = 3 THEN GOSUB 3000: GOTO 900
550    IF K = 4 THEN GOSUB 5000: GOTO 900
600    IF K = 5 THEN GOSUB 4000: GOTO 900
650    IF K = 6 THEN GOSUB 6000: GOTO 900
700    IF K = 7 THEN EXITPROG = 1: GOTO 900
750    'CASE ELSE
760  COLOR,,63
780        SOUND 1000, .5: SOUND 20000, 2: SOUND 500, 2
790  COLOR,,0:GOTO 250
800  'END SELECT
900 WEND
910 SYSTEM
1000 '��⪠� �ࠢ�� �� �������� PGP v2.2:
1001 'pgp -e ⥪��_䠩� ��_�����⥫� [��㣨�_��]
1002 '����஢��� ⥪�⮢� 䠩� ������ ���箬 �����⥫�.
1003 'pgp -s ⥪��_䠩� [-u ���_��]
1004 '�������� ⥪�⮢� 䠩� ��訬 ᥪ��� ���箬.
1005 'pgp ���_䠩� [-o ⥪��_䠩�]
1006 '�����஢��� 䠩� ��� �஢���� ������� ᮮ�饭��.
1007 'pgp -kg
1008 '������� ��襩 㭨���쭮� ���� ����⮣�/ᥪ�⭮�� ���祩.
1010 'FUNCTION getstr$ (s AS STRING)
1020   PRINT : PRINT
1030   B$ = "": WHILE B$ = ""
1040   ' do
1050     PRINT SS$
1060     INPUT ": ", B$
1070    WEND
1080   GETSTR$ = B$
1090 RETURN 'END FUNCTION
1100 'SUB PGP (s1 AS STRING, s2 AS STRING, s3 AS STRING)
1110   PRINT : PRINT "��뢠� PGP...": PRINT
1120   A$ = "PGP " + A$
1130   SHELL A$: LOCATE 25,1
1131 PRINT:PRINT " ";STRING$(78,"�")
1135 PRINT "������ ���� �������...": GOSUB 1200
1140 RETURN 'END SUB
1150 'SUB protection
1160   SS$ = "������ ��� 䠩��": GOSUB 1010: FILENAME$ = GETSTR$
1170   SS$ = "������ �� �����⥫�": GOSUB 1010: RECIPID$ = GETSTR$
1180   A$ = " -e " + FILENAME$ + " " + RECIPID$
1185   GOSUB 1100
1190 RETURN 'END SUB
1200 'SUB waitakey
1210   WHILE INKEY$ = ""
1220  WEND
1230 RETURN: 'END SUB
3000 ' signature
3010   SS$ = "������ ��� 䠩��": GOSUB 1010: FILENAME$ = GETSTR$
3020   SS$ = "������ �� ��ࠢ�⥫�": GOSUB 1010: RECIPID$ = GETSTR$
3030   A$ = " -s " + FILENAME$ + " -u " + RECIPID$
3040   GOSUB 1100
3050 RETURN
4000 ' keygen
4010  A$ = " -kg " : GOSUB 1100
4020  RETURN
4050 '�������
4060   SS$ = "������ ��� �室���� 䠩��": GOSUB 1010: FILENAME$ = GETSTR$
4065   SS$ = "������ ��� ��室���� 䠩��": GOSUB 1010: OUTFILE$ = GETSTR$
4080   A$ =FILENAME$ + " -o " + OUTFILE$
4085   GOSUB 1100
4090 RETURN 'END SUB
5000 '
5060   SS$ = "������ ��� 䠩��": GOSUB 1010: FILENAME$ = GETSTR$
5080   A$ =FILENAME$
5085   GOSUB 1100
5090 RETURN 'END SUB
6000 'DOS Shell
6010 CLS:PRINT"������ EXIT ��� ������ � DATA ENCRYPTION INTEGRATED SHELL"
6020 PRINT:SHELL:RETURN
7000 'WpView
7010  SS$="������ ��� 䠩��": GOSUB 1010: FILENAME$=GETSTR$
7020 PRINT:PRINT"�맮� �ணࠬ�� ��ᬮ��..."
7030 A$="WPVIEW " + FILENAME$: SHELL A$
7040 RETURN
