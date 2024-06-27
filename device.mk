#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Enable project quotas for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Enable DeviceAsWebcam
PRODUCT_VENDOR_PROPERTIES += \
    ro.usb.uvc.enabled=true
    
# Attempt to build Apex VM image
$(call inherit-product, packages/modules/Virtualization/apex/product_packages.mk)
PRODUCT_BUILD_PVMFW_IMAGE := true

# API Shipping Level
PRODUCT_SHIPPING_API_LEVEL := 33 # [Android T]
# Product VNDK 
PRODUCT_PRODUCT_VNDK_VERSION := current

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

PRODUCT_PACKAGES += \
    

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

##########################
# Audio 
##########################

# AudioHAL Configurations
#
PRODUCT_COPY_FILES += \
	frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration_7_0.xml \
	frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration_7_0.xml \
	frameworks/av/services/audiopolicy/config/hearing_aid_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/hearing_aid_audio_policy_configuration_7_0.xml \
	frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
	frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
	frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration_7_0.xml

PRODUCT_PROPERTY_OVERRIDES += \
    aaudio.mmap_exclusive_policy=2 \
    aaudio.mmap_policy=2 

PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.mtk_besloudness_support=1 \

# Audio: must using XML format for Treblized devices
USE_XML_AUDIO_POLICY_CONF := 1

##########################
# Audio 
##########################

##########################
# Bluetooth 
##########################

# Bluetooth COD
## Service Field: 0x5A -> 90
## MINOR_CLASS: 0x0C -> 12 (Smart Phone)
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.device.class_of_device=90,66,12

# Setting BT enabled profiles
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.profile.a2dp.source.enabled?=true \
    bluetooth.profile.avrcp.target.enabled?=true \
    bluetooth.profile.gatt.enabled?=true \
    bluetooth.profile.hfp.ag.enabled?=true \
    bluetooth.profile.hid.device.enabled?=true \
    bluetooth.profile.hid.host.enabled?=true \
    bluetooth.profile.map.server.enabled?=true \
    bluetooth.profile.opp.enabled?=true \
    bluetooth.profile.pan.nap.enabled?=true \
    bluetooth.profile.pan.panu.enabled?=true \
    bluetooth.profile.pbap.server.enabled?=true \
    bluetooth.profile.sap.server.enabled?=true \

##########################
# Bluetooth 
##########################

# Cgroup
PRODUCT_COPY_FILES += \
    system/core/libprocessgroup/profiles/cgroups_30.json:$(TARGET_COPY_OUT_VENDOR)/etc/cgroups.json \

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Fingerprint antispoof property
PRODUCT_PRODUCT_PROPERTIES +=\
    persist.vendor.fingerprint.disable.fake.override=none

# ######################
# GRAPHICS #
# ######################
	TARGET_USES_VULKAN = true

PRODUCT_SOONG_NAMESPACES += \
	vendor/arm/mali/valhall

## HWComposer
PRODUCT_VENDOR_PROPERTIES += ro.hardware.hwcomposer=mtk_common

PRODUCT_PACKAGES += \
	android.hardware.graphics.mapper@4.0-impl \
	android.hardware.graphics.allocator-V1-service \

# Mali Configuration Properties
# b/221255664 prevents setting PROTECTED_MAX_CORE_COUNT=2
PRODUCT_VENDOR_PROPERTIES += \
	vendor.mali.base_protected_tls_max=67108864 \
	vendor.mali.platform_agt_frequency_khz=24576

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
	frameworks/native/data/etc/android.hardware.vulkan.version-1_3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
	frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
	frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml \
	frameworks/native/data/etc/android.software.vulkan.deqp.level-2023-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
	frameworks/native/data/etc/android.software.contextualsearch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.contextualsearch.xml \
	frameworks/native/data/etc/android.software.opengles.deqp.level-2023-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml

PRODUCT_VENDOR_PROPERTIES += \
	ro.hardware.vulkan = mali \
    ro.hardware.egl = meow \
    ro.opengles.version=196610 \

PRODUCT_VENDOR_PROPERTIES += ro.gfx.driver.0=com.mediatek.mt6833.gamedriver 

# Render API properties   
PRODUCT_VENDOR_PROPERTIES += \
    ro.surface_flinger.protected_contents=true \
    ro.surface_flinger.force_hwc_copy_for_virtual_displays=true \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
    ro.surface_flinger.primary_display_orientation=ORIENTATION_0 \

# Backend 
PRODUCT_PROPERTY_OVERRIDES += \
    debug.renderengine.backend=skiagl

# GRAPHICS # - end
# ####################

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/conf/idc/uinput-fpc.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-fpc.idc \
    $(LOCAL_PATH)/conf/idc/uinput-goodix.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-goodix.idc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/conf/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/conf/keylayout/uinput-goodix.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-goodix.kl

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage
    
# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Proprietary Mediatek Props
PRODUCT_VENDOR_PROPERTIES := \
    ro.vendor.mediatek.platform=MT6833 \
    ro.vendor.mediatek.version.branch=alps-mp-s0.mp1.tc10sp \
    ro.vendor.mediatek.version.release=alps-mp-s0.mp1.tc10sp-wt.V1.482_P34 \

##
PRODUCT_VENDOR_PROPERTIES := \
    ro.vendor.wlan.chrdev=wmt_chrdev_wifi \
    ro.vendor.wlan.gen=gen4m


# Preopt SysUI
PRODUCT_DEXPREOPT_SPEED_APPS += SystemUI  # For AOSP

# Compile SystemUI on device with `speed`.
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.systemuicompilerfilter=speed
    
# Use 64-bit dex2oat for better dexopt time.
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat64.enabled=true

# Inherit Dalvik Properties 
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# Product characteristics
PRODUCT_CHARACTERISTICS := phone

################################
### Radio ## Telephony ## RIL
################################

# Multi SIM(DSDS)
SIM_COUNT := 2
$(call soong_config_set,sim,sim_count,$(SIM_COUNT))
SUPPORT_MULTI_SIM := true
# Support NR
SUPPORT_NR := true
# Using IRadio 
# Support SecureElement HAL for HIDL
USE_SE_HIDL := true


# RIL system props
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=26 \
    vendor.rild.libpath=/vendor/lib64/libsec-ril.so \
    vendor.rild.libargs=-d /dev/ttyC0 
    
PRODUCT_PROPERTY_OVERRIDES += ro.radio.noril=no

PRODUCT_PROPERTY_OVERRIDES += \
    ro.radio.noril=no

# No reboot on modem change
PRODUCT_PRODUCT_PROPERTIES += \
	persist.radio.reboot_on_modem_change=false

# Default to DSDS
PRODUCT_PRODUCT_PROPERTIES += \
	persist.radio.multisim.config=dsds

# DSDS - Dual SIM Dual Standby
# device has two separate radio interfaces
# one for each SIM 
# one SIM used for call, the other SIM is in standby mode
# Receiving a call on the standby SIM
# device will automatically switch to answer the call

################################
### Radio ## Telephony ## RIL
################################

# Ramdisk
PRODUCT_PACKAGES += \
    init.insmod.sh \
    install-recovery.sh \

PRODUCT_PACKAGES += \
    fstab.enableswap \
    factory_init.connectivity.common.rc \
    factory_init.connectivity.rc \
    factory_init.project.rc \
    factory_init.rc \
    init.aee.rc \
    init.ago.rc \
    init.connectivity.common.rc \
    init.connectivity.rc \
    init.modem.rc \
    init.mt6833.rc \
    init.mt6833.usb.rc \
    init.project.rc \
    init.sec.rc \
    init.sensor_2_0.rc \
    init_connectivity.rc \
    meta_init.connectivity.common.rc \
    meta_init.connectivity.rc \
    meta_init.modem.rc \
    meta_init.project.rc \
    meta_init.rc \
    meta_init.vendor.rc \
    multi_init.rc \
    init.recovery.mt6833.rc \
    init.recovery.samsung.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.enableswap:$(TARGET_COPY_OUT_RAMDISK)/fstab.enableswap

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/google/interfaces \
    hardware/google/pixel \
    hardware/mediatek \

################################
# Thermal  
################################
PRODUCT_PACKAGES += \
    android.hardware.thermal-service.mediatek

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/conf/thermal_info_config.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json \
    $(LOCAL_PATH)/conf/task_profiles.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json

################################
# Thermal  
################################

# Use FUSE passthrough
PRODUCT_PRODUCT_PROPERTIES += \
	persist.sys.fuse.passthrough.enable=true \
    sys.fuse.transcode_enabled \
    persist.sys.fuse=true \

## No FUSE BPF implementation

####################################
## VIDEO
####################################

# Codec 2.0
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/conf/media/media_codecs_c2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_c2.xml \

PRODUCT_PROPERTY_OVERRIDES += media.c2.dmabuf.padding=3072 

# Create input surface on the framework side
PRODUCT_PROPERTY_OVERRIDES += \
	debug.stagefright.c2inputsurface=-1 \

# OpenMAX IL
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/conf/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
	$(LOCAL_PATH)/conf/media//media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml

## Netflix BSP
PRODUCT_VENDOR_PROPERTIES += \
    ro.netflix.bsp_rev=MTK6833-32817-1

####################################
## VIDEO 
####################################

# Vendor verbose logging default property
ifneq (,$(filter userdebug eng, $(TARGET_BUILD_VARIANT)))
PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.verbose_logging_enabled=true
else
PRODUCT_PROPERTY_OVERRIDES += \
	persist.vendor.verbose_logging_enabled=false
endif


# Inherit the proprietary files
$(call inherit-product, vendor/samsung/a14xm/a14xm-vendor.mk)
