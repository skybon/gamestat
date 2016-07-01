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
    public Server MUMBLESparseData(GLib.Bytes b, string ? challenge = null) {
        var v = new Server () ;

        var data = GLib.MemoryInputStream.from_bytes (b) ;

        var protocol_ver_data = data.read_bytes (4) ;
        var protocol_ver = "%d.%d.%d".printf (protocol_ver_data.get (1), protocol_ver_bytes.get (2), protocol_ver_bytes.get (3)) ;

        var resp_challenge = (string) data.read_bytes (8).get_data () ;
        if( challenge != null ){
            if( challenge != resp_challenge ){
                throw new GameStatError.INVALID_CHALLENGE ("Invalid challenge: expected %s, received %s".printf (challenge, resp_challenge)) ;
            }
        }

        var current_clients = bytes_to_int (data.read_bytes (4), false, 10) ;
        var max_clients = bytes_to_int (data.read_bytes (4), false, 10) ;
        var max_bandwidth = bytes_to_int (data.read_bytes (4), false, 10) ;

        v.rules.set_string ("protocol-version", protocol_ver) ;
        v.rules.set_integer ("current-clients", currentClients) ;
        v.rules.set_integer ("max-clients", maxClients) ;
        v.rules.set_integer ("max-bandwidth", maxBandwidth) ;
        if( challenge != null ){
            rules.set_string ("challenge") = challenge ;
        }

        v.max_clients = max_clients ;
        v.num_clients = current_clients ;
        v.rules = rules ;

        return v ;
    }

}
