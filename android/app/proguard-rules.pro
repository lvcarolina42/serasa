-keep class retrofit2.** { *; }
-keep class okhttp3.** { *; }
-keepattributes Signature
-keepattributes *Annotation*

-keep class com.yourpackage.** { *; }

-keepclassmembers class ** {
    @com.google.gson.annotations.SerializedName <fields>;
}

-keep class **.R$* { *; }
