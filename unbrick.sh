#!/bin/bash

echo "#################################"
echo "#   Flashing base firmware      #"
echo "#################################"
bin/fastboot -w
bin/fastboot --set-active=a
bin/fastboot flash --slot=all abl "img/abl.img"
bin/fastboot flash apdp "img/apdp.img"
bin/fastboot flash --slot=all bluetooth "img/bluetooth.img"
bin/fastboot flash --slot=all devcfg "img/devcfg.img"
bin/fastboot flash --slot=all dsp "img/dsp.img"
bin/fastboot flash dtbo "img/dtbo.img"
bin/fastboot flash --slot=all engineering_cdt "img/engineering_cdt.img"
bin/fastboot flash --slot=all featenabler "img/featenabler.img"
bin/fastboot flash --slot=all hyp "img/hyp.img"
bin/fastboot flash --slot=all imagefv "img/imagefv.img"
bin/fastboot flash --slot=all keymaster "img/keymaster.img"
bin/fastboot flash modem "img/modem.img"
bin/fastboot flash --slot=all oplusstanvbk "img/oplusstanvbk.img"
bin/fastboot flash --slot=all oplus_sec "img/oplus_sec.img"
bin/fastboot flash --slot=all qupfw "img/qupfw.img"
bin/fastboot flash --slot=all rpm "img/rpm.img"
bin/fastboot flash --slot=all splash "img/splash.img"
bin/fastboot flash --slot=all tz "img/tz.img"
bin/fastboot flash --slot=all uefisecapp "img/uefisecapp.img"
bin/fastboot flash --slot=all xbl "img/xbl.img"
bin/fastboot flash --slot=all xbl_config "img/xbl_config.img"
bin/fastboot flash vendor_boot "img/vendor_boot.img"
bin/fastboot flash vbmeta "img/vbmeta.img"
bin/fastboot flash vbmeta_system "img/vbmeta_system.img"
bin/fastboot flash vbmeta_vendor "img/vbmeta_vendor.img"

echo "###############################"
echo "# Resizing logical partitions #"
echo "###############################"
bin/fastboot delete-logical-partition odm_a
bin/fastboot delete-logical-partition odm_b
bin/fastboot delete-logical-partition system_a
bin/fastboot delete-logical-partition system_b
bin/fastboot delete-logical-partition system_ext_a
bin/fastboot delete-logical-partition system_ext_b
bin/fastboot delete-logical-partition product_a
bin/fastboot delete-logical-partition product_b
bin/fastboot delete-logical-partition vendor_a
bin/fastboot delete-logical-partition vendor_b
bin/fastboot delete-logical-partition my_bigball_a
bin/fastboot delete-logical-partition my_bigball_b
bin/fastboot delete-logical-partition my_carrier_a
bin/fastboot delete-logical-partition my_carrier_b
bin/fastboot delete-logical-partition my_company_a
bin/fastboot delete-logical-partition my_company_b
bin/fastboot delete-logical-partition my_engineering_a
bin/fastboot delete-logical-partition my_engineering_b
bin/fastboot delete-logical-partition my_heytap_a
bin/fastboot delete-logical-partition my_heytap_b
bin/fastboot delete-logical-partition my_manifest_a
bin/fastboot delete-logical-partition my_manifest_b
bin/fastboot delete-logical-partition my_preload_a
bin/fastboot delete-logical-partition my_preload_b
bin/fastboot delete-logical-partition my_product_a
bin/fastboot delete-logical-partition my_product_b
bin/fastboot delete-logical-partition my_region_a
bin/fastboot delete-logical-partition my_region_b
bin/fastboot delete-logical-partition my_stock_a
bin/fastboot delete-logical-partition my_stock_b

bin/fastboot create-logical-partition odm_a 1
bin/fastboot create-logical-partition odm_b 1
bin/fastboot create-logical-partition system_a 1
bin/fastboot create-logical-partition system_b 1
bin/fastboot create-logical-partition system_ext_a 1
bin/fastboot create-logical-partition system_ext_b 1
bin/fastboot create-logical-partition product_a 1
bin/fastboot create-logical-partition product_b 1
bin/fastboot create-logical-partition vendor_a 1
bin/fastboot create-logical-partition vendor_b 1
bin/fastboot create-logical-partition my_bigball_a 1
bin/fastboot create-logical-partition my_bigball_b 1
bin/fastboot create-logical-partition my_carrier_a 1
bin/fastboot create-logical-partition my_carrier_b 1
bin/fastboot create-logical-partition my_company_a 1
bin/fastboot create-logical-partition my_company_b 1
bin/fastboot create-logical-partition my_engineering_a 1
bin/fastboot create-logical-partition my_engineering_b 1
bin/fastboot create-logical-partition my_heytap_a 1
bin/fastboot create-logical-partition my_heytap_b 1
bin/fastboot create-logical-partition my_manifest_a 1
bin/fastboot create-logical-partition my_manifest_b 1
bin/fastboot create-logical-partition my_preload_a 1
bin/fastboot create-logical-partition my_preload_b 1
bin/fastboot create-logical-partition my_product_a 1
bin/fastboot create-logical-partition my_product_b 1
bin/fastboot create-logical-partition my_region_a 1
bin/fastboot create-logical-partition my_region_b 1
bin/fastboot create-logical-partition my_stock_a 1
bin/fastboot create-logical-partition my_stock_b 1

echo "###############################"
echo "# Flashing logical partitions #"
echo "###############################"
bin/fastboot flash vendor "img/vendor.img"
bin/fastboot flash odm "img/odm.img"
bin/fastboot flash system "img/system.img"
bin/fastboot flash system_ext "img/system_ext.img"
bin/fastboot flash product "img/product.img"
bin/fastboot flash my_bigball "img/my_bigball.img"
bin/fastboot flash my_carrier "img/my_carrier.img"
bin/fastboot flash my_company "img/my_company.img"
bin/fastboot flash my_engineering "img/my_engineering.img"
bin/fastboot flash my_heytap "img/my_heytap.img"
bin/fastboot flash my_manifest "img/my_manifest.img"
bin/fastboot flash my_preload "img/my_preload.img"
bin/fastboot flash my_product "img/my_product.img"
bin/fastboot flash my_region "img/my_region.img"
bin/fastboot flash my_stock "img/my_stock.img"

echo "??????????????????????????????????????????????????????????????????????????????????????????????"
read -p "Reboot to system? If you see errors in the log, you may want to reflash before rebooting (y/n): " answer

if [ "$answer" == "y" ]; then
    bin/fastboot reboot
else
    echo "Reflash before rebooting if needed."
fi

echo "Flash complete!"
