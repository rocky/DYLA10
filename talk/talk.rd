= Debuggers for Dynamic Languages

: subtitle
   rocky@gnu.org

: theme
   theme/rocky

= Outline

  * A Position Problem
  * Thinking about and Structuring a debugger

= Technology Forgotten

  # image
  # src = water-clock.jpg
  # relative_height = 100

= A Position Problem

Position in Evaluated Strings (eval.py)

  # enscript Python

  v = '''
  x = 2
  y = 1/0
  z = 4'''  # line 4
  exec v;   # line 5
  print y


= Part II 

Thinking about and organizing a debugger

  * non-interactive tracing
  * Commands as a shell (via Frame)

= Sample Trace Hook Bash (trace.sh)

  # enscript -v Bash

  # To use run program: bash trace.sh <program> <args>
  trace_func() {
      echo "${BASH_SOURCE}:$1 ${FUNCNAME[0]}"
      echo "    $2"
  }
  set -o functrace
  trap 'trace_func ${LINENO} "$BASH_COMMAND" \
     "$@"' DEBUG . $*

= Sample Trace Hook Python (trace.py)

  # enscript Python

  # To use run program: python trace.py <program> <args>
  import sys
  def trace_func(frame, event, arg):
      print "%s:%-2d %8s %s" % (
          frame.f_code.co_filename, frame.f_lineno, event, arg
        )
      return trace_func
  sys.settrace(trace_func)
  execfile( ' '.join(sys.argv[1:]) )

= Sample Trace Hook Ruby (trace.rb)

  # enscript Ruby

  # To use run program: ruby -rtrace <program> <args>

  set_trace_func proc{
  |event, file, line, id, binding, classname|
    printf("%s:%-2d %8s %10s %8s\n", 
           file, line, event, id, classname)
  }

= Command Dispatch (debug.rb)

  # enscript Ruby

  ...
  case input
  when /^\s*up(?:\s+(\d+))?$/
    ...
  when /^\s*down(?:\s+(\d+))?$/
    ...

= Command Dispatch (pdb.py)

Commands determined class introspection

  # enscript Python

  try:
     func = getattr(self, 'do_' + cmd)
         except AttributeError:
            ...
     return func(arg)

= Command Dispatch (rbdbgr)

  # enscript Ruby

  # load (require) files in cmd_dir
  Dir.glob(File.join(cmd_dir, '*.rb')).each do |rb| 
    require rb
  end if File.directory?(cmd_dir)

  # Instantiate each Command class found by the above require(s).
  Debugger::Command.constants.grep(/.Command$/).each do |command|
     new_cmd = "Debugger::Command::#{command}.new(self)"
     ...
  end
  ... like Python
