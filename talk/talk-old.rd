= Debuggers for Dynamic Languages

: theme
   theme/rocky

= Outline

  * What to be keep in mind for debugging (and related things)
  * Neat features that debuggers don't typically have
  * A code inspection of one of my debuggers

= Outline

  * What to be keep in mind for debugging (and related things)
  * Neat features that debuggers don't typically have
  * A code inspection of one of my debuggers

= What to be aware of 
  * Position information
  * Support for trace hook
  * Does source match?
    * capture source code or save a checksum
 

= Multi-line statements

  # enscript Python

  # What line is the next statement?
  x='''
  A multi-line 
  string
  '''; y=2

  Python, bash, early Ruby: ending line
  Perl, zsh, later Ruby: beginning line

= Compound statements

  # enscript Python
  case "$1" in
      0  ;;
  esac

= Position location
  * Use a range of positions 
    * line
    * line and column
    * character offset

= Position container
  * type, name 
    * jar,    member-name
    * file,   filename
    * string, string prefix
    * tree,   id 

= Support for trace hook
  * breakpoints
  * step into (step)
  * step over (next)
  * step out (finish)
