# To use run program: ruby -rtrace <program> <args>

set_trace_func proc{|event, file, line, id, binding, classname|
  printf "%s:%-2d %8s %10s %8s\n", file, line, event, id, classname
}
