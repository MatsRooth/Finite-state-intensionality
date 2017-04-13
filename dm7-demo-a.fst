source dm7.fst

echo >+bat with 4*4 - 3 options for drefs 1 and 2, and no trace.
regex [[Bstate & A & B & ~C & D & ~E & ~F & G & H & ~I & ~N & ~O] .o. pr].l;
print words

echo ====================
echo +c+v<-c with no drefs or trace and 8 options for letters.
# Bstate & ~N & ~O means no trace.
regex [[Bstate & D & E & ~F & ~G & H & I & ~L & ~M & ~N & ~O] .o. pr].l;
print words

echo ====================
echo +tet12 with 4*2 options for robot location and orientation
regex [[Bstate & ~A & ~B & ~C & D & ~E & ~F & J & K & L & M & ~N & ~O] .o. pr].l;
print words
# ~$[dP2 .* dp2]

echo ====================
echo >+bat with no drefs and a trace.
regex [[Bstate & A & B & ~C & D & ~E & ~F & G & H & ~I & NoDref1 & ~NoTrace] .o. pr].l;
print words

