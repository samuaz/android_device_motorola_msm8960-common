MSM8960_COMMON_PATH := device/motorola/msm8960-common

INTERNAL_BOOTIMAGE_ARGS2 := \
	--kernel $(INSTALLED_KERNEL_TARGET) \
	--ramdisk $(MSM8960_COMMON_PATH)/initrd.img-touch \
	--cmdline "$(BOARD_KERNEL_CMDLINE)" \
	--base $(BOARD_KERNEL_BASE) \
	--pagesize $(BOARD_KERNEL_PAGESIZE)

$(INSTALLED_BOOTIMAGE_TARGET): \
		$(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES)
	$(call pretty,"Making target Ubuntu-Touch boot image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS2) --output $@

$(INSTALLED_RECOVERYIMAGE_TARGET): \
		$(MKBOOTIMG) $(recovery_ramdisk) $(recovery_kernel)
	@echo ----- Making recovery image ------
	$(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) --output $@


