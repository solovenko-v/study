10 DEF FNF (X) = X ^ 3 + X ^ 2 - 3
20 INPUT A
30 INPUT B
40 PRINT "F("; A; ")="; FNF(A)
50 PRINT "F("; B; ")="; FNF(B)
60 C = (A + B) / 2: PRINT "CEPEDNHA OTPE3KA:"; C
70 PRINT "‡€—…ˆ… ”“Š–ˆˆ ‚ ‘……„ˆŽ‰ ’Ž—Š… :"; "F("; C; ")="; FNF(C)
80 IF FNF(A) * FNF(C) < 0 THEN B = C: GOTO 110
90 A = C: GOTO 110
110 IF ABS(B - A) > .001 THEN PRINT "Žƒ…˜Ž‘’œ Ž‹œ˜… ‡€„€Ž‰.Ž„Ž‹†€…Œ ‚›—ˆ‘‹…ˆŸ"; ABS(B - A): GOTO 60
120 X = (A + B) / 2: Y = ABS(B - A)
130 PRINT "Ž’‚…’"; X; "+-"; Y
140 END
