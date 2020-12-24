****comparator****

.include  'C:\synopsys\Hspice_A-2008.03\Models\Lib.sp'

.subckt  not  vout  vin   vdd   gnd    
mp1  vout  vin  vdd   vdd   p_18_mm   w=3u   l=0.18u  m=1
mn1  vout  vin  gnd   gnd   n_18_mm   w=1u   l=0.18u  m=1
.ends not

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

vinn	Vinn	gnd	dc 0.9
vinp	Vinp	gnd	sin(0.9	  0.9   0.5MEG)	

vdd   vdd    0   1.8
vbias    Vbias    gnd   dc 1.2
vgnd  gnd  0  0

.op
.option
.tran   1n   300u

.end