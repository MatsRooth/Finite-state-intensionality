## Defines a McCarthy conditional Test(X,Y,Z),
## True, and False.

## Author: Mats Rooth

## For set-denoting X,Y, and Z
## Test(X,Y,Z) = if (X is non-empty) then Y else Z.
## A relational X is reduced to its lower side.
## True is the universal set.
## False is the empty set.

# Universal relation.
# define U [?* .x. ?*];


define True "";
define False True & ~True;

# The Test operator.
# define Test(X,Y,Z) [Z - [X .o. U].l] | [Y - ~[[X .o. U].l]]; 

define Test(X,Y,Z) [Z - [X .o. [?* .x. ?*]].l] | 
                   [Y - ~[[X .o. [?* .x. ?*]].l]]; 

## Suppose X is non-empty. Then Test(X,Y,Z) = Y.
# 1. X is non-empty                     Assumption
# 2. [X .o. U].l is the universal set   1., U is universal relation
# 3. Z - [X .o. U].l is the empty set   2.
# 4. ~[X .o. U].l is the empty set      2.
# 5. [Y - ~[[X .o. U].l]] = Y           4.
# 6. [Z - [X .o. U].l] | [Y - ~[[X .o. U].l]] = Y       3. and 5.


## Suppose X is empty. Then Test(X,Y,Z) = Z.
# 1. X is empty                         Assumption
# 2. [X .o. U].l is empty               1.
# 3. Z - [X .o. U].l = Z                2.
# 4. ~[X .o. U].l is the universal set  2.
# 5. [Y - ~[[X .o. U].l]] is empty      4.
# 6. [Z - [X .o. U].l] | [Y - ~[[X .o. U].l]] = Z       3. and 5.

define And(P,Q) Test(P,Test(Q,True,False),False);

# undefine U;