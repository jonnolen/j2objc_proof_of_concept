# J2ObjC Full Integration Example

A java library with unit tests fully integrated into an Xcode iOS project via [j2objc](https://github.com/google/j2objc/wiki).

##To Get Started:

* Install j2Oobjc at ~/Developer by unzipping [this file](https://github.com/google/j2objc/releases/download/0.9.5/j2objc-0.9.5.zip) to there.
* Go ahead and get IntelliJ Idea 14 CE, because you're good enough, you're smart enough and, Android Studio still sucks.


##This project is broken into three distinct parts:

* shared/

`This is a shared library written in Java, it only has dependencies on j2objc provided .jar files.  This java 
code will be translated using j2ojbc into objecive-c code locationed at shared/gen_objc.  The generated code 
should be committed to git`

* ios/

`This is contains the ios project that consumes and the generated code from j2objc, it has a reference the 
shared/gen_objc code that needs to be updated manually, see ios/readme.md for more information. This 
application should only provide concrete implementations of the boundary interfaces between the shared lib and the UI.`

* android/

`Not included in this, but adding the module from Shared into an android project as a dependency should be straight
forward.  As with iOS you should strive to only provide concrete implementations of the narrowest possible set of 
boundary interfaces.`

##Resources that will help prevent you from bleeding all over this

This just might work, but in order for me to pull this off I'm going to have to synthesize and put into practice lot of learning 
that I've only been flirting with for the past 10 years.

* [Growing Object-Oriented Software, Guided By Tests; Steve Freeman, Nat Pryce](http://www.amazon.com/gp/product/0321503627/ref=as_li_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=0321503627&linkCode=as2&tag=icahaan-20&linkId=TE42DFKSI2ETBRED)
* [Responsible Design For Android (discontinued); J.B. Rainsberger](https://leanpub.com/ResponsibleDesignAndroid-Part1)
* [Architecting iOS Apps with VIPER](http://www.objc.io/issue-13/viper.html)



