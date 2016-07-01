/*
 * This file is part of gamestat.
 *
 * https://github.com/skybon/gamestat
 * Copyright (C) 2016 Artem Vorotnikov
 *
 * gamestat is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation,
 * either version 3 of the License, or (at your option) any later version.
 *
 * gamestat is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gamestat. If not, see <http://www.gnu.org/licenses/>.
 */
namespace GameStat{
    public int hex_val(string c) {
        switch( c ){
        case "a":
            return 10 ;
        case "b":
            return 11 ;
        case "c":
            return 12 ;
        case "d":
            return 13 ;
        case "e":
            return 14 ;
        case "f":
            return 15 ;
        default:
            return int.parse (c) ;
        }
    }

    public int64 hex_to_int(string hex) {
        // convert the string to lowercase
        string hexdown = hex.down () ;
        // get the length of the hex string
        int hexlen = hex.length ;
        int64 ret_val = 0 ;
        string chr ;
        int chr_int ;
        int multiplier ;

        // loop through the string
        for( var i = 0 ; i < hexlen ; i++ ){
            // get the string chars from right to left
            int inv = (hexlen - 1) - i ;
            chr = hexdown[inv:inv + 1] ;
            chr_int = hex_val (chr) ;

            // how are we going to multiply the current characters value?
            multiplier = 1 ;
            for( int j = 0 ; j < i ; j++ ){
                multiplier *= 16 ;
            }
            ret_val += chr_int * multiplier ;
        }
        return ret_val ;
    }

    public int64 bytes_to_int(GLib.Bytes b, bool single_digit_mode = false, int digit_base = 10, GLib.ByteOrder mode = GLib.ByteOrder.BIG_ENDIAN) throws GLib.ConvertError {
        int64 v = 0 ;

        var factor_incr = single_digit_mode ? 1 : 2 ;
        var factor = 0 ;
        var arr = b.get_data () ;

        if( arr.length > 0 ){
            switch( mode ){
            case GLib.ByteOrder.LITTLE_ENDIAN:
                for( var i = 0 ; i < arr.length ; i++ ){
                    v += arr[i] * GLib.Math.llrint (GLib.Math.pow (digit_base, factor)) ;
                    factor += factor_incr ;
                }
                break ;
            case GLib.ByteOrder.BIG_ENDIAN:
                for( var i = arr.length - 1 ; i > -1 ; i-- ){
                    v += arr[i] * GLib.Math.llrint (GLib.Math.pow (digit_base, factor)) ;
                    factor += factor_incr ;
                }
                break ;
            default:
                throw new GLib.ConvertError.FAILED ("Unknown byte order mode.") ;
            }
        }

        return v ;
    }

}
