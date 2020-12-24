****opa****

.include  'C:\synopsys\Hspice_A-2008.03\Models\Lib.sp'

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

vdd   vdd  0  1.8
vss  gnd  0  0

vinp    vinp   0  dc  0.9  ac  1
vinn    vinn   0  dc  0.9  ac  0
vbias   vbias  0   dc 1.2

.op
.option   post
.tran  0.1u  10u  0
.ac   dec  10   1   10g

.end