################################################################################
#
# i2c-tools
#
################################################################################

I2C_TOOLS_VERSION = 4.1
I2C_TOOLS_SOURCE = i2c-tools_$(I2C_TOOLS_VERSION).orig.tar.xz
I2C_TOOLS_SITE = http://deb.debian.org/debian/pool/main/i/i2c-tools
I2C_TOOLS_LICENSE = GPLv2+, GPLv2 (py-smbus)
I2C_TOOLS_LICENSE_FILES = COPYING

define I2C_TOOLS_BUILD_CMDS
 $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef

define I2C_TOOLS_INSTALL_TARGET_CMDS
	for i in i2cdump i2cget i2cset i2cdetect; \
	do \
		$(INSTALL) -m 755 -D $(@D)/tools/$$i $(TARGET_DIR)/usr/bin/$$i; \
	done
endef

$(eval $(generic-package))
