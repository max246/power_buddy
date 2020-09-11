namespace Powerbuddy {
    public class BatteryPage : Granite.SettingsPage {

        Powerbuddy.BatteryModel model;
        Gtk.Label title_label;
        Gtk.Label vendor_label;
        Gtk.Label state_label;
        Gtk.Label warning_label;
        Gtk.Label energy_label;
        Gtk.Label voltage_label;

        public BatteryPage (Powerbuddy.BatteryModel model) {

               Object (
               header: model.get_header(),
                icon_name : "summary",
                title: "Summary"
            );
            this.model =model;
            this.update_data();

        }

        construct {
            this.title_label = new Gtk.Label ("Last update:");
            this.title_label.xalign = 1;

            this.vendor_label = new Gtk.Label ("Vendor : x Model: y Serial: x Tech lipo:x ");
            this.vendor_label.xalign = 1;

            this.state_label = new Gtk.Label ("Current state: xxx");
            this.state_label.xalign = 1;

            this.warning_label = new Gtk.Label ("Warning xx");
            this.warning_label.xalign = 1;

            this.energy_label = new Gtk.Label ("Energy:  xx Enery full: Energy rate");
            this.energy_label.xalign = 1;

            this.voltage_label = new Gtk.Label ("Voltage: , Percent:  Capacity"); //Add flag when is lowr than X should be bought anew one
            this.voltage_label.xalign = 1;

            var title_entry = new Gtk.Entry ();
            title_entry.hexpand = true;
            title_entry.placeholder_text = "This page's title";

            var content_area = new Gtk.Grid ();
            content_area.column_spacing = 12;
            content_area.row_spacing = 12;
            content_area.margin = 12;
            content_area.attach (this.title_label, 0, 1, 1, 1);
            content_area.attach (this.vendor_label, 0, 2, 1, 1);
            content_area.attach (this.state_label, 0, 3, 1, 1);
            content_area.attach (this.warning_label, 0, 4, 1, 1);
            content_area.attach (this.energy_label, 0, 5, 1, 1);
            content_area.attach (this.voltage_label, 0,6, 1, 1);

            add (content_area);

            title_entry.changed.connect (() => {
                title = title_entry.text;
            });
        }

         public void update_data() {
            this.title_label.set_text("Last update: "+this.model.last_update.to_string() + " seconds ago");
            this.vendor_label.set_text("Vendor: %s | Model: %s | Serial: %s".printf(this.model.vendor, this.model.model, this.model.serial));
            this.state_label.set_text(this.model.state);
            this.warning_label.set_text(this.model.warning);
            this.energy_label.set_text("Energy: %.2f of %.2f ( %.2f ) Wh | Rate: %.2f W".printf(this.model.energy, this.model.energy_full, this.model.energy_full_designed, this.model.energy_rate));
            this.voltage_label.set_text("Voltage: %.2fV | Capacity: %d% | Percent %d%".printf(this.model.voltage, this.model.capacity, this.model.percent));

            show_all();
        }

    }
}
