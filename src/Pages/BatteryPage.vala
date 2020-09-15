namespace Powerbuddy {
    public class BatteryPage : Granite.SettingsPage {

        Powerbuddy.BatteryModel model;
        Gtk.Label title_label;
        Gtk.Label title_output_label;
        Gtk.Label vendor_label;
        Gtk.Label vendor_output_label;
        Gtk.Label model_label;
        Gtk.Label model_output_label;
        Gtk.Label serial_label;
        Gtk.Label serial_output_label;
        Gtk.Label tech_label;
        Gtk.Label tech_output_label;
        Gtk.Label state_label;
        Gtk.Label state_output_label;
        Gtk.Label warning_label;
        Gtk.Label warning_output_label;
        Gtk.Label energy_label;
        Gtk.Label voltage_label;
        Gtk.Label capacity_label;
        Gtk.ProgressBar energy_level;
        Gtk.Label  battery_charge;
        Gtk.ProgressBar battery_capacity;
        Gtk.Entry title_entry;
        Gtk.Grid  content_area;
        Gtk.Label energy_rate_label;
        Gtk.Label energy_rate_output_label;
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
            title_label = new Gtk.Label ("Last update:");
            title_label.xalign = 1;
            title_output_label= new Gtk.Label ("Last update:");
            title_output_label.xalign = 1;

            vendor_label = new Gtk.Label ("Vendor");
            vendor_label.xalign = 1;
            vendor_output_label = new Gtk.Label ("x");
            vendor_output_label.xalign = 1;


            model_label = new Gtk.Label (" Model:");
            model_label.xalign = 1;
            model_output_label = new Gtk.Label ("x");
            model_output_label.xalign = 1;


            serial_label = new Gtk.Label ("Serial:");
            serial_label.xalign = 1;
            serial_output_label = new Gtk.Label ("x");
            serial_output_label.xalign = 1;

            tech_label = new Gtk.Label ("Tech:");
            tech_label.xalign = 1;
            tech_output_label = new Gtk.Label ("x");
            tech_output_label.xalign = 1;

            state_label = new Gtk.Label ("Current state:");
            state_label.xalign = 1;
            state_output_label = new Gtk.Label ("xxx");
            state_output_label.xalign = 1;

            warning_label = new Gtk.Label ("Warning:");
            warning_label.xalign = 1;
            warning_output_label = new Gtk.Label ("Warning:");
            warning_output_label.xalign = 1;


            energy_label = new Gtk.Label ("Energy:");
            energy_label.xalign = 1;
            energy_level = new Gtk.ProgressBar ();
            energy_level.text = "49.25/56Wh";
            energy_level.set_fraction(0.0);
            energy_level.set_show_text(true);

            energy_rate_label = new Gtk.Label ("Energy rate:");
            energy_rate_label.xalign = 1;
            energy_rate_output_label = new Gtk.Label ("Energy rate:");
            energy_rate_output_label.xalign = 1;

            battery_charge = new Gtk.Label ("11.5V");
            voltage_label = new Gtk.Label ("Voltage:"); //Add flag when is lowr than X should be bought anew one
            voltage_label.xalign = 1;


            capacity_label = new Gtk.Label ("Capacity:");
            capacity_label.xalign = 1;
            battery_capacity = new Gtk.ProgressBar ();
            battery_capacity.text = "100%";
            battery_capacity.set_fraction(0.5);
            battery_capacity.set_show_text(true);

            title_entry = new Gtk.Entry ();
            title_entry.hexpand = true;
            title_entry.placeholder_text = "This page's title";

            content_area = new Gtk.Grid ();
            content_area.column_spacing = 4;
            content_area.row_spacing = 12;
            content_area.margin = 12;

            content_area.attach (title_label, 0, 1, 1, 1);
            content_area.attach (title_output_label, 1, 1, 1, 1);
            content_area.attach (vendor_label, 0, 2, 1, 1);
            content_area.attach (vendor_output_label, 1, 2, 1, 1);
            content_area.attach (model_label, 0, 3, 1, 1);
            content_area.attach (model_output_label, 1, 3, 1, 1);
            content_area.attach (serial_label, 0, 4, 1, 1);
            content_area.attach (serial_output_label, 1, 4, 1, 1);
            content_area.attach (tech_label, 0, 5, 1, 1);
            content_area.attach (tech_output_label, 1, 5, 1, 1);
            content_area.attach (state_label, 0, 6, 1, 1);
            content_area.attach (state_output_label, 1, 6, 1, 1);
            content_area.attach (warning_label, 0, 7, 1, 1);
            content_area.attach (warning_output_label, 1, 7, 1, 1);
            content_area.attach (energy_label, 0, 8, 1, 1);
            content_area.attach (energy_level, 1, 8, 1, 1);
            content_area.attach (voltage_label, 0,9, 1, 1);
            content_area.attach (battery_charge, 1,9, 1, 1);
            content_area.attach (capacity_label, 0,10, 1, 1);
            content_area.attach (battery_capacity, 1,10, 1, 1);


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

            /*content_area.attach (this.title_label, 0, 1, 1, 1);
            content_area.attach (this.vendor_label, 0, 2, 1, 1);
            content_area.attach (this.state_label, 0, 3, 1, 1);
            content_area.attach (this.warning_label, 0, 4, 1, 1);
            content_area.attach (this.energy_label, 0, 5, 1, 1);
            content_area.attach (this.voltage_label, 0,6, 1, 1);*/


             add(hbox);

            title_entry.changed.connect (() => {
                title = title_entry.text;
            });
        }

         public void update_data() {
            title_output_label.set_text(this.model.last_update.to_string() + " seconds ago");
            vendor_output_label.set_text(this.model.vendor);
            model_output_label.set_text(this.model.model);
            serial_output_label.set_text(this.model.serial);
            tech_output_label.set_text( this.model.technology);
            state_output_label.set_text(this.model.state);
            this.warning_output_label.set_text(this.model.warning);
            energy_rate_output_label.set_text("%.2f W".printf(this.model.energy_rate));
            this.battery_charge.set_text("%.2fV".printf(this.model.voltage));


            battery_capacity.set_fraction((double)this.model.capacity/100.0);
            battery_capacity.text = "%d (%.2fWh)".printf(this.model.capacity,this.model.energy_full_designed);

            energy_level.set_fraction((double)this.model.energy/(double)this.model.energy_full);
            energy_level.text = "%.2f of %.2fWh (%d)".printf(this.model.energy, this.model.energy_full, this.model.percent);
            show_all();
        }

    }
}
