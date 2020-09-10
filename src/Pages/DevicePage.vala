
namespace Powerbuddy {
    public class DevicePage : Granite.SettingsPage {
        public DevicePage (string header) {
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

            var state_label = new Gtk.Label ("Current state: Charging");
            state_label.xalign = 1;

            var warning_label = new Gtk.Label ("Warning: none");//Check what warning are there
            warning_label.xalign = 1;

            var energy_label = new Gtk.Label ("Total enery: x , At the moment x and rate at x");//Cover to percent slider
            energy_label.xalign = 1;

            var elpase_label = new Gtk.Label ("Reamining time: x and Percent %");//Cover to percent slider
            elpase_label.xalign = 1;

            var content_area = new Gtk.Grid ();
            content_area.column_spacing = 12;
            content_area.row_spacing = 12;
            content_area.margin = 12;
            content_area.attach (title_label, 0, 1, 1, 1);
            content_area.attach (state_label, 0, 2, 1, 1);
            content_area.attach (warning_label, 0, 3, 1, 1);
            content_area.attach (energy_label, 0, 4, 1, 1);
            content_area.attach (elpase_label, 0, 5, 1, 1);

            add (content_area);
        }
    }
}
