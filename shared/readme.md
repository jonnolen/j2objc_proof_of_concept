# Shared Java Library

All of the code in this lbirary is java code that compiles agsint the j2objc provided versions of Guava, JUnit, Mockito, JavaxInject and JSR305.  If you need to add those dependencies, add them from the J2OBJC_HOME directory.

Test classes need to be added by hand to the AllTests suite, following the example for CanaryTest.

To generate objective-c files:

`make`

To build objective-c generated files and run all junit tests against those generated files:

`make test`

