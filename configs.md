# CMDLINE
console=tty0 console=ttyS0,921600n1 root=/dev/ram 		

vmalloc=400M swiotlb=noforce 		

firmware_class.path=/vendor/firmware 		

androidboot.hardware=mt6833 		

page_owner=on loop.max_part=7 has_battery_removed=0 

ramoops.mem_address=0x48090000 ramoops.mem_size=0xe0000 ramoops.pmsg_size=0x10000 ramoops.console_size=0x40000 

loop.max_part=7 androidboot.boot_devices=bootdevice,soc/11230000.mmc,11230000.mmc,soc/11270000.ufshci,11270000.ufshci 

ft8722_fhdp_wt_dsi_vdo_cphy_90hz_txd lcm_serialnum:715100938031H33GB428 clk_ignore_unused 
bootopt=64S3,32N2,64N2 loop.max_part=7 root=/dev/ram  androidboot.verifiedbootstate=orange 
androidboot.atm=disabled androidboot.meta_log_disable=0 androidboot.dram_info=00,00,00,4G androidboot.ddr_size=4096MB 
softdog.soft_margin=100 softdog.soft_panic=1 sec_debug=0 sec_watchdog.sec_pet=5 androidboot.debug_level=0x4f4c 
androidboot.odin_download=2 androidboot.bootloader=A146PXXU7DXE1 
sec_debug.reset_rwc=0 sec_debug.reset_reason=7 

androidboot.sn.param.offset=3147696 androidboot.im.param.offset=3147536 androidboot.me.param.offset=3147616 androidboot.pr.param.offset=3147776 androidboot.sku.param.offset=3147856 androidboot.prototype_offset=3148544 
androidboot.sales.param.offset=3146268 androidboot.sales_code=EUX androidboot.carrierid.param.offset=3146304 androidboot.carrierid=EUX androidboot.hmac_mismatch=0 
androidboot.fmm_lock=0 sec_debug.fmm_lock_offset=3146356 androidboot.ap_serial=0xc82cb740 

nokaslr mtk_printk_ctrl.disable_uart=1 androidboot.serialno=R92W3136JQD androidboot.un=CE022372E5FA79E93B7E androidboot.uniqueno=c82cb740f38e87648742293a84ca82a5838df6d24bff12a88c6b091b 
androidboot.rpmb_flag=PRODUCTION_KEY androidboot.hardware.sku=hcesim androidboot.product.hardware.sku=hcesim 
androidboot.secboot_fuse=0 androidboot.board_id=S96901GA1 boardid_gpio_mixed_val=0x5 androidboot.hw_id=REV1.0 hwid_gpio_mixed_val=0x4 
androidboot.wt_em=7 androidboot.wt_rp=7 androidboot.revision=0 gpt=1 usb2jtag_mode=0 androidboot.dtb_idx=0 androidboot.dtbo_idx=0 

softdog.soft_margin=100 softdog.soft_panic=1  androidboot.kg=0x1  androidboot.kg.bit=00  androidboot.kg.ap=84ca82a58742293af38e8764c82cb740  
androidboot.em.did=c8238e422a82  androidboot.em.model=SM-A146P  
androidboot.em.status=0x0  androidboot.sb.debug0=0x0  androidboot.rp=7  androidboot.svb.ver=SVB1.0  androidboot.ulcnt=1  androidboot.bromcmddisable=0x1  

androidboot.warranty_bit=1  androidboot.wb.hs=e00  androidboot.wb.snapQB=80913359R

# modules
wlan_drv_gen4m 3022848 0 - Live 0x0000000000000000 (O)
wmt_chrdev_wifi 40960 1 wlan_drv_gen4m, Live 0x0000000000000000 (O)
gps_drv 118784 2 - Live 0x0000000000000000 (O)
fmradio_drv_mt6631_6635 225280 0 - Live 0x0000000000000000 (O)
bt_drv_connac1x 49152 1 - Live 0x0000000000000000 (O)
wmt_drv 1228800 6 wlan_drv_gen4m,wmt_chrdev_wifi,gps_drv,fmradio_drv_mt6631_6635,bt_drv_connac1x, Live 0x0000000000000000 (O)
connfem 40960 0 - Live 0x0000000000000000 (O)
trace_mmstat 20480 0 - Live 0x0000000000000000

# MT vendor
[ro.vendor.mediatek.platform]: [MT6833]
[ro.vendor.mediatek.version.branch]: [alps-mp-s0.mp1.tc10sp]
[ro.vendor.mediatek.version.release]: [alps-mp-s0.mp1.tc10sp-wt.V1.482_P34]

[ro.mediatek.version.branch]: [alps-mp-u0.mssi1.tc10sp]
[ro.mediatek.version.build.branch]: []
[ro.mediatek.version.release]: [alps-mp-u0.mp1.tc10sp-wt.V1]

[ro.soc.manufacturer]: [Mediatek]
[ro.soc.model]: [MT6833V/NZA]
[ro.gfx.driver.0]: [com.mediatek.mt6833.gamedriver]

# Wifi
[vendor.wifi_fw_ver]: [JDM_240219132153000]
[vendor.wifiap.vendorie]: [DD050016328000DD080050F21102000000]
[vendor.wlan.driver.version]: [MTK_1_0_1-"20240524163719"]
[vendor.wlan.firmware.version]: [t-neptune-main-soc2_2-2048-tc10sp-PALMER_SOC2_2_E1_MT6631_ASIC_MINIROM-20240219132153]

# Radio
[ro.vendor.fm.platform]: [mt6631_6635]
[ro.vendor.gps.chrdev]: [gps_drv]

# SAMSUNG RIL
    [ril.5g_rf]: [1]
    [ril.BootCompletedIntent]: [OK]
    [ril.CHAR]: [10294827]
    [ril.CompleteMsg]: [OK]
    [ril.ICC_TYPE0]: [0]
    [ril.ICC_TYPE1]: [2]
    [ril.LIMA]: [13206]
    [ril.RildInit]: [1,1]
    [ril.approved_codever]: [none]
    [ril.approved_cscver]: [none]
    [ril.approved_modemver]: [none]
    [ril.attach.apn1]: [telemach.hr]
    [ril.backoffstate]: [1108378919941]
    [ril.bandList]: [,28;1]
    [ril.bip_dns_in_progress]: [1,1]
    [ril.carrier_changed.state]: [ABSENT,CARRIER_LOADED]
    [ril.cidManager.initiated]: [0]
    [ril.cold_sim]: [,0]
    [ril.cpreset]: [0]
    [ril.cs_svc]: [1]
    [ril.currentplmn]: [unknown,unknown]
    [ril.data.intfprefix]: [rmnet]
    [ril.data.netlink.nlmsg_type]: [20,20]
    [ril.dds.call.ongoing0]: [0]
    [ril.dds.call.ongoing1]: [0]
    [ril.dds.data.slotid]: [1]
    [ril.dds.datacross.slotid]: [-1]
    [ril.enabled_5g_rf]: [1]
    [ril.enabled_5g_rf_per_subs]: [1,1]
    [ril.epdg.currenMno]: [,Telemach_HR]
    [ril.ff03.supported]: [,0]
    [ril.halservice.registered.slot1]: [true]
    [ril.halservice.registered.slot2]: [true]
    [ril.hasSimAbsent]: [1]
    [ril.hasisim]: [0,0]
    [ril.hw_ver]: [REV1.0]
    [ril.hw_ver2]: [REV1.0]
    [ril.ims.ltevoicesupport]: [0,1]
    [ril.initPB]: [0]
    [ril.initPB2]: [1]
    [ril.isIccChanged]: [,0]
    [ril.iscdma]: [0]
    [ril.lte.voice.status]: [1]
    [ril.ltenetworktype]: [,FDD]
    [ril.matchedcsc2]: [EUX]
    [ril.max_interface0]: [8]
    [ril.max_interface1]: [8]
    [ril.model_id]: [A14XM_GBL_ONEBIN]
    [ril.model_id2]: [A14XM_GBL_ONEBIN]
    [ril.modem.board]: [MT6853]
    [ril.modem.board2]: [MT6853]
    [ril.modemBoot]: [1]
    [ril.official_cscver]: [A146POXM7DXE1]
    [ril.phone.connected.slot1]: [true]
    [ril.phone.connected.slot2]: [false]
    [ril.phone1.mapped.md]: [MD1]
    [ril.pin_mode1]: [0]
    [ril.product_code]: [SM2A146PZKGEUX]
    [ril.product_code2]: [SM2A146PZKGEUX]
    [ril.radiostate]: [10]
    [ril.read.done]: [1]
    [ril.rejectForDiagnostics]: [0,0]
    [ril.reject_enabled]: [1]
    [ril.rejectedPlmn]: [,]
    [ril.rfcal_date]: [20230320]
    [ril.rfcal_date2]: [20230320]
    [ril.sar_control]: [0]
    [ril.sar_device_id]: [565255]
    [ril.signal.disprssi1]: [false]
    [ril.sim.acc]: [,8]
    [ril.sim.ef_rat_mode2]: []
    [ril.sim.lastSubCmdId]: [25]
    [ril.sim.mobility]: [false,false]
    [ril.sim.opl0]: [-1]
    [ril.sim.opl1]: [1]
    [ril.sim.opl5g0]: [-1]
    [ril.sim.opl5g1]: [1]
    [ril.simoperator]: [,ETC]
    [ril.simtype1]: [1]
    [ril.skt.network_regist]: [Status0;Idle0;CS0;PS0,Status0;Idle0;CS0;PS0]
    [ril.sms_preference]: [2/0,2/0]
    [ril.support.ext_len]: [1]
    [ril.support.incrementalscan]: [1]
    [ril.supportSA]: [0]
    [ril.sw_ver]: [A146PXXU7DXD4]
    [ril.sw_ver2]: [A146PXXU7DXD4]
    [ril.switchingSlot]: [0,0]
    [ril.twwan911Timer]: [0]
    [ril.usimAuth.status]: [,OK]

[ro.vendor.wfd.dummy.enable]: [0]
[ro.vendor.wfd.iframesize.level]: [0]
[ro.vendor.wifi.sap.concurrent.iface]: [ap1]
[ro.vendor.wifi.sap.interface]: [swlan0]
[ro.vendor.wlan.chrdev]: [wmt_chrdev_wifi]
[ro.vendor.wlan.gen]: [gen4m]

# connsys
[persist.vendor.connsys.bt_fw_ver]: [t-neptune-main-soc2_2-2048-tc10sp-PALMER_SOC2_2_E1_MT6631_ASIC_MINIROM-20240219132153]
[persist.vendor.connsys.chipid]: [0x6833]
[persist.vendor.connsys.dynamic.dump]: [0]
[persist.vendor.connsys.fm_chipid]: [mt6631_6635]
[persist.vendor.connsys.patch.version]: [240219132153000]
[persist.vendor.connsys.wifi_fw_ver]: [240219132153000]

[vendor.wifiap.11acmode]: [0]
[vendor.wifiap.5gindoor]: [0]
[vendor.wifiap.MacAclMode]: [0]
[vendor.wifiap.autohotspot.btadapterenable.smartd2dclient]: [0]
[vendor.wifiap.autohotspot.btadapterenable.smartgattclient]: [0]
[vendor.wifiap.autohotspot.btadapterenable.smartmhs]: [0]
[vendor.wifiap.axmode]: [0]
[vendor.wifiap.guest_mode_enabled]: [0]
[vendor.wifiap.guest_mode_isolation]: [0]
[vendor.wifiap.kernel.datausage]: [1]
[vendor.wifiap.maxclient]: [10]
[vendor.wifiap.owe_security]: [0]
[vendor.wifiap.pmf]: [0]
[vold.checkpoint_committed]: [1]
[vold.has_adoptable]: [1]
[vold.has_compress]: [1]
[vold.has_quota]: [1]
[vold.has_reserved]: [1]
[vold.post_fs_data_done]: [1]
[wifi.active.interface]: [swlan0]
[wifi.direct.interface]: [p2p0]
[wifi.interface]: [wlan0]
[wifi.tethering.interface]: [ap0]
[wlan.driver.status]: [ok]
[wlan.p2p.chkintent]: [8]

[ro.vendor.connsys.dedicated.log]: [1]
[ro.vendor.connsys.dedicated.log.port]: [bt,wifi,gps,mcu]

# BT 
[vendor.bluetooth_fw_ver]: [JDM_t-neptune-main-soc2_2-2048-tc10sp-PALMER_SOC2_2_E1_MT6631_ASIC_MINIROM-20240219132153]
[persist.vendor.connsys.bt_fw_ver]: [t-neptune-main-soc2_2-2048-tc10sp-PALMER_SOC2_2_E1_MT6631_ASIC_MINIROM-20240219132153]


# NFC 
[ro.vendor.nfc.feature.chipname]: [NXP_SN100U]
[ro.vendor.nfc.info.antpos]: [16]
[ro.vendor.nfc.support.advancedsetting]: [false]
[ro.vendor.nfc.support.autoselect]: [true]
[ro.vendor.nfc.support.defaultaid]: [true]
[ro.vendor.nfc.support.ese]: [false]
[ro.vendor.nfc.support.nonaid]: [true]
[ro.vendor.nfc.support.othercategory]: [true]
[ro.vendor.nfc.support.uicc]: [true]

[nfc.boot_reason]: [1]
[nfc.fw.dfl]: [SIM]
[nfc.fw.force_download]: [0]
[nfc.fw.rfreg_display_ver]: [11]
[nfc.fw.rfreg_ver]: [MAJ:25, MIN:11]
[nfc.fw.ver]: [NXP 12.1.16]
[nfc.initialized]: [true]
[nfc.preferred.wallet]: [com.google.android.gms]
[nfc.product.support.ese]: [0]
[nfc.product.support.euicc]: [0]
[nfc.product.support.nonaid]: [1]
[nfc.product.support.uicc]: [1]
[nfc.sent_scrs_event]: [1]