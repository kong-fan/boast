****srlatch****

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

Xsr1    q1    q2    r    s     vdd    gnd   sr

vs    s     0   pulse(0  1.8   0   0  0  10n  20n)
vr    r     0   pulse(0  1.8   5n  0  0  10n  20n)


vdd   vdd   0   1.8
vss   gnd   0   0

.op
.option   post
.tran  0.1n  200n  0

.end
