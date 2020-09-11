namespace Powerbuddy {
    public class TopBar : Gtk.HeaderBar {
        Gtk.Application app;
        public TopBar () {
			    Object ();
       }
        public void set_app(Gtk.Application app) {
            this.app = app;
        }
	    construct {
            var menuitem_about =  new Gtk.MenuItem ();
            menuitem_about.add(new Gtk.Label ("About"));
            var menuitem_settings =  new Gtk.MenuItem ();
            menuitem_settings.add( new Gtk.Label ("Settings"));

            menuitem_about.activate.connect(this.about_cb);
            menuitem_settings.activate.connect(this.settings_cb);



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

	    void about_cb(Gtk.MenuItem entry) {
		   print ("You clicked \"About\"\n");
	    }
	    void settings_cb(Gtk.MenuItem entry) {

		  var sett = new Powerbuddy.Settings(this.app);
		  sett.present();
	    }
    }
}
			
