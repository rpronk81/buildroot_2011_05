#############################################################
#
# json-dbus-bridge
#
#############################################################

JSON_DBUS_BRIDGE_VERSION = 1.0.0
JSON_DBUS_BRIDGE_SITE = http://public.pengutronix.de/software/json-dbus-bridge
JSON_DBUS_BRIDGE_SOURCE = json-dbus-bridge-$(JSON_DBUS_BRIDGE_VERSION).tar.bz2

JSON_DBUS_BRIDGE_AUTORECONF = YES

$(eval $(call AUTOTARGETS,package,json-dbus-bridge))
