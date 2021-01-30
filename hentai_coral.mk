#
# Copyright 2018 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# All components inherited here go to system image
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

#
# All components inherited here go to system_ext image
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_system_ext.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_system_ext.mk)

#
# All components inherited here go to product image
#
$(call inherit-product, vendor/hentai/build/product/hentai_product.mk)

#
# All components inherited here go to vendor image
#
# TODO(b/136525499): move *_vendor.mk into the vendor makefile later
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_vendor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_vendor.mk)
# Inherit AOSP stuff
$(call inherit-product, vendor/hentai/config/common_telephony.mk)
$(call inherit-product, device/google/coral/device-coral.mk)
$(call inherit-product, vendor/google/coral/coral-vendor.mk)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \

# Don't build super.img.
PRODUCT_BUILD_SUPER_PARTITION := false

PRODUCT_MANUFACTURER := Google
PRODUCT_BRAND := google
PRODUCT_NAME := hentai_coral
PRODUCT_DEVICE := coral
PRODUCT_MODEL := Pixel 4 XL

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="coral" \
    PRIVATE_BUILD_DESC="coral-user 11 RQ1A.210105.003 7005429 release-keys"

BUILD_FINGERPRINT := google/coral/coral:11/RQ1A.210105.003/7005429:user/release-keys

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.fingerprint=google/coral/coral:11/RQ1A.210105.003/7005429:user/release-keys

