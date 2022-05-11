# ------------------------------
# re-initialize monitors to dual display, with the primary being hdmi, and the
# display port being on the right of the hdmi monitor
function refresh_displays
   set primary_display  "HDMI-0"
   set extended_display "DP-0"

   set primary_output  "$primary_display --auto --primary"
   set extended_output "$extended_display --auto --right-of $primary_display"

   xrandr --output $primary_output --output $extended_output
end
