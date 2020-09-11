
namespace Powerbuddy {
    public class BatteryView : Gtk.Paned {

        Gee.ArrayList<Powerbuddy.UPowerModel> models;
        Gee.ArrayList<Granite.SettingsPage> pages;

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
	                this.pages.add(new Powerbuddy.ACPage((Powerbuddy.ACModel)model));
	            } else if (model is Powerbuddy.BatteryModel) {
	                this.pages.add(new Powerbuddy.BatteryPage((Powerbuddy.BatteryModel)model));
	                this.pages.add(new Powerbuddy.HistoryPage((Powerbuddy.BatteryModel)model));
	                this.pages.add(new Powerbuddy.StatsPage((Powerbuddy.BatteryModel)model));
	            }  else if (model is Powerbuddy.OtherBatteryModel) {
	               // this.pages.add(new Powerbuddy.ACPage("AC"));
	              //  this.pages.add(new Powerbuddy.DevicePage((Powerbuddy.OtherBatteryModel)model));
	               print("others");
	            }  else  {
	                this.pages.add(new Powerbuddy.DevicePage((Powerbuddy.DeviceModel)model));
	            }
	        }
           var stack = new Gtk.Stack ();

           for (int i =0; i < this.pages.size;i++) {
                string label = "item"+i.to_string();
                stack.add_named(this.pages.get(i), label);
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
