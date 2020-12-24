****quantizer****

.include  'C:\synopsys\Hspice_A-2008.03\Models\Lib.sp'

.subckt  nor   y   a   b   vdd   gnd
mpa  c  a  vdd  vdd  p_18_mm   w=3u  l=0.18u  m=1
mpb  y  b  c    vdd  p_18_mm   w=3u  l=0.18u  m=1
mna  y  a  gnd  gnd  n_18_mm   w=1u  l=0.18u  m=1
mnb  y  b  gnd  gnd  n_18_mm   w=1u  l=0.18u  m=1
.ends  nor

.subckt  sr  q1   q2   r   s   vdd   gnd
Xnor1  q1   r   q2   vdd   gnd   nor
Xnor2  q2   s   q1   vdd   gnd   nor
.ends  sr


m1   a   vclk   c   gnd   n_18_mm   w=1u  l=0.18u  m=1
m2   b   vclk   d   gnd   n_18_mm   w=1u  l=0.18u  m=1
m3   c    d    gnd    gnd   n_18_mm   w=1u    l=0.18u   m=2
m4   c    vinp    gnd    gnd   n_18_mm   w=1u    l=0.18u   m=2
m5   d    c    gnd    gnd   n_18_mm   w=1u    l=0.18u   m=2
m6   d    vinn    gnd    gnd   n_18_mm   w=1u    l=0.18u   m=2
m7   a    vclk    vdd    vdd   p_18_mm   w=3u    l=0.18u   m=1
m8   a    b    vdd    vdd   p_18_mm   w=3u    l=0.18u   m=1
m9   b    vclk    vdd    vdd   p_18_mm   w=3u    l=0.18u   m=1
m10   b    a    vdd    vdd   p_18_mm   w=3u    l=0.18u   m=1
m11   r    b    vdd    vdd   p_18_mm   w=3u    l=0.18u   m=1
m12   r    b    gnd    gnd   n_18_mm   w=1u    l=0.18u   m=1
m13   s    a    vdd    vdd   p_18_mm   w=3u    l=0.18u   m=1
m14   s    a    gnd    gnd   n_18_mm   w=1u    l=0.18u   m=1
Xsr1    q1    q2    r    s     vdd    gnd   sr

vdd   vdd  0   1.8
vss   gnd  0  0
vclk    vclk    0   pulse(0   1.2    0.5u   0   0   3u   6u)

vinp   vinp   gnd   pulse(0   1.8    0   0   0   1u   2u)
vinn   vinn   gnd   0.9

.op
.option
.tran   1p   10u

.end