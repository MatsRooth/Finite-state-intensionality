source dm7.fst

# W is set of worlds without drefs or trace.

echo ==============
echo There is a b.
regex [W .o. New .o. Let("b") .o. pr].l;
print random-words

echo --------------
echo There is a b in 3.
regex [W .o. New .o. Let("b") .o. Dref1(3) .o. pr].l;
print random-words

echo --------------
echo There is a b in 1.
regex [W .o. New .o. Let("b") .o. Dref1(1) .o. pr].l;
print random-words


echo --------------
echo The pericenter immediately precedes the center.
regex [Pre .o. pr].l;
print random-words

echo --------------
echo An "e" immediately precedes an "t".
regex [W .o. New .o. Let("e") .o. New .o. Let("t") .o. Precede0 .o. pr].l;
print random-words


echo ============== This needs work.
echo Every "t" is adjacent to an "e".
echo No "t" is not adjacent to an "e".
echo ---- 1 is a t
regex [Let("t") .o. pr].l;
print random-words
echo ---- 1 is a t adjacent to an e (ignore 2)
regex [[Let("t") .o. New .o. Let("e") .o. Adjacent0].u .o. pr].l;
print random-words
echo Difference between the above -- states where 1 is a t that is not adjacent to an e.
regex [[Let("t") - [Let("t") .o. New .o. Let("e") .o. Adjacent0].u] .o. pr].l;
print random-words
# Bstates where 1 is a t that is not adjacent to an e.
#  [Let("t") - [Let("t") .o. New .o. Let("e") .o. Adjacent0].u]
echo -- Bstates where 1 can be picked as a t that is not adjacent to an e.
regex [[New .o. [Let("t") - [Let("t") .o. New .o. Let("e") .o. Adjacent0].u]].u .o. pr].l;
print random-words
echo -- Complement of above, the test 'every t is adjacent to an e'.
echo -- Drefs are not relevant.
regex [[W - [New .o. [Let("t") - [Let("t") .o. New .o. Let("e") .o. Adjacent0].u]].u] .o. pr].l;
print random-words

