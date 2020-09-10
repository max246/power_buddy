
namespace Powerbuddy {
public class BatteryView : Gtk.Paned {

    public BatteryView () {
			Object (
			    height_request: 600,

                width_request: 800);
}
			construct {
        var battery_page = new Powerbuddy.BatteryPage ("Battery #1");
        var history_page = new Powerbuddy.HistoryPage();
        var stats_page = new Powerbuddy.StatsPage ();



        var battery_page2 = new Powerbuddy.BatteryPage ("Battery #2");
        var history_page2 = new Powerbuddy.HistoryPage();
        var stats_page2 = new Powerbuddy.StatsPage ();

        var ac_page = new Powerbuddy.ACPage("AC");
        var device_page = new Powerbuddy.DevicePage("Device");


        var stack = new Gtk.Stack ();
        stack.add_named (ac_page, "ac_page");
        stack.add_named (battery_page, "battery_page");
        stack.add_named (history_page, "history_page");
        stack.add_named (stats_page, "stats_page");
        stack.add_named (battery_page2, "battery_page");
        stack.add_named (history_page2, "history_page");
        stack.add_named (stats_page2, "stats_page");
        stack.add_named (device_page, "device_page");

        var settings_sidebar = new Granite.SettingsSidebar (stack);

        add (settings_sidebar);
        add (stack);
        show_all();
    }
}
}
