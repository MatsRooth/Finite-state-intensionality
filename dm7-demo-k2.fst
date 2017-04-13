source dm7.fst

define BAT0 A & B & ~C & ~D & ~E & ~F & G & H & I & W;

# Is it good that W has to be included at the end, to rule
# out traces and drefs?

define BAT1  [BAT0 .o. Turn .o. NoDref1 .o. W].l;
define BAT2  [BAT1 .o. Step .o. W].l;
define BAT3  [BAT0 .o. Turn .o. Look .o. W].l;
define BAT4  [BAT0 .o. Turn .o. Look .o. Step .o. Look .o. W].l;

#echo ----------
#echo he knows that a bee follows an a
#regex Pr(Ko(Indef(Let(b),Indef(Let(a),Fol))));
#print random-words

echo ------
echo he knows that a tee adjacent a ay that t precede a bee
echo Ko(Indef(Let(t),Indef(Intersect(Let(a),Bind(Trace(Indef(Let(b),Pre)))),Adj)));
regex Ko(Indef(Let(t),Indef(Intersect(Let(a),Bind(Trace(Indef(Let(b),Pre)))),Adj)));
print words
regex Pr(Ko(Indef(Let(t),Indef(Intersect(Let(a),Bind(Trace(Indef(Let(b),Pre)))),Adj))));
print words



















