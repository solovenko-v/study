5 CLS
10 INPUT "a=";A
20 INPUT "b=";B
33  INPUT "c=";C
35 INPUT "f=";F
36 INPUT "m1=";M1
37 INPUT "m2=";M2
38 INPUT "m3=";M3
39 INPUT "G=";G
40 INPUT "S=";S
50 PRINT "(1)"
51 PRINT "       E Mz=0     m0-m1+m2-m3=0"
52 PRINT "                  m0=m1-m2+m3=120"
53 PRINT "(2)"
54 PRINT "       Mk1=m0=120                   "
55 PRINT "       Mk2=m0-m1=20                   "
56 PRINT "       Mk3=m0-m1+m2=70                   "
57 PRINT "       Mk4=m0-m1+m2-m3=0                   "
58 PRINT "(3)"
59 PRINT "       Mmk=20=0.5               "
60 PRINT "(4)  (a)"
61 PRINT " S=Mk/Wp=[Sk]  Wp=p*d^3/16         "
62 PRINT " d>=(16*Mk/p*[Sk])^(1/3)=24.8 "
63 PRINT "(4)  (b)"
64 PRINT " O=Mk/G*Ip<[O]             Ip=p*d^4/32 "
65 PRINT " d>=(32*Mk/p*G*[O])^(1/4)=26.7"
66 PRINT "  d=27                      "
67 PRINT "  Wp=0.2*d^3=3.94           "
68 PRINT "  Ip=0.1*d^4=5.31           "
69 PRINT " (5)                         "
70 PRINT "   Smax1=Mk1/Wp=-30.46       "
71 PRINT "   Smaxa2=Mk2/Wp=-5.076      "
72 PRINT "   Smaxc2=Mk2/Wp=-5.076      "
73 PRINT "   Smax3=Mk3/Wp=17.77      "
74 PRINT "                             "
75 PRINT " (6)                         "
76 PRINT "    G*Ip=7.88*10^3           "
77 PRINT "    O2=0.2538                "
78 PRINT "    YA10=Mk1*a/G*Ip=-0.0183 "
79 PRINT "    O0=Mk3*100/G*Ip=0.888   "
80 PRINT "                             "
90 PRINT "   O=YA10/a=-0.0152         "
91 PRINT "   OA2=M2A*100/G*Ip=1.5228"
92 PRINT "   OB2=M2B*100/G*Ip=0.2538 "
93 PRINT "                             "
