%.out:	%.gm
	/local/res/cntcg/parse $*.gm > $*.out


%.show:	%.gm1
	/local/res/cntcg/parse $*.gm1

%.pdf: %.fst
	xfst -q -f $*.fst > $*.out
	enscript -o $*.ps $*.out
	ps2pdf $*.ps
	rm $*.ps

%.show:	%.gm
	/local/res/cntcg/parse $*.gm

%.fst: %.fml mini2.fst
	cp mini2.fst a1.fst
	echo regex `head -1 $*.fml` ';' >> $*.fst
	echo echo `head -1 $*.fml`  >> $*.fst
	echo 'print random-words' >> $*.fst

%.rnd: %.fst
	xfst -q -f $*.fst > $*.rnd


%.prs1: %.snt
	echo "(parse '("`head -1 $*.snt`'))' > $*.prs1

%.gm1: %.prs1
	cat rbt1.gm $*.prs1 > $*.gm1

%.fml1:	%.gm1
	/local/res/cntcg/parse $*.gm1 | egrep semantics | head -1 | cut -f2 -d: > $*.fml1

fix_fml: fix_fml.l
	lexcompile fix_fml

fix_fmll: fix_fmll.l
	lexcompile fix_fmll

%.fml: %.fml1 fix_fml
	cat $*.fml1 | ./fix_fml > $*.fml

