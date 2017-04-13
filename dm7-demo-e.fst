source dm7.fst;

echo =========== Transitive step by step ============
echo a tee follow a ay        (0 5)   t 
echo Fol
echo the pericenter immediately follows the center
regex Pr(Fol);
print random-words
echo ------------------------------------
echo Indef(Let(a),Fol)
echo the center immediately follows an ay
regex Pr(Indef(Let(a),Fol));
print random-words
echo ------------------------------------
echo (Indef (Let t) (Indef (Let a) Fol))
echo Indef(Let(t),Indef(Let(a),Fol))
echo a tee immediately follows an ay
regex Pr(Indef(Let(t),Indef(Let(a),Fol)));
print random-words

echo ""
echo =========== Object RC step by step ============
echo Ei(Fol)
echo the center immediately follows dref0 (the trace)
regex Pr(Ei(Fol));
print random-words

echo ------------------------------------
echo Indef(Let(a),Ei(Fol))
echo an ay immediately follows dref0 (the trace)
echo Pr(Indef(Let(a),Ei(Fol)))
print random-words

echo ------------------------------------
echo that an a follows t
echo Pr(Bind(Indef(Let(a),Ei(Fol))))
echo an ay immediately follows the center
regex Pr(Bind(Indef(Let(a),Ei(Fol))));
print random-words

echo .
echo =========== Subject RC  ============
echo Ei(Indef(Let(b),Fol))
regex Pr(Ei(Indef(Let(b),Fol)));
print random-words

echo ------------------------------------
echo Bind(Ei(Indef(Let(b),Fol)))
regex Pr(Bind(Ei(Indef(Let(b),Fol))));
print random-words

echo ------------------------------------
echo t follow a bee  (0 4)   (e \T t) 
echo (Bind (Ei (Indef (Let b) Fol)))
echo Bind(Ei(Indef(Let(b),Fol)))
regex Pr(Bind(Ei(Indef(Let(b),Fol))));
print random-words

echo ========= RC modification ==========
echo a tee adjacent a ay that t precede a bee	(0 10)	t 
echo (Indef (Let t) (Indef (Intersect (Let a) (Bind (Trace (Indef (Let b) Pre)))) Adj))
echo Indef(Let(t),Indef(Intersect(Let(a),Bind(Trace(Indef(Let(b),Pre)))),Adj))
regex Pr(Indef(Let(t),Indef(Intersect(Let(a),Bind(Ei(Indef(Let(b),Pre)))),Adj)));
print random-words


