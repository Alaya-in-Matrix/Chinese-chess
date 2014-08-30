#I don't really know how to write makefile...
CC=g++
CFLAGS=-O3
EXE=chess
DEPS=global.h

CHECK=check
EVAL=eval
MOVE=move
SEARCH=search
ODIR=obj

OBJS_=board.o \
	  define_global.o \
	  main.o \
	  check/check_cannon.o \
	  check/check_chariot.o \
	  check/check_general.o \
	  check/check_horse.o \
	  check/check_soldier.o \
	  check/checkmate.o \
	  eval/weight.o \
	  move/Move.o \
	  move/advisor_move.o \
	  move/cannon_move.o \
	  move/chariot_move.o \
	  move/elephant_move.o \
	  move/general_move.o \
	  move/horse_move.o \
	  move/soldier_move.o \
	  search/Alpha_Beta.o \
	  search/PVS.o \
	  search/try_move.o 
SRC=board.cpp define_global.cpp \
	main.cpp \
	check/check_cannon.cpp \
	check/check_chariot.cpp \
	check/check_general.cpp \
	check/check_horse.cpp \
	check/check_soldier.cpp \
	check/checkmate.cpp \
	eval/weight.cpp \
	move/Move.cpp \
	move/advisor_move.cpp \
	move/cannon_move.cpp \
	move/chariot_move.cpp \
	move/elephant_move.cpp \
	move/general_move.cpp \
	move/horse_move.cpp \
	move/soldier_move.cpp \
	search/Alpha_Beta.cpp \
	search/PVS.cpp \
	search/try_move.cpp 

OBJS=$(patsubst %,$(ODIR)/%,$(OBJS_))

love:$(OBJS) 
	$(CC) -o $(EXE) $^ $(CFLAGS)

$(ODIR)/%.o: %.cpp  $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

$(ODIR)/$(EVAL)/%.o:$(EVAL)/%.cpp $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)
	
$(ODIR)/$(CHECK)/%.o:$(CHECK)/%.cpp $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

$(ODIR)/$(MOVE)/%.o:$(MOVE)/%.cpp $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

$(ODIR)/$(SEARCH)/%.o:$(SEARCH)/%.cpp $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)



.PHONY:clean
clean:
	rm -rf $(ODIR)/*.o
	rm -rf $(ODIR)/$(CHECK)/*.o
	rm -rf $(ODIR)/$(EVAL)/*.o
	rm -rf $(ODIR)/$(MOVE)/*.o
	rm -rf $(ODIR)/$(SEARCH)/*.o
	rm chess
.PHONY:tidy
tidy:
	rm -rf $(ODIR)/*.o
	rm -rf $(ODIR)/$(CHECK)/*.o
	rm -rf $(ODIR)/$(EVAL)/*.o
	rm -rf $(ODIR)/$(MOVE)/*.o
	rm -rf $(ODIR)/$(SEARCH)/*.o
