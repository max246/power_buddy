
namespace Powerbuddy {
    public class DevicePage : Granite.SettingsPage {

        Powerbuddy.DeviceModel model;
        Gtk.Label title_label;
        Gtk.Label state_label;
        Gtk.Label title_output_label;
        Gtk.Label state_output_label;
        Gtk.Label warning_label;
        Gtk.Label warning_output_label;
        Gtk.Label energy_label;
        Gtk.Label elpase_label;
        Gtk.ProgressBar elpase_time;
        Gtk.ProgressBar energy_amount;
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
            title_output_label= new Gtk.Label ("Last update:");
            title_output_label.xalign = 1;

            this.state_label = new Gtk.Label ("Current state:");
            this.state_label.xalign = 1;
            state_output_label = new Gtk.Label ("Current state: Charging");
            state_output_label.xalign = 1;

            warning_label = new Gtk.Label ("Warning:");//Check what warning are there
            warning_label.xalign = 1;
            warning_output_label = new Gtk.Label ("none");//Check what warning are there
            warning_output_label.xalign = 1;


            energy_label = new Gtk.Label ("Energy rate: 11W");//Cover to percent slider
            energy_label.xalign = 1;
            energy_amount = new Gtk.ProgressBar ();
            energy_amount.text = "15/50 Wh";
            energy_amount.set_fraction(0.5);
            energy_amount.set_show_text(true);

            elpase_label = new Gtk.Label ("Reamining time: x");//Cover to percent slider
            elpase_label.xalign = 1;
            elpase_time = new Gtk.ProgressBar ();
            elpase_time.text = "100%";
            elpase_time.set_fraction(0.5);
            elpase_time.set_show_text(true);

          /*  this.energy_label = new Gtk.Label ("Total enery: x , At the moment x and rate at x");//Cover to percent slider
            this.energy_label.xalign = 1;

            this.elpase_label = new Gtk.Label ("Reamining time: x and Percent %");//Cover to percent slider
            this.elpase_label.xalign = 1;*/

            var content_area = new Gtk.Grid ();
            content_area.column_spacing = 12;
            content_area.row_spacing = 12;
            content_area.margin = 12;
            content_area.attach (title_label, 0, 1, 1, 1);
            content_area.attach (title_output_label, 1, 1, 1, 1);
            content_area.attach (state_label, 0, 2, 1, 1);
            content_area.attach (state_output_label, 1, 2, 1, 1);
            content_area.attach (warning_label, 0, 3, 1, 1);
            content_area.attach (warning_output_label, 1, 3, 1, 1);
            content_area.attach (energy_label, 0, 4, 1, 1);
            content_area.attach (energy_amount, 1, 4, 1, 1);
            content_area.attach (elpase_label, 0, 5, 1, 1);
            content_area.attach (elpase_time, 1, 5, 1, 1);


            add (content_area);
        }

         public void update_data() {
            title_output_label.set_text(this.model.last_update.to_string() + " seconds ago");
            state_output_label.set_text(this.model.get_status());
            warning_output_label.set_text(this.model.warning);
            this.energy_label.set_text("Energy Rate: %.2f W".printf(this.model.energy_rate));
            this.elpase_label.set_text("Remaning time: %s ".printf( this.model.reamining_time));

            elpase_time.text = "%d%".printf(this.model.percent);
            elpase_time.set_fraction(((double)this.model.percent/100.0));

            energy_amount.set_fraction((double)this.model.energy/(double)this.model.energy_full);
            energy_amount.text =  "%.2f of %.2fWh".printf(this.model.energy, this.model.energy_full);
            show_all();
        }

    }
}
