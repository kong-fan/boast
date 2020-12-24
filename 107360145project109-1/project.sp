****project****

.include  'C:\synopsys\Hspice_A-2008.03\Models\Lib.sp'

.subckt  not  vout  vin   vdd   gnd    
mp1  vout  vin  vdd   vdd   p_18_mm   w=3u   l=0.18u  m=1
mn1  vout  vin  gnd   gnd   n_18_mm   w=1u   l=0.18u  m=1
.ends not

.subckt not2 vo vin vdd gnd 
mpnot vo vin vdd vdd p_18_mm w=3u l=0.18u m=2
mnnot vo vin gnd gnd n_18_mm w=1u l=0.18u m=2
.ends not2 

.subckt not3 vo vin vdd gnd 
mpnot vo vin  vdd vdd p_18_mm w=3u l=0.18u m=4
mnnot vo vin  gnd gnd n_18_mm w=1u l=0.18u m=4
.ends not3 

.subckt not4 vo vin vdd gnd 
mpnot vo vin vdd vdd p_18_mm w=3u l=0.18u m=8
mnnot vo vin gnd gnd n_18_mm w=1u l=0.18u m=8
.ends not4 

.subckt not5 vo vin vdd gnd 
mpnot vo vin vdd vdd p_18_mm w=3u l=0.18u m=16
mnnot vo vin gnd gnd n_18_mm w=1u l=0.18u m=16
.ends not5 

.subckt not6 vo vin vdd gnd 
mpnot vo vin vdd vdd p_18_mm w=3u l=0.18u m=32
mnnot vo vin gnd gnd n_18_mm w=1u l=0.18u m=32
.ends not6 

.subckt not7 vo vin vdd gnd 
mpnot vo vin vdd vdd p_18_mm w=3u l=0.18u m=64
mnnot vo vin gnd gnd n_18_mm w=1u l=0.18u m=64
.ends not7 

.subckt not8 vo vin vdd gnd 
mpnot vo vin vdd vdd p_18_mm w=3u l=0.18u m=128
mnnot vo vin gnd gnd n_18_mm w=1u l=0.18u m=128
.ends not8 

.subckt not9 vo vin vdd gnd 
mpnot vo vin vdd vdd p_18_mm w=3u l=0.18u m=256
mnnot vo vin gnd gnd n_18_mm w=1u l=0.18u m=256
.ends not9 

.subckt driver vout vin vdd gnd 
Xnot2  a   vin vdd gnd  not2
Xnot3  b   a   vdd gnd  not3
Xnot4  c   b   vdd gnd  not4
Xnot5  d   c   vdd gnd  not5
Xnot6  e   d   vdd gnd  not6
Xnot7  f   e   vdd gnd  not7
Xnot8  g   f   vdd gnd  not8
Xnot9  vout   g vdd gnd  not9
.probe i(Xnot9.mnnot)
.probe i(Xnot2.mnnot)
.ends driver

.subckt invnon vo vin vdd gnd
mp1  vo  vin  vdd   vdd   p_18_mm   w=3u    l=5u  m=1
mn1  vo  vin  gnd   gnd   n_18_mm   w=1u    l=5u  m=1
.ends invnon

.subckt nornon vo a b vdd gnd
mpa mpas a  vdd  vdd p_18_mm w=3u l=0.36u m=1
mpb vo   b  mpas vdd p_18_mm w=3u l=0.72u m=1
mna vo   a  gnd  gnd n_18_mm w=1u l=0.18u m=1
mnb vo   b  gnd  gnd n_18_mm w=1u l=0.18u m=1
.ends nornon

.subckt buffernon vo vin vdd gnd
xinv1 vo mid  vdd gnd invnon
xinv2 mid vin vdd gnd invnon
.ends buffernon

.subckt ornon vo a b vdd gnd
xnor norout a b vdd gnd nornon
xinv vo norout vdd gnd invnon
.ends ornon

.subckt  nonoverlaping   vp   vn   vzcd   vduty   vdd   gnd
Xnor1   nor1out   vduty   vn   vdd   gnd  nornon
Xnot1   or1out    nor1out   vdd   gnd    invnon   
Xdelaycell1   firstdelayout   or1out   vdd   gnd  buffernon
Xinvtwo   invtwoout    vduty   vdd   gnd   invnon
Xinvthree   invthreeout   firstdelayout   vdd   gnd   invnon
Xnor2   nor2out    invthreeout    invtwoout    vdd   gnd   nornon
Xdelaycell2   vn   nor2out   vdd   gnd   buffernon
Xor1   vp   firstdelayout   vzcd   vdd   gnd   ornon
.ends  nonoverlaping

.subckt  nor   y   a   b   vdd   gnd
mpa  c  a  vdd  vdd  p_18_mm   w=3u  l=0.18u  m=1
mpb  y  b  c    vdd  p_18_mm   w=3u  l=0.18u  m=1
mna  y  a  gnd  gnd  n_18_mm   w=1u  l=0.18u  m=1
mnb  y  b  gnd  gnd  n_18_mm   w=1u  l=0.18u  m=1
.ends  nor

.subckt or vo a b vdd gnd
Xnor   norout   a   b   vdd   gnd    nor
Xnot   vo     norout   vdd   gnd    not
.ends or  

.subckt  sr  q1   q2   r   s   vdd   gnd
Xnor1  q1   r   q2   vdd   gnd   nor
Xnor2  q2   s   q1   vdd   gnd   nor
.ends  sr

.subckt  comparator   vc   vinp   vinn   vbias   vdd    gnd  
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
.ends  comparator

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

.subckt  zerocurrentnot  vout  vin   vdd   gnd    
mp1  vout  vin  vdd   vdd   p_18_mm   w=3u   l=10u  m=1
mn1  vout  vin  gnd   gnd   n_18_mm   w=1u   l=10u  m=1
.ends zerocurrentnot

.subckt zerocurrentdelay vo vin vdd gnd
Xnot1   vo   mid    vdd   gnd   zerocurrentnot
Xnot2   mid  vin    vdd   gnd   zerocurrentnot 
.ends zerocurrentdelay

.subckt  zerocurrent   vzcd   vx   vout  vn   vbias  vdd   gnd    
Xsr   empty   vzcd   norout    delaycellout   vdd   gnd  sr
Xnor    norout    comout    delaycellout   vdd   gnd    nor
Xdelay    delaycellout    vn    vdd    gnd    zerocurrentdelay
Xcom    comout   vx   vout   vbias    vdd   gnd    comparator
.ends   zerocurrent 

.subckt   aotc    vduty    vin   vcom    vfb   vbias   vdd    gnd
RA    vin    vinp   1k
RB    vinp   gnd    1k
R1    vinn   gnd    1k
C1    b      gnd    400p

mn1   a     opaout     vinn    gnd   n_18_mm   w=1u   l=0.18u   m=2
mn2   b     q2    gnd    gnd    n_18_mm   w=1u   l=0.18u   m=2
mp1   a     a     vdd    vdd    p_18_mm    w=3u    l=0.18u    m=2
mp2   b     a     vdd    vdd    p_18_mm    w=3u    l=0.18u    m=2

Xopa1    opaout    vinp   vinn    vbias      vdd    gnd    opa
Xcomparator1    r     b     VFB     vbias    vdd    gnd   comparator
Xsr1    VDuty   q2    r     Vcom    vdd    gnd    sr 
.ends   aotc

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

Xota1   vsense   vin   vx    vbias   vdd   gnd    ota
Csense    vsense    gnd     50p
La     vin    j    1u
Rdcr   j      vx   30m
mna    vx     von    gnd    gnd    n_18_mm   w=5u    l=0.35u   m=4000
mpa    vout   vop    vx     vdd    p_18_mm   w=5u    l=0.35u   m=7200
Xzerocurrent   vzcd    vx    vout   vn   vbias   vdd    gnd    zerocurrent
Xnonoverlaping1    vp    vn    vzcd    vduty    vdd    gnd    nonoverlaping
Xaotc1     vduty    vin    vcom    vfb1    vbias   vdd    gnd    aotc
CCo    vout     a     10u
RESR     a      gnd     50m
RLoad    vout    gnd    5
RFB1     vout    vfb    1k
RFB2     vfb     gnd    1k
Xcomparator1      vc    vref     vfb   vbias   vdd    gnd    comparator
Xcomparator2    vcom    vc    vsense   vbias   vdd    gnd    comparator
Xdriver1     von   vn    vdd    gnd    driver
Xdriver2     vop   vp    vdd    gnd    driver

vdd   vdd  0  1.8
vss   gnd  0  0
vbias   vbias   0   1.2
vref  vref   0   0.9
vin   vin  0   0.5
**vcom   vcom   0    pulse(0   1.8  0   0  0  1u  2u)
**vn   vp   0   pulse(0  1.8  0  0  0  1u  2u)
**vp   vn   0   pulse(0  1.8  0  0  0  1u  2u)
vfb1   vfb1  0    0.9

.probe i(Csense)
.probe i(CCo)
.probe i(La)
.probe i(mna)
.probe i(mpa)
.probe i(Rload)
.op
.option
.tran   1p   300u

.end