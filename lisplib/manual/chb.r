






                        APPENDIX  B


                      Special Symbols




     The values of these symbols  have a predefined meaning.
Some values are counters while others are simply flags whose
value the user can change to affect the  operation  of  lisp
system.   In all cases, only the value cell of the symbol is
important, the function cell is not.  The value of  some  of
the  symbols  (like ER%misc) are functions - what this means
is that the value cell of those symbols  either  contains  a
lambda  expression,  a binary object, or symbol with a func-
tion binding.

     The values of the special symbols are:

$gccount$ - The number of  garbage  collections  which  have
     occurred.

$gcprint - If bound to  a non nil  value,  then  after  each
     garbage  collection and subsequent storage allocation a
     summary of storage allocation will be printed.

$ldprint - If bound to a non nil  value,  then  during  each
     _f_a_s_l or _c_f_a_s_l a diagnostic message will be printed.

ER%all - The function which is the  error  handler  for  all
     errors (see 10)

ER%brk - The function which is the  handler  for  the  error
     signal  generated  by the evaluation of the _b_r_e_a_k func-
     tion (see 10).

ER%err - The function which is the  handler  for  the  error
     signal  generated by the evaluation of the _e_r_r function
     (see 10).

ER%misc - The function which is the  handler  of  the  error
     signal generated by one of the unclassified errors (see
     10).  Most errors are unclassified at this point.

ER%tpl - The function which is the handler to be called when
     an  error  has occurred which has not been handled (see
     10).

ER%undef - The function which is the handler for  the  error
     signal  generated  when a call to an undefined function
     is made.
9

9                                                         B-1







                                                         B-2


^w - When bound to a non nil value this will prevent  output
     to  the standard output port (poport) from reaching the
     standard output (usually a terminal).  Note that ^w  is
     a  two character symbol and should not be confused with
     ^W which is how we would denote control-w.   The  value
     of  ^w  is  checked  when the standard output buffer is
     flushed which occurs after a _t_e_r_p_r, _d_r_a_i_n or  when  the
     buffer  overflows.   This is most useful in conjunction
     with ptport described  below.   System  error  handlers
     rebind  ^w  to nil when they are invoked to assure that
     error messages are not lost.  (This was introduced  for
     Maclisp compatibility).

defmacro-for-compiling - The has an effect  during  compila-
     tion.  If  non-nil it causes macros defined by defmacro
     to be compiled and included in the object file.

environment - The UNIX environment in assoc list form.

errlist - When a _r_e_s_e_t is done,  the  value  of  errlist  is
     saved  away  and  control  is  thrown to the top level.
     _E_v_a_l is then mapped over the saved away value  of  this
     list.

errport - This port is initially bound to the standard error
     file.

evalhook - The value of this symbol, if bound, is  the  name
     of a function to handle evalhook traps (see 14.4)

float-format - The value of this symbol is a string which is
     the  format  to be used by print to print flonums.  See
     the documentation on the UNIX  function  printf  for  a
     list of allowable formats.

funcallhook - The value of this symbol,  if  bound,  is  the
     name  of  a  function  to handle funcallhook traps (see
     14.4).

gcdisable - If non nil, then garbage collections will not be
     done  automatically  when  a collectable data type runs
     out.

ibase - This is the input radix used by the lisp reader.  It
     may  be  either  eight  or  ten.  Numbers followed by a
     decimal point are assumed to be decimal  regardless  of
     what ibase is.

linel - The line length used  by  the  pretty  printer,  pp.
     This  should  be  used  by  _p_r_i_n_t but it is not at this
     time.

nil - This symbol represents the null list and thus  can  be


                                      Printed: July 21, 1983







                                                         B-3


     written  ().   Its value is always nil.  Any attempt to
     change the value will result in an error.

piport - Initially bound to the standard input (usually  the
     keyboard).  A read with no arguments reads from piport.

poport - Initially bound to the standard output (usually the
     terminal  console).   A  print  with no second argument
     writes to poport.  See also: ^w and ptport.

prinlength - If this is a positive fixnum,  then  the  _p_r_i_n_t
     function will print no more than prinlength elements of
     a list or hunk  and  further  elements  abbreviated  as
     `...'.  The initial value of prinlength is nil.

prinlevel - If this is a positive  fixnum,  then  the  _p_r_i_n_t
     function  will  print  only  prinlevel levels of nested
     lists or hunks.  Lists below this level will be  abbre-
     viated by `&' and hunks below this level will be abbre-
     viated by a `%'.  The initial  value  of  prinlevel  is
     nil.

ptport - Initially bound to nil.  If bound to a  port,  then
     all  output  sent  to  the standard output will also be
     sent to this port as long as this port is not also  the
     standard  output  (as  this  would cause a loop).  Note
     that ptport will not get a copy of whatever is sent  to
     poport if poport is not bound to the standard output.

readtable - The value of this is the current readtable.   It
     is  an array but you should NOT try to change the value
     of the elements of the array using the array functions.
     This  is because the readtable is an array of bytes and
     the smallest unit the array functions work  with  is  a
     full  word  (4 bytes).  You can use _s_e_t_s_y_n_t_a_x to change
     the values and (_s_t_a_t_u_s _s_y_n_t_a_x ...) to read the values.

t - This symbol always has the value t.  It is  possible  to
     change  the  value  of this symbol for short periods of
     time but you are strongly advised against it.

top-level - In       a       lisp       system       without
     /usr/lib/lisp/toplevel.l loaded, after a _r_e_s_e_t is done,
     the lisp system will _f_u_n_c_a_l_l the value of top-level  if
     it  is  non  nil.   This provides a way for the user to
     introduce  his  own  top   level   interpreter.    When
     /usr/lib/lisp/toplevel.l  is  loaded, it sets top-level
     to franz-top-level and changes the  _r_e_s_e_t  function  so
     that once franz-top-level starts, it cannot be replaced
     by changing top-level.  Franz-top-level  does provide a
     way  of  changing  the  top  level however, and that is
     through user-top-level.
9

9                                      Printed: July 21, 1983







                                                         B-4


user-top-level - If this is bound then after  a  _r_e_s_e_t,  the
     top  level function will _f_u_n_c_a_l_l the value of this sym-
     bol rather than go through a read eval print loop.

















































9

9                                      Printed: July 21, 1983


