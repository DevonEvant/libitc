# Changelog

No version is backwards compatible!

## v3

* Changed some ports to simpler names
* Add support for TSL2561 light sensor (`tsl.vhd`)
* Add I2C interface (`i2c.vhd`)
* Seven segment display now uses string type as data input
  * You can use `to_character()` function to convert integer or unsigned into hexadecimal format
* `seg.vhd` now reversed `seg_s` port bit order, you'll need to update pin assignment
* Removed simulation files
* Removed `clk_div` component

## v2

* Add enable pins to `dot` and `seg` drivers
* Some new features for `dot`
  * `dot_zeros` and `dot_ones` constants which are just `dot_data_t` type with full of '0's and '1's
  * `dot_anim_t` type: array of `dot_data_t` dor creating animations
* Fixed `seg_data_t` type to `integer range 0 to seg_lut_len - 1`
* Fixed `clk_sys` component "divide by zero error"
* Update documentations

## v1

* Add more glyphs to the `seg_lut`
* Increased `seg_data_t` range
* Add new constants:
  * `seg_lut_len`: the length of `seg_lut`
  * `seg_dot`: add this number to any element of `seg_data` to turn on the dot
  * `seg_spc`: space
  * `seg_deg`: degree symbol
  * `seg_lb`, `seg_rb`: brackets
