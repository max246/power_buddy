
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



        var stack = new Gtk.Stack ();
        stack.add_named (battery_page, "battery_page");
        stack.add_named (history_page, "history_page");
        stack.add_named (stats_page, "stats_page");

        var settings_sidebar = new Granite.SettingsSidebar (stack);

        add (settings_sidebar);
        add (stack);
        show_all();
    }
}
}
