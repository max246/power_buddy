
namespace Powerbuddy {
    public class DevicePage : Granite.SettingsPage {

        Powerbuddy.DeviceModel model;
        Gtk.Label title_label;
        Gtk.Label state_label;
        Gtk.Label warning_label;
        Gtk.Label energy_label;
        Gtk.Label elpase_label;
        public DevicePage (Powerbuddy.DeviceModel model) {

               Object (
               header: header,
                icon_name : "summary",
                title: "Summary"
            );
            this.model = model;
            this.update_data();

        }

        construct {
            this.title_label = new Gtk.Label ("Last update:");
            this.title_label.xalign = 1;

            this.state_label = new Gtk.Label ("Current state: Charging");
            this.state_label.xalign = 1;

            this.warning_label = new Gtk.Label ("Warning: none");//Check what warning are there
            this.warning_label.xalign = 1;

            this.energy_label = new Gtk.Label ("Total enery: x , At the moment x and rate at x");//Cover to percent slider
            this.energy_label.xalign = 1;

            this.elpase_label = new Gtk.Label ("Reamining time: x and Percent %");//Cover to percent slider
            this.elpase_label.xalign = 1;

            var content_area = new Gtk.Grid ();
            content_area.column_spacing = 12;
            content_area.row_spacing = 12;
            content_area.margin = 12;
            content_area.attach (title_label, 0, 1, 1, 1);
            content_area.attach (state_label, 0, 2, 1, 1);
            content_area.attach (warning_label, 0, 3, 1, 1);
            content_area.attach (energy_label, 0, 4, 1, 1);
            content_area.attach (this.elpase_label, 0, 5, 1, 1);

            add (content_area);
        }

         public void update_data() {
            this.title_label.set_text("Last update: "+this.model.last_update.to_string() + " seconds ago");
            this.state_label.set_text("Current state: "+this.model.get_status());
            this.warning_label.set_text("Warning: "+this.model.warning);
            this.energy_label.set_text("Energy: %.2f of %.2f Wh | Rate: %.2f W".printf(this.model.energy, this.model.energy_full, this.model.energy_rate));
            this.elpase_label.set_text("Remaning time: %s  | Percent: %d".printf( this.model.reamining_time, this.model.percent));


            show_all();
        }

    }
}
