# This adds to dm6 the definition of knowledge modality from mini2.

# A b/t in 1
# B a/e in 2
# C b/t in 3
# D 1 seen
# E 2 seen
# F 3 seen
# G robot 1 or 2
# H robot 1 or 3
# I robot left
# J dref2 in 2 or 3 (vs dref2 in 1 or no dref2) 
# K dref2 in 1 or 3 (vs dref2 in 2 or no dref2)
# L dref1 in 2 or 3 (vs dref1 in 1 or no dref1) 
# M dref1 in 1 or 3 (vs dref1 in 2 or no dref1)
# N dreft in 2 or 3 (vs dreft in 1 or no dreft) 
# O dreft in 1 or 3 (vs dreft in 2 or no dreft)

source test.fst;

define Bit "0" | 1;

define Let Bit^{3,3};
define Per Bit^{3,3};
define Rob Bit^{3,3};
#define Drf Bit^{4,4};
define Drf Bit^{6,6};

# State in boolean form, without the dref constraint.
define Bstate0 Let Per Rob Drf;

# Proposition letters
define A0 [1 ?*] & Bstate0;
define B0 [? 1 ?*] & Bstate0;
define C0 [?^2 1 ?*] & Bstate0;
define D0 [?^3 1 ?*] & Bstate0;
define E0 [?^4 1 ?*] & Bstate0;
define F0 [?^5 1 ?*] & Bstate0;
define G0 [?^6 1 ?*] & Bstate0;
define H0 [?^7 1 ?*] & Bstate0;
define I0 [?^8 1 ?*] & Bstate0;
define J0 [?^9 1 ?*] & Bstate0;
define K0 [?^10 1 ?*] & Bstate0;
define L0 [?^11 1 ?*] & Bstate0;
define M0 [?^12 1 ?*] & Bstate0;
define N0 [?^13 1 ?*] & Bstate0;
define O0 [?^14 1 ?*] & Bstate0;

# Keep everything except for drefs and trace constant
define SameBase [?^9 ?:? ?:? ?:? ?:? ?:? ?:?];

# State of the most general kind, possibly with drefs and trace.
# Exclude there being a dref2 and no dref1.
define Bstate Bstate0 - [~L0 & ~M0 & [K0 | J0]];

define A A0 & Bstate;
define B B0 & Bstate;
define C C0 & Bstate;
define D D0 & Bstate;
define E E0 & Bstate;
define F F0 & Bstate;
define G G0 & Bstate;
define H H0 & Bstate;
define I I0 & Bstate;
define J J0 & Bstate;
define K K0 & Bstate;
define L L0 & Bstate;
define M M0 & Bstate;
define N N0 & Bstate;
define O O0 & Bstate;

# Negations in Bstate of A-O

define nA ~A & Bstate;
define nB ~B & Bstate;
define nC ~C & Bstate;
define nD ~D & Bstate;
define nE ~E & Bstate;
define nF ~F & Bstate;
define nG ~G & Bstate;
define nH ~H & Bstate;
define nI ~I & Bstate;
define nJ ~J & Bstate;
define nK ~K & Bstate;
define nL ~L & Bstate;
define nM ~M & Bstate;
define nN ~N & Bstate;
define nO ~O & Bstate;

# Primitive world
define W  Bstate & ~J & ~K & ~L & ~M & ~N & ~O;  

## Printing
# r <|> robot
# p -|+ perception
# l b|t or a|e letter

# Print shape of a state.
# r1 p1 l1 d1 r2 p2 l2 d2 r3 p3 l3 d3 r4

# Print form of a robot
define rP "<" | ">" | "_";
define rbP "<" | ">";
# Print form of a knowledge bit
define pP "-" | "+";
# Print form of a consonant
define cP "b" | "t";
# Print form of a vowel
define vP "a" | "e";
# Print form of a dref combination
# define dP  "." | 1 | 2 | 12;
define dP  "." | 1 | 2 | 12 | "0" | 01 | 02 | 012;

define Pstate rP pP cP dP rP pP vP dP rP pP cP dP rP;

define prA    [A .x. [rP pP "b" dP rP pP vP dP rP pP cP dP rP]] |
  [[Bstate & ~A] .x. [rP pP "t" dP rP pP vP dP rP pP cP dP rP]];

define prB    [B .x. [rP pP cP dP rP pP "a" dP rP pP cP dP rP]] |
  [[Bstate & ~B] .x. [rP pP cP dP rP pP "e" dP rP pP cP dP rP]];

define prC    [C .x. [rP pP cP dP rP pP vP dP rP pP "b" dP rP]] |
  [[Bstate & ~C] .x. [rP pP cP dP rP pP vP dP rP pP "t" dP rP]];

define prD    [D .x. [rP "+" cP dP rP pP vP dP rP pP cP dP rP]] |
  [[Bstate & ~D] .x. [rP "-" cP dP rP pP vP dP rP pP cP dP rP]];

define prE    [E .x. [rP pP cP dP rP "+" vP dP rP pP cP dP rP]] |
  [[Bstate & ~E] .x. [rP pP cP dP rP "-" vP dP rP pP cP dP rP]];

define prF    [F .x. [rP pP cP dP rP pP vP dP rP "+" cP dP rP]] |
  [[Bstate & ~F] .x. [rP pP cP dP rP pP vP dP rP "-" cP dP rP]];
  
define prG    [G .x. [[rP pP cP dP rP pP vP dP "_" pP cP dP "_"]] & $rbP] |
  [[Bstate & ~G] .x. [["_" pP cP dP "_" pP vP dP rP pP cP dP rP] & $rbP]];

define prH    [H .x. [rP pP cP dP "_" pP vP dP rP pP cP dP "_"]] |
  [[Bstate & ~H] .x. ["_" pP cP dP rP pP vP dP "_" pP cP dP rP]];

define prI    [I .x. [Pstate & $"<"]] |
  [[Bstate & ~I] .x. [Pstate & $">"]];

# define dP1 [1 | 12];
define dP1 [1 | 12 | 01 | 012 ];
define dP2 [2 | 12 | 02 | 012 ];

# Trace 
define dP0 ["0" | 01 | 02 | 012 ];

# J dref2 in 2 or 3 (vs dref2 in 1 or no dref2) 
define prJ    [J .x. [[rP pP cP [dP & ~dP2] rP pP vP dP rP pP cP dP rP] & $dP2 & ~$[dP2 ?* dP2]]] |
  [[Bstate & ~J] .x. [[rP pP cP dP rP pP vP [dP & ~dP2] rP pP cP [dP & ~dP2] rP] & ~$[dP2 ?* dP2]]];

# K dref2 in 1 or 3 (vs dref2 in 2 or no dref2) 
define prK    [K .x. [[rP pP cP dP          rP pP vP [dP & ~dP2] rP pP cP dP          rP] & $dP2 & ~$[dP2 ?* dP2]]] |
  [[Bstate & ~K] .x. [[rP pP cP [dP & ~dP2] rP pP vP dP          rP pP cP [dP & ~dP2] rP] & ~$[dP2 ?* dP2]]];

# L dref1 in 2 or 3 (vs dref1 in 1 or no dref1) 
define prL    [L .x. [[rP pP cP [dP & ~dP1] rP pP vP dP rP pP cP dP rP] & $dP1 &  ~[$dP2 & ~$dP1] & ~$[dP1 ?* dP1]]] |
  [[Bstate & ~L] .x. [[rP pP cP dP rP pP vP [dP & ~dP1] rP pP cP [dP & ~dP1] rP] &  ~[$dP2 & ~$dP1] & ~$[dP1 ?* dP1]]];

# M dref1 in 1 or 3 (vs dref1 in 2 or no dref1) 
define prM    [M .x. [[rP pP cP dP          rP pP vP [dP & ~dP1] rP pP cP dP          rP] & $dP1 & ~$[dP1 ?* dP1]]] |
  [[Bstate & ~M] .x. [[rP pP cP [dP & ~dP1] rP pP vP dP          rP pP cP [dP & ~dP1] rP] & ~[$dP2 & ~$dP1] & ~$[dP1 ?* dP1]]];

# N dref0 in 2 or 3 (vs dref0 in 1 or no dref0) 
define prN    [N .x. [[rP pP cP [dP & ~dP0] rP pP vP dP rP pP cP dP rP] & $dP0 & ~$[dP0 ?* dP0]]] |
  [[Bstate & ~N] .x. [[rP pP cP dP rP pP vP [dP & ~dP0] rP pP cP [dP & ~dP0] rP] & ~$[dP0 ?* dP0]]];

# O trace in 1 or 3 (vs trace in 2 or no trace) 
define prO    [O .x. [[rP pP cP dP          rP pP vP [dP & ~dP0] rP pP cP dP          rP] & $dP0 & ~$[dP0 ?* dP0]]] |
  [[Bstate & ~O] .x. [[rP pP cP [dP & ~dP0] rP pP vP dP          rP pP cP [dP & ~dP0] rP] & ~$[dP0 ?* dP0]]];


define pr prA & prB & prC & prD & prE & prF & prG & prH & prI & prJ & prK & prL & prM & prN & prO;


define prX    [I .x. [rP pP cP dP rP pP vP dP rP pP cP dP rP]] |
  [[Bstate & ~I] .x. [rP pP cP dP rP pP vP dP rP pP cP dP rP]];

# Location of dref1
# Pointed states where there is a dref1, and it is in N (1, 2, or 3).
define Dref1(Z) Test(Z & 1, ~L & M,
                  Test(Z & 2, L & ~M,
                   Test(Z & 3, L & M, False)));

# Location of dref2
# There is a dref2, and it is in N (1, 2, or 3).
define Dref2(Z) Test(Z & 1, ~J & K,
                  Test(Z & 2, J & ~K,
                   Test(Z & 3, J & K, False)));


# Location of trace
# There is a dref2, and it is in N (1, 2, or 3).
define Dref0(Z) Test(Z & 1, ~N & O,
                  Test(Z & 2, N & ~O,
                   Test(Z & 3, N & O, False)));

define NoDref2 ~J & ~K & Bstate;
define NoDref1 ~L & ~M & Bstate;

define New0 [Dref1(1) .x. Dref2(1)] |
           [Dref1(2) .x. Dref2(2)] |
           [Dref1(3) .x. Dref2(3)] |
           [NoDref1  .x. [NoDref2 & ~ NoDref1]];

# Presence of trace
define Trace N | O;
define NoTrace ~N & ~O & Bstate;

# Keep trace the same.
define SameTrace [[N & O] .x. [N & O]] |
   [[N & nO] .x. [N & nO]] |
   [[nN & O] .x. [nN & O]] |
   [[nN & nO] .x. [nN & nO]];


# Keep 1 the same.
define SameOne0 [[L & M] .x. [L & M]] |
   [[L & ~M] .x. [L & ~M]] |
   [[~L & M] .x. [~L & M]] |
   [[~L & ~M & Bstate] .x. [~L & ~M & Bstate]];

define SameOne SameOne0 & SameBase;

# Intersect to keep non-drefs the same.
# This breaks the policy of basing definitions on propositional variables.
# Added SameTrace here relative to dm6.
define New New0 & SameBase & SameTrace;


# Pop dref1
define Pop0 [Dref2(1) .x. Dref1(1)] |
           [Dref2(2) .x. Dref1(2)] |
           [Dref2(3) .x. Dref1(3)] |
	   [NoDref2 .x. NoDref1];
#           [NoDref2  .x. NoDref1]] &
#	   [[Dref3(1) .x. Dref2(1)] |
#           [Dref3(2) .x. Dref2(2)] |
#           [Dref3(3) .x. Dref2(3)] |
#           [NoDref3  .x. NoDref2]];
define Pop [Pop0 & SameBase & SameTrace] .o. NoDref2;

# Delete any dref 1 or 2 that is present.
define Pop12x [SameBase & SameTrace & SameRloc & SameRori] .o. NoDref2 .o. NoDref1;
define Pop12(X) [X .o. Pop12x].l; 

define OnetoTrace0 [Dref1(1) .x. Dref0(1)] |
           [Dref1(2) .x. Dref0(2)] |
           [Dref1(3) .x. Dref0(3)];

define TwotoOne0 [Dref2(1) .x. Dref1(1)] |
           [Dref2(2) .x. Dref1(2)] |
           [Dref2(3) .x. Dref1(3)] |
	   [NoDref2 .x. NoDref1];



## Map 1 to trace, and dref2 to dref1 if present. 
define PoptoTrace NoTrace .o. [OnetoTrace0 & TwotoOne0 & SameBase] .o. NoDref2;

# Convert trace to 1, for relative clause.
define Bind0 [Dref0(1) .x. Dref1(1)] |
           [Dref0(2) .x. Dref1(2)] |
           [Dref0(3) .x. Dref1(3)];
define Bind1 [Dref1(1) .x. Dref2(1)] |
           [Dref1(2) .x. Dref2(2)] |
           [Dref1(3) .x. Dref2(3)]|
	   [NoDref1 .x. NoDref2];

define bind Trace .o. [Bind0 & Bind1 & SameBase] .o. NoTrace;
	   
# There is a dref1 and letter X is in the location of the dref.
# ~L & M dref loc 1
# L & ~M dref loc 2
# L & M dref loc 3

# The center is an X (a letter type).
define Let(X) Test(X & "b", [[~L & M & A] | [L & M & C]],
               Test(X & "t", [[~L & M & ~A] | [L & M & ~C]],
	        Test(X & "a", [L & ~M & B], Test(X & "e", [L & ~M & ~B], False))));


## The below comes from mini1.fst.
## How do drefs interact with actions?

##########
#
#  Letter in place.
#
##########

# Generalized to include also the robot.

define In(L,P) Test(And(P & "1",L & "b"),A,
                Test(And(P & "1",L & "t"),nA,
		 Test(And(P & "1",L & "r"),G & H,
		  Test(And(P & "2",L & "a"),B,
	           Test(And(P & "2",L & "e"),nB,
	            Test(And(P & "2",L & "r"),G & nH,
		     Test(And(P & "3",L & "b"),C,
		      Test(And(P & "3",L & "t"),nC,
		       Test(And(P & "3",L & "r"),nG & H,
 		        Test(And(P & "4",L & "r"),nG & nH,False))))))))));


###############
#
#  Relations
#
###############

define Comp(X) Bstate - X;

# Characters the same
define SameC [A .x. A] | [Comp(A) .x. Comp(A)];
define SameC2 [B .x. B] | [Comp(B) .x. Comp(B)];
define SameC3 [C .x. C] | [Comp(C) .x. Comp(C)];
define SameC SameC & SameC2 & SameC3;

# Positions seen the same
define SameK1 [D .x. D] | [Comp(D) .x. Comp(D)];
define SameK2 [E .x. E] | [Comp(E) .x. Comp(E)];
define SameK3 [F .x. F] | [Comp(F) .x. Comp(F)];
define SameK SameK1 & SameK2 & SameK3;

# Same robot loc
define SameRloc [[G .x. G] | [Comp(G) .x. Comp(G)]] & [[H .x. H] | [Comp(H) .x. Comp(H)]];

# Same robot orientation
define SameRori [I .x. I] | [Comp(I) .x. Comp(I)];

##########
#
#  Turn
#
##########
#  I1 t I0
#  I0 t I1
 
define Turn [[I .x. Comp(I)] | [Comp(I) .x. I]] & SameC & SameK & SameRloc;

##########
#
#  Step
#
##########
# >-b_-a_-t_ 
# step right
# 1 -> 2
define Step1r [G & H & Comp(I)] .x. [G & Comp(H) & Comp(I)];
# 2 -> 3
define Step2r [G & Comp(H) & Comp(I)] .x. [Comp(G) & H & Comp(I)];
# 3 -> 4
define Step3r [Comp(G) & H & Comp(I)] .x. [Comp(G) & Comp(H) & Comp(I)];

define StepR Bstate .o. [[Step1r | Step2r | Step3r] & SameC & SameK & SameRori] .o. Bstate;

# 4 -> 3
define Step1l [Comp(G) & Comp(H) & I] .x. [Comp(G) & H & I];
# 3 -> 2
define Step2l [Comp(G) & H & I] .x. [G & Comp(H) & I];
# 2 -> 1
define Step3l [G & Comp(H) & I] .x. [G & H & I];

define StepL Bstate .o. [[Step1l | Step2l | Step3l] & SameC & SameK & SameRori] .o. Bstate;

define Step StepL | StepR;


##########
#
#  Look
#
##########

# 8 terms, 4 locations x 2 orientations
# After looking in 1r, he's seen 1.
# Knowledge of 2 and 3 stays the same.
define Look1r [[G & H & Comp(I)] .x. D] & SameK2 & SameK3;

# After looking in 2r, he's seen 2.
define Look2r [[G & Comp(H) & Comp(I)] .x. E] & SameK1 & SameK3;

# After looking in 3r, he's seen 2.
define Look3r [[Comp(G) & H & Comp(I)] .x. F] & SameK1 & SameK2;

# Looking in 4r gives no information.
define Look4r [Comp(G) & Comp(H) & Comp(I)] .o. SameK;


# 4 -> 3 # After looking in 4l, he's seen 3.
define Look1l [[Comp(G) & Comp(H) & I] .x. F] & SameK1 & SameK2;

# 3 -> 2 After looking in 3l, he's seen 2.
define Look2l [[Comp(G) & H & I] .x. E] & SameK1 & SameK3;

# 2 -> 1 After looking in 2l, he's seen 1.
define Look3l [[G & Comp(H) & I] .x. D] & SameK2 & SameK3;

# Looking in 1l gives no information.
define Look4r [G & H & I] .o. SameK;

# Looking is one of the above, and does not change characters, robot location,
# or robot orientation.

define Look [Look1r | Look2r | Look3r | Look4r | Look1l | Look2l | Look3l | Look4l] & SameC & SameRloc & SameRori;

# A bee in three.
# (((Let (b)) & (in 3)) .o. Pop)

# Binary predicates on center and pericenter.
# The center immediately follows the pericenter.
define Follow0 [[Dref2(2) & Dref1(1)] | [Dref2(3) & Dref1(2)]] & NoTrace;

# The center immediately precedes the pericenter.
define Precede0 [[Dref1(2) & Dref2(1)] | [Dref1(3) & Dref2(2)]] & NoTrace;
define Adjacent0 Precede0 | Follow0;

# regex [[Adjacent0 & Let("t")] .o. Pop .o. Let("e") .o. Pop .o. pr].l;

# Ensures there are exactly two drefs 1 and 2.
define Adj [W .o. New .o. New .o. Adjacent0].l;
define Pre [W .o. New .o. New .o. Precede0].l;
define Fol [W .o. New .o. New .o. Follow0].l;

# regex [Adjacent0 .o. PoptoTrace .o. Let("t") .o. pr].l;

# An a that a tee precedes.
# regex [Precede0 .o. PoptoTrace .o. Let("t") .o. Pop .o. bind .o. Let("a") .o. pr].l;

# Random choices for 2 and for trace


# An ay that a tee precedes.
# regex [Precede0 .o. PoptoTrace .o. Let("t") .o. Pop .o. bind .o. Let("a") .o. pr].l;
# regex [[Precede0 .o. PoptoTrace .o. Let("t") .o. Pop .o. bind .o. Let("a")].l .o. pr].l;

define OBJ [Precede0 .o. PoptoTrace .o. Let("t") .o. Pop .o. bind .o. Let("a")].l;
define OBJ2 [Precede0 .o. PoptoTrace .o. Let("t") .o. Pop .o. bind .o. Let("a") .o. SameOne].l;

# regex [Follow0 .o. OBJ2 .o. pr].l;

# A bee follows an ay that a tee precedes
# regex [Follow0 .o. OBJ2 .o. Pop .o. Let("b") .o. Pop .o. pr].l;

define Co(R) R.l;

# This does not work well when Y has 1,2 and X has 1.
# define Indef(X,Y) Co([X & Y] .o. Pop);

# For e.g. There(Let(a))
define There(X) Co(X .o. Pop);

define AnyPeriCenter0 SameBase & SameOne & SameTrace;
define AnyPeriCenter(X) [X .o. AnyPeriCenter0].l;

define Indef(X,Y) Co([AnyPeriCenter(X) & Y] .o. Pop);


define Ei(X) Co(X .o. PoptoTrace);

define Pr(X) [X .o. pr].l;

# A tee follows an ay (in two steps).
#  regex Pr(Indef(Let(a),Fol));
#  regex Pr(Indef(Let(t),Indef(Let(a),Fol)));

define Trace(X) Co(X .o. PoptoTrace);
define Bind(X) Co(X .o. bind);


# Use for relative clause,
# ay that t follows a bee
define Intersect(X,Y) X & Y;

# [follows i]
#  regex Pr(Trace(Fol));
# [a tee follows i]
#  regex Pr(Indef(Let(t),Trace(Fol)));
# [i [a tee follows i]]
#  regex Pr(Bind(Indef(Let(t),Trace(Fol))));



#################
#
#  Epistemic accessibility relation.
#
#################

# Relations relating wordls that are the same
# in a given character position.

# Could use Comp(A) instead of nA
define SameA [[A .x. A] | [nA .x. nA]];
define SameB [B .x. B] | [nB .x. nB];
define SameC [C .x. C] | [nC .x. nC];

# Characters are the same if the position has been seen.
define R1 [D .o. SameA] | [nD .x. Bstate];
define R2 [E .o. SameB] | [nE .x. Bstate];
define R3 [F .o. SameC] | [nF .x. Bstate];

# Also robot location, robot orientation, and what has been seen are the same.
define R R1 & R2 & R3 & SameRloc & SameRori & SameK;


#################
#
#  Knowledge  based in mini2.fst
#
#################


# Set of worlds where proposition X is known.
# define K(X) State - [R .o. ~X].u;
# The above formulation is in mini2. We need to decide how to deal with ordinary and trace drefs.
# If X comes from a clause, it should have no ordinary centers.  So it should be ok to pop
# all the centers in X.  This is accomplished with Pop12: [X .o. Pop12].l
# A trace in the complement should be left there, I guess.
#  There is a bee that he knows e is adjacent to an ay.
#                               ---------------------- property of 
#                       ------------------------------ property of 0, pre-binding
#                      ------------------------------- property of 1, post-binding
# Indeed should K enforce sameness of the trace location by conjoining SameTrace with R?

define Ostate NoDref1 & NoTrace;

define Ko(X) Ostate - [[Ostate .o. R .o. [Ostate - X]].u];

define TraceN Trace & NoDref1;

define Kt(X) TraceN - [[TraceN .o. [R & SameTrace] .o. [TraceN - X]].u];


