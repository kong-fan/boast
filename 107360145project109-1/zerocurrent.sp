****zerocurrentdect****

.include  'C:\synopsys\Hspice_A-2008.03\Models\Lib.sp'

.subckt nor vo a b vdd gnd
mpa vdd a mpas vdd p_18_mm w=3u l=0.18u m=1
mpb mpas b vo vdd p_18_mm w=3u l=0.18u m=1
mna vo a gnd gnd n_18_mm w=1u l=0.18u m=1
mnb vo b gnd gnd n_18_mm w=1u l=0.18u m=1
.ends nor

.subckt nand vo a b vdd gnd
mpa vdd a vo vdd p_18_mm w=3u l=0.18u m=1
mpb vdd b vo vdd p_18_mm w=3u l=0.18u m=1
mna vo a mnas gnd n_18_mm w=1u l=0.18u m=1
mnb mnas b gnd gnd n_18_mm w=1u l=0.18u m=1
.ends nand

.subckt inv vo vin vdd gnd
mp1 vdd vin vo vdd p_18_mm w=3u l=0.18u m=1
mn1 vo vin gnd gnd n_18_mm w=1u l=0.18u m=1
.ends inv 

.subckt rs qbar r s vdd gnd
Xnor1 q r qbar vdd gnd nor
Xnor2 qbar q s vdd gnd nor
.ends rs

.subckt  not  vout  vin   vdd   gnd    
mp1  vout  vin  vdd   vdd   p_18_mm   w=3u   l=0.18u  m=1
mn1  vout  vin  gnd   gnd   n_18_mm   w=1u   l=0.18u  m=1
.ends not

.subckt hysteresiscompare vo vinp vinn vbias vdd gnd
mp1   a    a    vdd   vdd   p_18_mm   w=3u   l=0.18u   m=2
mn1   a    b    gnd   gnd   n_18_mm   w=1u   l=0.18u   m=1
mp2   b   Vinn  c     vdd   p_18_mm   w=3u   l=0.18u   m=2
mn2   b    b    gnd   gnd   n_18_mm   w=1u   l=0.18u   m=2
mp3   c   Vbias    vdd   vdd   p_18_mm   w=3u   l=0.18u   m=1
mn3   d    b    gnd   gnd   n_18_mm   w=1u   l=0.18u   m=2
mp4   d   Vinp  c     vdd   p_18_mm   w=3u   l=0.18u   m=2
mn4   b   d     gnd   gnd   n_18_mm   w=1u   l=0.18u   m=2
mp5   e   a     vdd   vdd   p_18_mm   w=3u   l=0.18u   m=2
mn5   d   d     gnd   gnd   n_18_mm   w=1u   l=0.18u   m=2
mn6   e   d     gnd   gnd   n_18_mm   w=1u   l=0.18u   m=1
Xnot1   f      e    vdd    gnd    not
Xnot2   Vc   f    vdd    gnd    not
.ends hysteresiscompare

.subckt delaycell vo vin vdd gnd
Xinv con vin vdd gnd inv
Xinv2 vo con vdd gnd inv
.ends delaycell

Xrs vzcd norout delaycellout vdd gnd rs
Xnor norout comout delaycellout vdd gnd nor
Xdelay delaycellout vn vdd gnd delaycell
Xcom comout vx vout vbias vdd gnd hysteresiscompare

vdd vdd 0 1.8
vbias vbias 0 1.8
vgnd gnd 0 0
va vx gnd pulse(0 1.8 5u 1p 1p 5u 10u)
vb vout gnd pulse(1.8 0 5u 1p 1p 5u 10u)
vc vn gnd pulse(1.8 0 0 1p 1p 10u 20u)

.op
.option
.tran 80p 100u

.end