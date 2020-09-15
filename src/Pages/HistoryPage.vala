namespace Powerbuddy {
    public class HistoryPage : Granite.SettingsPage {


//./var/lib/upower/history-time-full-DELL_KP4377-57-22096.dat

        Powerbuddy.BatteryModel model;
        public HistoryPage (Powerbuddy.BatteryModel model) {

               Object (
                title: "History",
                icon_name : "history"
            );
            this.model = model;

        }

        construct {
            var title_label = new Gtk.Label ("Title:");
            title_label.xalign = 1;

            var title_entry = new Gtk.Entry ();
            title_entry.hexpand = true;
            title_entry.placeholder_text = "This page's title";

            var content_area = new Gtk.Grid ();
            content_area.column_spacing = 12;
            content_area.row_spacing = 12;
            content_area.margin = 12;
            content_area.attach (title_label, 0, 1, 1, 1);
            content_area.attach (title_entry, 1, 1, 1, 1);

            add (content_area);

            title_entry.changed.connect (() => {
                title = title_entry.text;
            });
        }


    }
}
