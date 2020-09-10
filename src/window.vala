/* window.vala
 *
 * Copyright 2020 Christian Bianchini
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

namespace Powerbuddy {
	//[GtkTemplate (ui = "/com/github/max246/powerbuddy/window.ui")]
	public class Window : Gtk.Window {
		//[GtkChild]
		//Gtk.Label label;

		public Window (Gtk.Application app) {
			Object (application: app,
			    height_request: 600,
                icon_name: "workspaces-new-item",
                resizable: true,
                title: _ ("Power Buddy"),
                width_request: 800);
			}
			construct {
                window_position = Gtk.WindowPosition.CENTER;
                set_default_size (600, 800);

			    var pane = new Gtk.Paned (Gtk.Orientation.VERTICAL);

                var sett =  new Powerbuddy.BatteryView();

                Powerbuddy.TopBar bar = new Powerbuddy.TopBar();
                set_titlebar(bar);
                //pane.pack1 (bar, false, false);
                pane.pack1 (sett, false, false);
                //pane.pack2( stack ,false,false);

                add(pane);
                show_all();
		}
	}
}
