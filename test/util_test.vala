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
using Valadate ;

namespace GameStat{

    [Test (name = "Bytes to Integer test case")]
    public class BytesToIntTest : Valadate.Framework.TestCase {
        public const uint8[] data = { 5, 4, 1 } ;

        public void test_big_endian() {
            GLib.assert_true (bytes_to_int (new GLib.Bytes (this.data), true, 16, GLib.ByteOrder.BIG_ENDIAN) == 1345) ;
        }

        public void test_little_endian() {
            GLib.assert_true (bytes_to_int (new GLib.Bytes (this.data), true, 16, GLib.ByteOrder.LITTLE_ENDIAN) == 325) ;
        }

    }
}
