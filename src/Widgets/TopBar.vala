namespace Powerbuddy {
    public class TopBar : Gtk.HeaderBar {

        public TopBar () {
			    Object ();
        }
	    construct {
            var menuitem_about = new Gtk.MenuItem ();
            menuitem_about.add(new Granite.AccelLabel ("About"));
            var menuitem_settings = new Gtk.MenuItem ();
            menuitem_settings.add(new Granite.AccelLabel ("Settings"));

            var menu = new Gtk.Menu ();
            menu.add (menuitem_about);
            menu.add (menuitem_settings);
            menu.show_all ();

            var menu_button = new Gtk.MenuButton ();
            menu_button.popup = menu;

            this.pack_end (menu_button);
            this.set_show_close_button(true);

            show_all();
	    }
    }
}
			
