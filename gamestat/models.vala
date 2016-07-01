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
    public errordomain GameStatError {
        INVALID_CHALLENGE
    }

    public class Player : GLib.Object {
        string Name ;
        string Score ;
        int Ping ;
    }

    public class Server : GLib.Object {
        public string name ;
        public string host ;
        public bool need_pass ;
        public string country ;
        public bool secure ;
        public int player_count ;
        public int player_limit ;
        public string terrain ;
        public GLib.KeyFile settings ;
        public Gee.LinkedList<Player ? > players ;

        public Server () {
            this.settings = new GLib.KeyFile () ;
            this.players = new Gee.LinkedList<Player ? >() ;
        }

    }
}
