# zcu102_gpio

This project doesn't include the .hdf or bit file, so the Vivado project must be built and exported,
and then petalinux has too import the hardware description using the following command.

petalinux-config --get-hw-description=hardware/ZCU102_GPIO/ZCU102_GPIO.sdk

This keeps the project size very small.

This branch uses an external kernel (located at ../linux-xlnx/ )
It must be checked out to the correct branch and manually patched using the patch files

The commands are:

git checkout xlnx_rebase_v4.14_2018.2
patch -p1 < kutu_gpio_driver.patch
patch -p1 < msp430_driver.patch
patch -p1 < otg_debug.patch
