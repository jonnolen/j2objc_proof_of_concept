#iOS Application

The ios application has a static library subproject called SharedLib.  

Whenever new files are generated in the shared java library using make, the objc_gen directory needs to be removed from this project and re-added as a group.

Settings for import:

* "[ ] Copy items if needed"
* "Added Folders: (*) Create groups"
* "Add to Targets: [x] SharedLib"  is checked.

This is because xcxode does not support generating a dynamic list of files for compilation. Bug reports have been filed with Apple requesting a make style syntax for being able to set all .java files in a directory as an input and then being able to use a build rule with dynamic output files.

You should never make changes to the code in objc_gen, to change the transpile output for j2objc modify the approriate target in shared/makefile

The app depends on libsharedlib.a.

If you add code to your java project that depends on jre_emul, guava, javax.inject, or jsr305 you will probably need to add those dependencies to one or both of the projects.
