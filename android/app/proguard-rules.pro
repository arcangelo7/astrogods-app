# SPDX-FileCopyrightText: 2026 Arcangelo Massari <info@arcangelomassari.com>
#
# SPDX-License-Identifier: AGPL-3.0-or-later

# Keep all Stripe classes to prevent stripping during release builds
-keep class com.stripe.** { *; }

# Ignore Stripe Push Provisioning classes
# These classes are not used in this app (no card provisioning to Google/Apple Pay wallets)
-dontwarn com.stripe.android.pushProvisioning.**

# Ignore kotlinx.parcelize warnings
-dontwarn kotlinx.parcelize.**
