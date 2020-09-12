namespace Powerbuddy {
    public class BatteryPage : Granite.SettingsPage {
        public BatteryPage (string header) {
            var user_name = Environment.get_user_name ();
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

            var energy_label = new Gtk.Label ("Energy rate: 11W");
            energy_label.xalign = 1;
            var energy_level = new Gtk.ProgressBar ();
            energy_level.text = "49.25/56Wh";
            energy_level.set_fraction(5.0);
            energy_level.set_show_text(true);

            var battery_charge = new Gtk.ProgressBar ();
            battery_charge.text = "100%";
            battery_charge.set_fraction(5.0);
            battery_charge.set_show_text(true);
            var voltage_label = new Gtk.Label ("Voltage: 11.5V ");
            voltage_label.xalign = 1;

            var capacity_label = new Gtk.Label ("Capacity:");
            capacity_label.xalign = 1;
            var battery_capacity = new Gtk.ProgressBar ();
            battery_capacity.text = "100%";
            battery_capacity.set_fraction(0.5);
            battery_capacity.set_show_text(true);

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
            content_area.attach (energy_level, 1, 5, 1, 1);
            content_area.attach (voltage_label, 0,6, 1, 1);
            content_area.attach (battery_charge, 1,6, 1, 1);
            content_area.attach (capacity_label, 0,7, 1, 1);
            content_area.attach (battery_capacity, 1,7, 1, 1);


var hbox = new Gtk.Box (Gtk.Orientation.VERTICAL, 5);
 hbox.add (content_area);

           // add (content_area);

             if (true) { //Check capacity if is less than X
                 var battery_low = new Gtk.Label ("!!! Your capacity is low, we suggest you might invest in a new battery !!!");
                // battery_low.xalign = 1;
                  hbox.add (battery_low);
            }

            var battery_purchase = new Powerbuddy.BatteryPurchase();
             hbox.add(battery_purchase);

             add(hbox);

            title_entry.changed.connect (() => {
                title = title_entry.text;
            });
        }
    }
}
