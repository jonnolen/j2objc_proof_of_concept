.SUFFIXES: .java .m

#default: cleans objc_gen folder and then regenerates all objective-c files into objc_gen directory.
#test: does a full clean, generates all files and runs all tests that have been included in the AllTests suite.

BUILD_DIR = ./build
GEN_DIR = ./objc_gen
SOURCE_DIR = ./src
APP_DIR = $(SOURCE_DIR)/main/java
TEST_DIR = $(SOURCE_DIR)/test/java

# Change to where distribution was unzipped.
J2OBJC_DISTRIBUTION = $(HOME)/Developer/j2objc
J2OBJC_LIB = $(J2OBJC_DISTRIBUTION)/lib

J2OBJC = $(J2OBJC_DISTRIBUTION)/j2objc
J2OBJCC = $(J2OBJC_DISTRIBUTION)/j2objcc

GUAVA = $(J2OBJC_LIB)/guava-14.0.1.jar
JUNIT = $(J2OBJC_LIB)/junit-4.10.jar
MOCKITO = $(J2OBJC_LIB)/mockito-core-1.9.5.jar

APP_JAVA_SOURCES = $(shell find $(APP_DIR) -type f -name '*.java')
APP_OBJECTS = $(patsubst $(APP_DIR)/%.java, $(BUILD_DIR)/%.o, $(APP_JAVA_SOURCES))
APP_OBJS_SOURCES = $(patsubst $(BUILD_DIR)/%.o, $(GEN_DIR)/%.m, $(APP_OBJECTS))

TEST_JAVA_SOURCES = $(shell find $(TEST_DIR) -type f -name '*.java')
TEST_OBJECTS = $(patsubst $(TEST_DIR)/%.java, $(BUILD_DIR)/%.o, $(TEST_JAVA_SOURCES))
TEST_OBJS_SOURCES = $(OBJECTS:.o=.m)
TEST_RESULT = $(BUILD_DIR)/app_tests

default: translate

#info action was used for debugging paths and file lists.
#info:
#	@echo $(APP_JAVA_SOURCES)
#	@echo $(APP_OBJECTS)
#	@echo $(APP_OBJS_SOURCES)

#build and run test running executable.
test: clean default $(BUILD_DIR) $(APP_OBJECTS) $(TEST_RESULT)
	$(TEST_RESULT) org.junit.runner.JUnitCore CanaryTest

#compile all test sources into app_tests executable for running tests.
$(TEST_RESULT): translate_tests $(TEST_OBJECTS)
	$(J2OBJCC) -o $@ -ObjC -ljunit $(APP_OBJECTS) $(TEST_OBJECTS)

#remove all built and generated files.
clean:
	@rm -rf $(BUILD_DIR)
	@echo cleaned build.

#translate all application java files into objective-c.
translate: $(GEN_DIR)
	$(J2OBJC) -sourcepath $(APP_DIR) -d $(GEN_DIR) -use-arc $(APP_JAVA_SOURCES)

#translate all test java files into objective-c.
translate_tests:
	$(J2OBJC) -sourcepath $(TEST_DIR) -cp $(APP_DIR) -cp $(JUNIT) -d $(BUILD_DIR) -use-arc $(TEST_JAVA_SOURCES)

#compile all generated application files down to .o files.
$(BUILD_DIR)/%.o: $(GEN_DIR)/%.m
	@mkdir -p $(shell dirname $@)
	$(J2OBJCC) -I$(GEN_DIR) -c $? -o $@


#compile all generated test files down to .o files.
$(BUILD_DIR)/%.o: $(BUILD_DIR)/%.m
	@mkdir -p $(shell dirname $@)
	$(J2OBJCC) -I$(BUILD_DIR) -I$(GEN_DIR) -c $? -o $@


#ensure build and gen files are created.
$(BUILD_DIR):
	@rm -rf $(BUILD_DIR)
	@mkdir -p $(BUILD_DIR)

$(GEN_DIR):
	@rm -f "$GEN_DIR"
	@mkdir -p "$GEN_DIR"