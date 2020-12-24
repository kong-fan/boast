****driver****
.include 'C:\synopsys\Hspice_A-2008.03\Models\Lib.sp'

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

Xnot2  a   vin vdd gnd  not2
Xnot3  b   a   vdd gnd  not3
Xnot4  c   b   vdd gnd  not4
Xnot5  d   c   vdd gnd  not5
Xnot6  e   d   vdd gnd  not6
Xnot7  f   e   vdd gnd  not7
Xnot8  g   f   vdd gnd  not8
Xnot9  vout   g vdd gnd  not9

vdd vdd 0 1.8
vgnd gnd 0 0
vina vin  0 1.8
.probe i(Xnot2.mnnot)
.probe i(Xnot9.mnnot)
.probe i(Xnot8.mnnot)
.op
.option
.tran 1n 300u

.end