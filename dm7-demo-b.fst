source dm7.fst;

echo ====================
echo Intial state S0 <-bat with no drefs
define S0 [A & B & ~C & ~D & ~E & ~F & G & H & I & ~L & ~M & NoTrace];
regex [S0 .o. pr].l;
print words

echo --------------------
echo S0 plus one random assignment.
# Added SameTrace to New to make this come out.
regex [S0 .o. New .o. pr].l;
print words

echo --------------------
echo S0 plus two random assignments.
regex [S0 .o. New .o. New .o. pr].l;
print words
