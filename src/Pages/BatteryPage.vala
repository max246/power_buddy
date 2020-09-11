namespace Powerbuddy {
    public class BatteryPage : Granite.SettingsPage {
        public BatteryPage (string header) {

               Object (
               header: header,
                icon_name : "summary",
                title: "Summary"
            );
        }

        construct {
            var title_label = new Gtk.Label ("Last update:");
            title_label.xalign = 1;

            var vendor_label = new Gtk.Label ("Vendor : x Model: y Serial: x Tech lipo:x ");
            vendor_label.xalign = 1;

            var state_label = new Gtk.Label ("Current state: xxx");
            state_label.xalign = 1;

            var warning_label = new Gtk.Label ("Warning xx");
            warning_label.xalign = 1;

            var energy_label = new Gtk.Label ("Energy:  xx Enery full: Energy rate");
            energy_label.xalign = 1;

            var voltage_label = new Gtk.Label ("Voltage: , Percent:  Capacity"); //Add flag when is lowr than X should be bought anew one
            voltage_label.xalign = 1;

            var title_entry = new Gtk.Entry ();
            title_entry.hexpand = true;
            title_entry.placeholder_text = "This page's title";

            var content_area = new Gtk.Grid ();
            content_area.column_spacing = 12;
            content_area.row_spacing = 12;
            content_area.margin = 12;
            content_area.attach (title_label, 0, 1, 1, 1);
            content_area.attach (vendor_label, 0, 2, 1, 1);
            content_area.attach (state_label, 0, 3, 1, 1);
            content_area.attach (warning_label, 0, 4, 1, 1);
            content_area.attach (energy_label, 0, 5, 1, 1);
            content_area.attach (voltage_label, 0,6, 1, 1);

            add (content_area);

            title_entry.changed.connect (() => {
                title = title_entry.text;
            });
        }
    }
}
