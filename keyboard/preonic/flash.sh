#!/bin/bash
dfu-programmer atmega32u4 erase
dfu-programmer atmega32u4 flash preonic_firmware.bin
dfu-tool attach
