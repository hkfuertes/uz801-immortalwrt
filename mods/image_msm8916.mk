# SPDX-License-Identifier: GPL-2.0-only

ifeq ($(SUBTARGET),msm8916)

define Device/msm8916
	SOC := msm8916
	CMDLINE := "earlycon console=tty0 console=ttyMSM0,115200 root=/dev/mmcblk0p14 rw rootwait"
endef

define Device/yiming-uz801v3
  $(Device/msm8916)
  DEVICE_VENDOR := YiMing
  DEVICE_MODEL := uz801v3
  DEVICE_DTS := msm8916-yiming-uz801v3
  DEVICE_DTS_DIR := ../dts
  DEVICE_PACKAGES := uz801-tweaks wpad-basic-wolfssl msm-firmware-loader
endef
TARGET_DEVICES += yiming-uz801v3

endif
