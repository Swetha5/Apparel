CFLAGS = `pkg-config --cflags opencv`
LIBS = `pkg-config --libs opencv`

% : %.cpp
	g++ $(CFLAGS) -o `basename $@.cpp .cpp` $< $(LIBS)
