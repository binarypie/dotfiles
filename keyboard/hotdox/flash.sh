#!/bin/bash
dfu-programmer atmega32u4 erase
dfu-programmer atmega32u4 flash hotdox_firmware.hex
dfu-tool attach
