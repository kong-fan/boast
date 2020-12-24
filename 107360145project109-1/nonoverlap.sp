****nonoverlap****
.include  'C:\synopsys\Hspice_A-2008.03\Models\Lib.sp'

.subckt inv vo vin vdd gnd
mp1  vo  vin  vdd   vdd   p_18_mm   w=3u   l=0.54u  m=1
mn1  vo  vin  gnd   gnd   n_18_mm   w=1u   l=0.72u  m=1
.ends inv

.subckt nor vo a b vdd gnd
mpa mpas a vdd vdd p_18_mm w=3u l=0.36u m=1
mpb vo b mpas vdd p_18_mm w=3u l=0.72u m=1
mna vo a gnd gnd n_18_mm w=1u l=0.18u m=1
mnb vo b gnd gnd n_18_mm w=1u l=0.18u m=1
.ends nor

.subckt buffer vo vin vdd gnd
xinv1 vo mid vdd gnd inv
xinv2 mid vin vdd gnd inv
.ends buffer

.subckt or vo a b vdd gnd
xnor norout a b vdd gnd nor
xinv vo norout vdd gnd inv
.ends or


Xor1 or1out vduty vn vdd gnd or
Xdelaycell1 firstdelayout or1out vdd gnd buffer
Xinvtwo invtwoout vduty vdd gnd inv
Xinvthree invthreeout firstdelayout vdd gnd inv
Xnorone noroneout invthreeout invtwoout vdd gnd nor
Xdelaycell2 vn noroneout vdd gnd buffer
Xor2 vp firstdelayout vzcd vdd gnd or

vdd   vdd  0  1.8
vgnd  gnd  0  0

vina vduty  gnd   pulse(1.8 0 5u 0  0  10u 15u)
vinb vzcd gnd pulse(0 1.8 10u 0  0 5u 15u)  
.op
.option
.tran   80p   100u


.end