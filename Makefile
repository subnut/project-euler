.POSIX:
.SILENT:
.SUFFIXES:
.SUFFIXES: .c .d .py

.py: ; python3 $<
.c:  ; tcc -run $<
.d:
	ln -s "$<" "d$<"
	sh -c 'rdmd "d$<"; rm -f "d$<"'
