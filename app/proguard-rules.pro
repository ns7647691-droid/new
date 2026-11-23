# Keep WebView and custom WebViewClient classes safe during minification
-keep class com.example.app.MainActivity { *; }
-keep class com.example.app.MyWebViewClient { *; }
-keepclassmembers class * extends android.webkit.WebViewClient {
    public *;
}

# If you use @JavascriptInterface methods in HTML/JS bridge, keep them intact
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}

