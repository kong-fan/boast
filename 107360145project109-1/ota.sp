****ota****

.include  'C:\synopsys\Hspice_A-2008.03\Models\Lib.sp'

.subckt  ota   vsense   v+    v-   vbias   vdd   gnd  
mpa     a    a       vdd    vdd   p_18_mm   w=3u   l=0.36u   m=2
mbias   a    vbias   gnd    gnd   n_18_mm   w=1u   l=0.36u   m=2

m4    b    c    vdd     vdd   p_18_mm   w=3u   l=0.36u   m=2
m8    b    b    gnd     gnd   n_18_mm   w=1u   l=0.36u   m=8
m3    c    c    vdd     vdd   p_18_mm   w=3u   l=0.36u   m=2
m1    c    v-   d       gnd   n_18_mm   w=1u   l=0.36u   m=2
m7    d    vbias    gnd    gnd    n_18_mm    w=1u   l=0.36u   m=2
m5    e    e    vdd    vdd   p_18_mm   w=3u   l=0.36u   m=2
m2    e    v+   d      gnd   n_18_mm   w=1u   l=0.36u   m=2
m6    vsense    e      vdd     vdd    p_18_mm   w=3u    l=0.36u   m=2
m9    vsense    b      gnd     gnd    n_18_mm   w=1u    l=0.36u   m=2
m16   vsense    f      vdd     vdd    p_18_mm   w=3u    l=0.36u   m=2
m12   vsense    g      gnd     gnd    n_18_mm   w=1u    l=0.36u   m=2
mb     h        a      vdd     vdd    p_18_mm   w=3u    l=0.36u   m=2
m11    g        v+     h       vdd    p_18_mm   w=3u    l=0.36u   m=2
m13    g        g      gnd     gnd    n_18_mm   w=1u    l=0.36u   m=8
m10    i        v-     h       vdd    p_18_mm   w=3u    l=0.36u   m=2
m15    i        i      gnd     gnd    n_18_mm   w=1u    l=0.36u   m=2
m17    f        f      vdd     vdd    p_18_mm   w=3u    l=0.36u   m=2
m14    f        i      gnd     gnd    n_18_mm   w=1u    l=0.36u   m=2
.ends   ota

Xota1   isense     vin   vx   vbias   vdd   gnd   ota 
La     vin    j    1u 
Rdcr   j      vx   30m
Csense     isense     gnd    50p

vdd    vdd   0   1.8
vbias   vbias   0   1.2  
vss  gnd  0  0

vin    vin  0  pulse(0.5  1.2  0   0   0   1u    2u)
vx      vx     0   dc  1.2
.probe i(Csense)
.op
.option
.tran   1n   100u

.end