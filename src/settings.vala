namespace Powerbuddy {
	//[GtkTemplate (ui = "/com/github/max246/powerbuddy/window.ui")]
	public class Settings : Gtk.Window {
		//[GtkChild]
		//Gtk.Label label;

		public Settings (Gtk.Application? app) {
			Object (application: app,
			    height_request: 600,
                icon_name: "workspaces-new-item",
                resizable: true,
                title: _ ("Power Buddy"),
                width_request: 800);
			}
			construct {

			    var a = new Gtk.Label("aa");
			    add(a);

			    show_all();
			}
	}
}
