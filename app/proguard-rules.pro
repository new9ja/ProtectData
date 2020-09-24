# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in /home/marcel/Android/Sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

#Line numbers
-renamesourcefileattribute SourceFile
-keepattributes SourceFile,LineNumberTable

#NetGuard
-keepnames class com.baconpoints.procdata.** { *; }

#JNI
-keepclasseswithmembernames class * {
    native <methods>;
}

#JNI callbacks
-keep class com.baconpoints.procdata.Allowed { *; }
-keep class com.baconpoints.procdata.Packet { *; }
-keep class com.baconpoints.procdata.ResourceRecord { *; }
-keep class com.baconpoints.procdata.Usage { *; }
-keep class com.baconpoints.procdata.ServiceSinkhole {
    void nativeExit(java.lang.String);
    void nativeError(int, java.lang.String);
    void logPacket(com.baconpoints.procdata.Packet);
    void dnsResolved(com.baconpoints.procdata.ResourceRecord);
    boolean isDomainBlocked(java.lang.String);
    int getUidQ(int, int, java.lang.String, int, java.lang.String, int);
    com.baconpoints.procdata.Allowed isAddressAllowed(com.baconpoints.procdata.Packet);
    void accountUsage(com.baconpoints.procdata.Usage);
}

#AndroidX
-keep class androidx.appcompat.widget.** { *; }
-keep class androidx.appcompat.app.AppCompatViewInflater { <init>(...); }
-keepclassmembers class * implements android.os.Parcelable { static ** CREATOR; }

#Glide
-keep public class * implements com.bumptech.glide.module.GlideModule
-keep public class * extends com.bumptech.glide.module.AppGlideModule
-keep enum com.bumptech.glide.** {*;}
#-keep public enum com.bumptech.glide.load.resource.bitmap.ImageHeaderParser$** {
#    **[] $VALUES;
#    public *;
#}

#AdMob
-dontwarn com.google.android.gms.internal.**
