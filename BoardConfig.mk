#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/a14xm

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55
TARGET_USES_64_BIT_BINDER := true


# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := a14xm
TARGET_NO_BOOTLOADER := true

#(b/123695868):  
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := \
	build/make/target/board/mainline_arm64/bluetooth

# Boot Animation
TARGET_SCREEN_WIDTH := 1080
TARGET_SCREEN_HEIGHT := 2408

# Display
TARGET_SCREEN_DENSITY := 450
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

TARGET_USES_COLOR_METADATA := true
TARGET_USES_DISPLAY_RENDER_INTENTS := true
TARGET_USES_GRALLOC4 := true

BOARD_EGL_CFG := $(DEVICE_PATH)/egl.cfg
# EGL facilitates OpenGL rendering by managing surfaces and contexts
# It acts as bridge between render APIs and the platform's window manager

# Kernel
TARGET_LINUX_KERNEL_VERSION := 4.19
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64

BOARD_KERNEL_CMDLINE := console=tty0 console=ttyS0,921600n1 root=/dev/ram \
                        androidboot.hardware=mt6833 vmalloc=400M swiotlb=noforce \
                        bootopt=64S3,32N2,64N2 loop.max_part=7 \
                        firmware_class.path=/vendor/firmware androidboot.secboot_fuse=0 \
                        nokaslr mtk_printk_ctrl.disable_uart=1 \
                        androidboot.board_id=S96901GA1 androidboot.em.model=SM-A146P \
						androidboot.init_fatal_reboot_target=recovery \
						androidboot.selinux=permissive \


BOARD_KERNEL_IMAGE_NAME := Image
TARGET_KERNEL_CONFIG := a14xm_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/a14xm

BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_SEPARATED_DTBO := true

BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x11088000
BOARD_KERNEL_TAGS_OFFSET := 0x07c08000
BOARD_KERNEL_SECOND_OFFSET := 0x07c00000

TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img

BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_MKBOOTIMG_ARGS += --board SRPVH12A007
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET)
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --second_offset $(BOARD_KERNEL_SECOND_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_DTBOIMG_PARTITION_SIZE := 72672
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 41943040

BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := samsung_dynamic_partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST :=
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

# Set error limit to BOARD_SUPER_PARTITON_SIZE - 500MB
BOARD_SUPER_PARTITION_ERROR_LIMIT := 8006926336

# Platform
TARGET_BOARD_PLATFORM := mt6833
TARGET_BOARD_PLATFORM_GPU := mali-g57

BOARD_HAS_MTK_HARDWARE := true
#BOARD_HAVE_MTK_FM := true

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/system_ext.prop
TARGET_SYSTEM_DLKM_PROP += $(DEVICE_PATH)/system_dlkm.prop
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_ODM_DLKM_PROP += $(DEVICE_PATH)/odm_dlkm.prop
TARGET_VENDOR_DLKM_PROP += $(DEVICE_PATH)/vendor_dlkm.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.enableswap
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# This is the fstab file that will be included in the recovery image.  Note that
# recovery doesn't care about the encryption settings, so it doesn't matter
# whether we use the normal or the fips fstab here.
TARGET_RECOVERY_FSTAB_GENRULE := gen_fstab.mt6833

TARGET_RECOVERY_UI_MARGIN_HEIGHT := 165
TARGET_RECOVERY_UI_LIB := \
	librecovery_ui_pixel \
	libfstab

AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
	system \
	system_dlkm \
	system_ext \
	product \
	vbmeta_system

ifneq ($(PRODUCT_BUILD_BOOT_IMAGE),false)
AB_OTA_PARTITIONS += boot
endif
ifneq ($(PRODUCT_BUILD_INIT_BOOT_IMAGE), false)
AB_OTA_PARTITIONS += init_boot
endif
ifneq ($(PRODUCT_BUILD_VENDOR_BOOT_IMAGE),false)
AB_OTA_PARTITIONS += vendor_boot
AB_OTA_PARTITIONS += dtbo
endif
ifeq ($(PRODUCT_BUILD_VENDOR_KERNEL_BOOT_IMAGE),true)
AB_OTA_PARTITIONS += vendor_kernel_boot
endif
ifneq ($(PRODUCT_BUILD_VBMETA_IMAGE),false)
AB_OTA_PARTITIONS += vbmeta
endif

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Security patch level
VENDOR_SECURITY_PATCH := 2024-04-01

# Sepolicy
include device/mediatek/sepolicy/sepolicy.mk


# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# VINTF
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/conf/manifest.xml

# Inherit the proprietary files
include vendor/samsung/a14xm/BoardConfigVendor.mk
