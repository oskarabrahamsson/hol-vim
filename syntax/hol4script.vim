" Language: HOL4 Script
" Maintainer: N/A
" Created: N/A
" License: N/A

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Custom syntax highlighting for HOL4 script files. Highlights HOL4 terms
" separately from ML syntax, and changes ML syntax highlighting to behave
" slightly differently.
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syn case match

syn match   MLIdent /\<\(\u\|\l\|_\)\(\w\|'\)*\>/ contained

syn match   MLEscChar /\\\(\l\|\d\d\d\)/
syn region  MLString start=/"/ skip=/\(\\\\\|\\"\)/ end=/"/ contains=MLEscChar
syn match   MLCharErr /\(#"\\\d"\|#"\\\d\d"\|#""\|#"[^"\\][^"\\]"\+\)/
syn match   MLChar /#"\\\\"\|#"\(\\\l\|\\\d\d\d\|\\"\|[^"]\)"/ contains=MLEscChar
syn match   MLNumber /\~\?\<\d\+\>/
syn match   MLNumber /\~\?\<\d*\.\d\+\([eE][+-]\?\d\+\)\?\>/

syn keyword MLTodo TODO XXX NOTE FIXME contained
syn region  MLComment start=/(\*/ end=/\*)/ contains=MLComment,MLTodo

syn keyword MLKeyword let local open in end
syn keyword MLKeyword if then else case of
syn keyword MLKeyword val fun and struct sig
syn keyword MLKeyword infix infixl
syn keyword MLKeyword raise handle
syn keyword MLKeyword structure signature
syn keyword MLKeyword datatype type

syn keyword MLOperator andalso orelse
syn keyword MLOperator div mod quot
syn keyword MLOperator before rem

syn match   MLOperator ":"
syn match   MLOperator ":="
syn match   MLOperator "=>"
syn match   MLOperator "::"
syn match   MLOperator "\<_\>"
syn match   MLOperator "!"
syn match   MLOperator ";"
syn match   MLOperator "\^"
syn match   MLOperator "="
syn match   MLOperator "\*"
syn match   MLOperator "+"
syn match   MLOperator "-"
syn match   MLOperator "/"
syn match   MLOperator "|"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HOL stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syn region  HOLString start=/«/ end=/»/ contains=MLEscChar

" Definition
syn region HOLDefnStart
      \ matchgroup=MLKeyword start="^\<Definition\>"
      \ end=":"me=e-1
      \ contains=MLIdent nextgroup=HOLDefnEnd
syn match  HOLQED /^\<End\>/
syn region HOLDefnEnd
      \ matchgroup=MLKeyword start=":"
      \ matchgroup=MLKeyword end="^\(\<End\>\|\<Termination\>\)"
      \ contains=@HOLTerms contained

" Datatype
syn region HOLDatatype
      \ matchgroup=MLKeyword start="^\<Datatype\>"
      \ end=":"me=e-1
      \ nextgroup=HOLDefnEnd

" Type, Overload
syn region HOLTypeAbbrev
      \ matchgroup=MLKeyword start="^\(\<Type\>\|\<Overload\>\)"
      \ end="="me=e-1
      \ contains=MLIdent

" Theorem
syn region HOLThmStart
      \ matchgroup=MLKeyword start="^\<Theorem\>"
      \ end="[:=]"me=e-1
      \ contains=MLIdent,HOLThmExtra
      \ nextgroup=HOLThmProof

syn match  HOLQED /^\<QED\>/
syn match  HOLThmExtra /\[[^\]]*\]/ms=s+1,me=e-1 contained
syn region HOLThmProof
      \ matchgroup=MLKeyword start=":"
      \ matchgroup=MLKeyword end="^\<Proof\>"
      \ contains=@HOLTerms contained

" Triviality
syn region HOLTriviality
      \ matchgroup=MLKeyword start="^\<Triviality\>"
      \ end=":"me=e-1
      \ contains=MLIdent
      \ nextgroup=HOLThmProof

" (Co)Inductive
syn region HOLCoInductive
      \ matchgroup=MLKeyword start="^\<\(Co\)\?Inductive\>"
      \ end=":"me=e-1
      \ contains=@HOLTerms
      \ nextgroup=HOLDefnEnd

" Tactics and tacticals

syn match   MLTactical "\\\\"
syn match   MLTactical ">>"
syn match   MLTactical ">-"
syn match   MLTactical ">\~"
syn match   MLTactical "\<THEN[1L]\?\>"
syn match   MLTactical "\<ORELSE\>"
syn match   MLCheat    "\<cheat\>"

" Single quotes
syn region  HOLQuoteSing
      \ matchgroup=MLQuote start="\(`\|‘\)"
      \ matchgroup=MLQuote end="\(`\|’\)"
      \ contains=@HOLTerms
syn region  HOLQuoteDoub
      \ matchgroup=MLQuote start="\(``\|“\)"
      \ matchgroup=MLQuote end="\(``\|”\)"
      \ contains=@HOLTerms
syn match   HOLQuoteErr /``[^`]*`[^`]/
" TODO Errors with unicode quotes

" HOL syntax

" Any words not in the symbols, nor keywords
syn match   HOLIdents /\(\l\|\u\|_\|'\)\+\(\w\|'\)*/ contained

" Binders
syn region  HOLBinder
      \ matchgroup=HOLSymbol start="\(!\|∀\|∃\|?!\?\|\\\|λ\)"
      \ matchgroup=HOLSymbol end="\."
      \ contains=HOLVars
      \ contained
syn match   HOLVars /\(\w\|\s\|'\)\+/ contained

" Various symbols and keywords
syn match   HOLSymbol "\\\\" contained " This is fdomsub
syn match   HOLSymbol "/\\" contained
syn match   HOLSymbol "∧" contained
syn match   HOLSymbol "\\/" contained
syn match   HOLSymbol "∨" contained
syn match   HOLSymbol "\~" contained
syn match   HOLSymbol "¬" contained
syn match   HOLSymbol "==>" contained
syn match   HOLSymbol "⇒" contained
syn match   HOLSymbol "\(<\|>\|=\)" contained
syn match   HOLSymbol "<=" contained
syn match   HOLSymbol "≤" contained
syn match   HOLSymbol ">=" contained
syn match   HOLSymbol "≥" contained
syn match   HOLSymbol "<=>" contained
syn match   HOLSymbol "⇔" contained
syn match   HOLSymbol "<>" contained
syn match   HOLSymbol "≠" contained
syn match   HOLSymbol "\<IN\>" contained
syn match   HOLSymbol "∈" contained
syn match   HOLSymbol "\<NOTIN\>" contained
syn match   HOLSymbol "∉" contained
syn match   HOLSymbol "\((\|)\|{\|}\|\[\|\]\)" contained
syn match   HOLSymbol "\(+\|-\|*\|$\)" contained
syn match   HOLSymbol "\<INTER\>" contained
syn match   HOLSymbol "∩" contained
syn match   HOLSymbol "\<UNION\>" contained
syn match   HOLSymbol "∪" contained
syn match   HOLSymbol "\<DIFF\>" contained
syn match   HOLSymbol "\<SUBSET\>" contained
syn match   HOLSymbol "⊆" contained
syn match   HOLSymbol "\<PSUBSET\>" contained
syn match   HOLSymbol "⊂" contained
syn match   HOLSymbol "\<EMPTY\>" contained
syn match   HOLSymbol "++" contained
syn match   HOLSymbol "+++" contained
syn match   HOLSymbol "\(=>\||\|:=\|<_\>\)" contained
syn match   HOLSymbol "\(;\|,\|<|\||>\|::\)" contained
syn match   HOLSymbol "\<\(T\|F\)\>" contained
syn match   HOLSymbol "\<o\>" contained

syn keyword HOLSymbol FLAT LIST_REL EVERY MAP FILTER MEM REVERSE LENGTH REPLICATE contained
syn keyword HOLSymbol FLOOKUP FDIFF fdomsub FEMPTY contained
syn keyword HOLSymbol OPTION_MAP contained
syn keyword HOLSymbol ALOOKUP contained
syn keyword HOLSymbol TAKE DROP contained
syn keyword HOLSymbol IS_SOME IS_NONE SOME NONE ISL ISR INL INR OUTL OUTR contained
syn keyword HOLSymbol INSERT BIGUNION set LIST_TO_SET contained
syn keyword HOLSymbol DIV MOD contained
syn keyword HOLSymbol EL HD TL LUPDATE contained
syn keyword HOLSymbol FST SND contained
syn keyword HOLSymbol divides int_divides contained
syn keyword HOLSymbol with updated_by contained
syn keyword HOLSymbol RTC contained
syn keyword HOLSymbol IS_PREFIX contained
syn keyword HOLSymbol otherwise contained
syn keyword HOLSymbol ARB contained

" Some monad syntax keywords
syn keyword HOLSymbol fail return letm lift

" Keywords
syn keyword HOLKeywords case of let let in if then else do od

" Comments
syn region  HOLComment start=/(\*/ end=/\*)/ contains=HOLComment,MLTodo contained

syn cluster HOLTerms contains=HOLSymbol,HOLBinder,HOLIdents,HOLKeywords,HOLComment,MLString,HOLString,MLChar,MLCharErr

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlighting settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syn sync fromstart

hi     link HOLSymbol    Special
hi     link HOLVars      Identifier
hi     link HOLIdents    Question
hi     link HOLKeywords  Special
hi     link HOLComment   Comment
hi     link HOLString    String

hi     link MLTactical   Constant
hi     link MLCheat      Todo

hi     link HOLQuoteErr  Error
hi     link MLQuote      String
hi     link HOLThmExtra  Special
hi     link HOLQED       Keyword

hi     link MLKeyword    Keyword
hi     link MLComment    Comment
hi     link MLTodo       Todo
hi     link MLIdent      Identifier

hi     link MLOperator   Special

hi     link MLChar       String
hi     link MLString     String
hi     link MLNumber     Number
hi     link MLEscChar    Special
hi     link MLCharErr    Error
hi     link MLBool       Type

let b:current_syntax = 'hol4script'

