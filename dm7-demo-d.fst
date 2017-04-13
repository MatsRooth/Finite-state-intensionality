source dm7.fst

echo --- BAT0
define BAT0 A & B & ~C & ~D & ~E & ~F & G & H & I & W;
regex [BAT0 .o. pr].l;
print random-words

# Is it good that W has to be included at the end, to rule
# out traces and drefs?

define BAT1  [BAT0 .o. Turn .o. NoDref1 .o. W].l;
echo --- BAT0 .o. Turn
regex [BAT1 .o. pr].l;
print random-words


echo --- BAT0 .o. Turn .o. Step
define BAT2  [BAT1 .o. Step .o. W].l;
regex [BAT2 .o. pr].l;
print random-words

echo --- BAT0 .o. Turn .o. Look .o. Step .o. Look
define BAT3  [BAT0 .o. Turn .o. Look .o. Step .o. Look .o. W].l;
regex [BAT3 .o. pr].l;
print random-words
