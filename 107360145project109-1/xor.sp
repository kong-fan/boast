****xor****

.include  'C:\synopsys\Hspice_A-2008.03\Models\Lib.sp'


.subckt  not  vout  vin   vdd   gnd    
mp1  vout  vin  vdd   vdd   p_18_mm   w=3u   l=0.18u  m=1
mn1  vout  vin  gnd   gnd   n_18_mm   w=1u   l=0.18u  m=1
.ends not

.subckt nand vo a b vdd gnd
mpa  vdd   a   vo    vdd  p_18_mm  w=3u  l=0.18u  m=1
mpb  vdd   b   vo    vdd  p_18_mm  w=3u  l=0.18u  m=1
mna  vo    a   mnas  gnd  n_18_mm  w=1u  l=0.18u  m=1
mnb  mnas  b   gnd   gnd  n_18_mm  w=1u  l=0.18u  m=1
.ends nand

.subckt  nor   y   a   b   vdd   gnd
mpa  c  a  vdd  vdd  p_18_mm   w=3u  l=0.18u  m=1
mpb  y  b  c    vdd  p_18_mm   w=3u  l=0.18u  m=1
mna  y  a  gnd  gnd  n_18_mm   w=1u  l=0.18u  m=1
mnb  y  b  gnd  gnd  n_18_mm   w=1u  l=0.18u  m=1
.ends  nor

.subckt  or  vo  a  b  vdd  gnd
Xnor   norout   a   b   vdd   gnd    nor
Xnot   vo     norout   vdd   gnd    not
.ends  or

Xnand1   c   a   b    vdd    gnd    nand
Xor1     d   a   b    vdd    gnd    or
Xnand2   e   c   d    vdd    gnd    nand 
Xnot1    vout   e   vdd   gnd   not

vdd   vdd  0  1.8
vss   gnd  0  0

va   a   gnd   pulse(1.8  0   0    0  0  2u  4u)
vb   b   gnd   pulse(1.8  0   1u   0  0  2u  4u)

.op
.option
.tran   1p   10u

.end
