****aotc****

.include  'C:\synopsys\Hspice_A-2008.03\Models\Lib.sp'

.subckt  not  vout  vin   vdd   gnd    
mp1  vout  vin  vdd   vdd   p_18_mm   w=3u   l=0.18u  m=1
mn1  vout  vin  gnd   gnd   n_18_mm   w=1u   l=0.18u  m=1
.ends not

.subckt  nor   y   a   b   vdd   gnd
mpa  c  a  vdd  vdd  p_18_mm   w=3u  l=0.18u  m=1
mpb  y  b  c    vdd  p_18_mm   w=3u  l=0.18u  m=1
mna  y  a  gnd  gnd  n_18_mm   w=1u  l=0.18u  m=1
mnb  y  b  gnd  gnd  n_18_mm   w=1u  l=0.18u  m=1
.ends  nor

.subckt   comparator   Vc   Vinp   Vinn   vbias    vdd    gnd
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
.ends   comparator

.subckt   opa   voutput   vinp   vinn    vbias     vdd    gnd
mp1   n1    vinn   n3   vdd   p_18_mm   w=3u   l=0.36u   m=4
mp2   n2    vinp   n3   vdd   p_18_mm   w=3u   l=0.36u   m=4
mp3   n3    b     vdd   vdd   p_18_mm   w=4.5u   l=0.36u   m=4
mp4   voutput  b    vdd   vdd   p_18_mm   w=1.4u    l=0.36u   m=4


mn1   n1    n1     gnd   gnd   n_18_mm   w=1.2u    l=0.6u   m=4
mn2   n2    n1     gnd   gnd   n_18_mm   w=1.2u    l=0.6u   m=4
mn3   voutput  n2     gnd   gnd   n_18_mm   w=2.4u     l=0.6u   m=4

mpa   b     b      vdd   vdd   p_18_mm   w=3u     l=0.18u   m=2
mna   b     vbias  gnd   gnd   n_18_mm   w=1u     l=0.18u   m=2

Rc    n2     n4     0.1k
Cc    n4     voutput   0.5p
.ends   opa

.subckt  sr  q1   q2   r   s   vdd   gnd
Xnor1  q1   r   q2   vdd   gnd   nor
Xnor2  q2   s   q1   vdd   gnd   nor
.ends  sr

RA    vin    vinp   1k
RB    vinp   gnd    1k
R1    vinn   gnd    1k
C1    b      gnd    450p

mn1   a     opaout     vinn    gnd   n_18_mm   w=1u   l=0.18u   m=2
mn2   b     q2    gnd    gnd    n_18_mm   w=1u   l=0.18u   m=4
mp1   a     a     vdd    vdd    p_18_mm    w=3u    l=0.18u    m=2
mp2   b     a     vdd    vdd    p_18_mm    w=3u    l=0.18u    m=2

Xopa1    opaout    vinp   vinn    vbias      vdd    gnd    opa
Xcomparator1    r     b     VFB     vbias    vdd    gnd   comparator
Xsr1    VDuty   q2    r     Vcom    vdd    gnd    sr 

vdd  vdd  0  1.8
vss  gnd  0  0

vin     vin    0   dc  1.2
vfb     VFB    0   dc  0.9
vbias   vbias  0   dc  1.2
vcom    Vcom   0   pulse(0   1.8   0   0   0   1u    2u)
.probe i(C1)
.op
.option
.tran   1n   200u

.end
