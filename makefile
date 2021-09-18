CXX=clang++ 
CXXFLAGS=-std=c++17 -O2 -Wall
LIBS=-lsfml-audio -lsfml-graphics -lsfml-system -lsfml-window

SRC_DIR=./src
LIB_DIR=./lib

HEADERS=$(shell find ${SRC_DIR} -name "*.h")
SOURCES=$(shell find ${SRC_DIR} -name "*.cpp") 
OBJECTS=$(SOURCES:.cpp=.o)

INCLUDES=-I${SRC_DIR} -I${LIB_DIR}sfml/include
LDFLAGS=-L${LIB_DIR}sfml/lib -rpath ${LIB_DIR}sfml/lib

TARGET=buildr

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@ $(INCLUDES)

$(TARGET): $(OBJECTS)
	$(CXX) $(LDFLAGS) -o $(TARGET) $(OBJECTS) $(LIBS)

clean:
	-rm $(OBJECTS) $(TARGET)
