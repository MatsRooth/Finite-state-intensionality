source dm7.fst

define BAT0 A & B & ~C & ~D & ~E & ~F & G & H & I & W;

# Is it good that W has to be included at the end, to rule
# out traces and drefs?

define BAT1  [BAT0 .o. Turn .o. NoDref1 .o. W].l;
define BAT2  [BAT1 .o. Step .o. W].l;
define BAT3  [BAT0 .o. Turn .o. Look .o. W].l;
define BAT4  [BAT0 .o. Turn .o. Look .o. Step .o. Look .o. W].l;

echo --- BAT4
echo regex BAT4;
regex Pr(BAT4);
print words

echo --- Illustrate R. This should show two alternatives.
regex Pr([BAT4 .o. R .o. NoDref1 .o. NoTrace].l);
print words

echo --- know
echo He knows there is a bee in 1, and that he is in 3.
echo regex Pr(NoDref1 & NoTrace & Ko(In(b,1) & In(r,3)));
echo This should have +b in 1, and the robot at 3.
regex Pr(NoDref1 & NoTrace & Ko(In(b,1) & In(r,3)));
print random-words

# BAT with 0 on the last letter. 
define BATt Trace([BAT3 .o. New .o. Let(t)].l);
echo BAT with 0 on the last letter.
regex Pr(BATt);
print words

echo ----------
echo Worlds that have 0 in the same place as BATt, on the last letter.
echo [BATt .o. SameTrace].l)
regex Pr([BATt .o. SameTrace].l);
print random-words

echo ----------
echo Worlds that are alternatives to BAT3. These should have b in 1.
echo Note that drefs and trace markers can be interleaved.
echo regex Pr([BAT3 .o. R].l);
regex Pr([BAT3 .o. R].l);
print random-words

echo ----------
echo Worlds that are alternatives to BATt. These should have b in 1.
echo Note that drefs and trace markers can be interleaved.
echo regex Pr([BATt .o. R].l);
regex Pr([BATt .o. R].l);
print random-words

echo ----------
echo Worlds that are alternatives to BATt, and have 0 in the same place.
echo This is relevant for de re LFs.
echo regex Pr([BATt .o. [R & SameTrace]].l);
regex Pr([BATt .o. [R & SameTrace]].l);
print random-words

echo ---------
echo Complement with trace---states where 0 follows a.
echo Trace(Indef(Let(a),Fol))
define CPa Trace(Indef(Let(a),Fol));
regex Pr(CPa);
print random-words

echo ---------
echo regex Kt(CPa);
regex Pr(Kt(CPa));
print random-words


echo ---------
echo Bind(Kt(CPa));
regex Pr(Bind(Kt(CPa)));
print random-words

echo ---------
echo There(Bind(Kt(CPa)));
echo There is a letter that he knows t follows an ay
regex Pr(There(Bind(Kt(CPa))));
print random-words


echo ---------
echo The is a bee that he knows follows an a.
echo There(Intersect(Let(b),Bind(Kt(CPa))));
regex Pr(There(Intersect(Let(b),Bind(Kt(CPa)))));
print random-words


echo ----------
echo a bee follows an a
regex Pr(Indef(Let(b),Indef(Let(a),Fol)));
print random-words


echo ----------
echo he knows that a bee follows an a
regex Pr(Ko(Indef(Let(b),Indef(Let(a),Fol))));
print random-words



















