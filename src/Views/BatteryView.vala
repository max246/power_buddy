
namespace Powerbuddy {
    public class BatteryView : Gtk.Paned {

        Gee.ArrayList<Powerbuddy.UPowerModel> models;
        Gee.ArrayList<Granite.SettingsPage> pages;

       /* public BatteryView.with_models(Gee.ArrayList<Powerbuddy.UPowerModel> models) {
            this.models = models;
            Object (
			        height_request: 600,
                    width_request: 800);
        }*/

        public BatteryView (Gee.ArrayList<Powerbuddy.UPowerModel> models) {
			    Object (
			        height_request: 600,
                    width_request: 800);
                    this.models= models;
                this.populate();
        }

	    void populate () {

	     print("%d",this.models.size);

	     this.pages = new Gee.ArrayList<Granite.SettingsPage>();

	    foreach(Powerbuddy.UPowerModel model in this.models) {
	        if (model is Powerbuddy.ACModel) {
	            this.pages.add(new Powerbuddy.ACPage("AC"));
	        } else if (model is Powerbuddy.BatteryModel) {
	            this.pages.add(new Powerbuddy.BatteryPage("Battery"));
	            this.pages.add(new Powerbuddy.HistoryPage());
	            this.pages.add(new Powerbuddy.StatsPage());
	        }  else if (model is Powerbuddy.OtherBatteryModel) {
	           // this.pages.add(new Powerbuddy.ACPage("AC"));
	            this.pages.add(new Powerbuddy.DevicePage("Device2"));
	           print("others");
	        }  else  {
	            this.pages.add(new Powerbuddy.DevicePage("Device"));
	        }
	    }
        /*    var battery_page = new Powerbuddy.BatteryPage ("Battery #1");
            var history_page = new Powerbuddy.HistoryPage();
            var stats_page = new Powerbuddy.StatsPage ();



            var battery_page2 = new Powerbuddy.BatteryPage ("Battery #2");
            var history_page2 = new Powerbuddy.HistoryPage();
            var stats_page2 = new Powerbuddy.StatsPage ();

            var ac_page = new Powerbuddy.ACPage("AC");
            var device_page = new Powerbuddy.DevicePage("Device");
*/

            var stack = new Gtk.Stack ();
            // stack.add_named(this.pages.get(1), "aaa");

            for (int i =0; i < this.pages.size;i++) {
                stack.add_named(this.pages.get(i), "aaa");
           }
            // stack.add_named(this.pages.get(0), "aaa");
            /* foreach (Granite.SettingsPage page in this.pages) {
                stack.add_named(page, "aaa"+(string)i);
                i += 1;
            }*/
            print("%d",this.pages.size);


           /* stack.add_named (ac_page, "ac_page");
            stack.add_named (battery_page, "battery_page");
            stack.add_named (history_page, "history_page");
            stack.add_named (stats_page, "stats_page");
            stack.add_named (battery_page2, "battery_page");
            stack.add_named (history_page2, "history_page");
            stack.add_named (stats_page2, "stats_page");
            stack.add_named (device_page, "device_page");*/

            var settings_sidebar = new Granite.SettingsSidebar (stack);

            add (settings_sidebar);
            add (stack);
            show_all();
        }
    }
}
