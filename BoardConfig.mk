#
# Copyright (C) 2011 The Android Open-Source Project
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

DEVICE_PACKAGE_OVERLAYS += device/asus/tf701t/overlay

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
USE_CAMERA_STUB := false
BOARD_USES_GENERIC_AUDIO := false

# Use the non-open-source parts, if they're present
-include vendor/asus/tf701t/BoardConfigVendor.mk

TARGET_SPECIFIC_HEADER_PATH := device/asus/tf701t/include

TARGET_NO_BOOTLOADER := true

# Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a15
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon

TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := tegra
TARGET_BOOTLOADER_BOARD_NAME := macallan

# Kernel
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100

# Try to build the kernel
TARGET_KERNEL_SOURCE := kernel/asus/tf701t
TARGET_KERNEL_CONFIG := omni_tf701t_defconfig

# Video
USE_OPENGL_RENDERER := true
VSYNC_EVENT_PHASE_OFFSET_NS := 0
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 1
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Acquire signature for WVM
BOARD_USES_LEGACY_ACQUIRE_WVM := true

# Partition
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608 # 8M
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608 # 8M
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648 # 2G
BOARD_USERDATAIMAGE_PARTITION_SIZE := 27562866722 # 25.6G
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 918552576 # 876M
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_PARTITION_SIZE := 8283750 # 7.9M

# Wifi related defines
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE := bcmdhd

WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/bcm43341/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/bcm43341/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/vendor/firmware/bcm43341/fw_bcmdhd_p2p.bin"

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/asus/tf701t/bluetooth

# SELINUX Defines
BOARD_SEPOLICY_DIRS += \
    device/asus/tf701t/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    genfs_contexts \
    service_contexts \
    device.te \
    drmserver.te \
    file.te \
    keystore.te \
    mediaserver.te \
    recovery.te \
    sensors_config.te \
    setup_fs.te \
    surfaceflinger.te \
    system_app.te \
    system_server.te \
    ueventd.te \
    vold.te \
    radio.te \
    halsel.te \
    wifiloader.te \
    akmd.te \
    set_hwui_params.te \
    input-cfboost.te \
    powerservice.te \
    rm_ts_service.te \
    ussr_setup.te \
    usdwatchdog.te \
    widevine_install.te \
    kernel.te \
    gpsd.te \
    servicemanager.te

BOARD_HARDWARE_CLASS := device/asus/tf701t/cmhw/

BOARD_HAL_STATIC_LIBRARIES := libhealthd.macallan

EXTENDED_FONT_FOOTPRINT := true

# TWRP
TW_THEME := landscape_hdpi
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
BOARD_HAS_LARGE_FILESYSTEM := true
TW_EXCLUDE_SUPERSU := true
TW_INCLUDE_CRYPTO := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TARGET_RECOVERY_DEVICE_MODULES := rm-wrapper
TARGET_RECOVERY_FSTAB := device/asus/tf701t/recovery/recovery.fstab
BOARD_CUSTOM_BOOTIMG_MK := device/asus/tf701t/recovery/recovery.mk
