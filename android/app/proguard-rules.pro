# Keep all Stripe classes to prevent stripping during release builds
-keep class com.stripe.** { *; }

# Ignore Stripe Push Provisioning classes
# These classes are not used in this app (no card provisioning to Google/Apple Pay wallets)
-dontwarn com.stripe.android.pushProvisioning.**

# Ignore kotlinx.parcelize warnings
-dontwarn kotlinx.parcelize.**
