# To use run program: python trace.py <program> <args>
import sys
def trace_func(frame, event, arg):
    print "%s:%-2d %8s %s" % (frame.f_code.co_filename, frame.f_lineno, event, 
                              arg)
    return trace_func
sys.settrace(trace_func)
execfile(' '.join(sys.argv[1:]))
