#!/system/bin/sh
#
# Magisk Module Installation Script for Google WebView
#

# Magisk variables (no need to modify)
SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=false

print_modname() {
  ui_print "*******************************"
  ui_print "    Installing Google WebView    "
  ui_print "*******************************"
}

on_install() {
  ui_print "- Disabling AOSP WebView implementation..."
  pm disable --user 0 com.android.webview >/dev/null 2>&1
  
  ui_print "- Extracting new WebView module files..."
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
  
  ui_print "- Clearing package cache to avoid conflicts..."
  rm -rf /data/system/package_cache/*
  
  ui_print "- New WebView installation completed!"
  
  # Add social media handles
  ui_print " "
  ui_print "Follow me:"
  ui_print "XDA: GMB7886"
  ui_print "Reddit: u/GMB7886"
  ui_print "YouTube: @CanalDoMarinov"
}

set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644
}