namespace Powerbuddy {
    public class ACPage : Granite.SettingsPage {
        public ACPage (string header) {

               Object (
               header: header,
                icon_name : "ac-adapter-symbolic",
                title: "Summary"
            );
        }

        construct {
            var title_label = new Gtk.Label ("Last update:");
            title_label.xalign = 1;

            var charger_label = new Gtk.Label ("Charger is connected");
            charger_label.xalign = 1;

            var content_area = new Gtk.Grid ();
            content_area.column_spacing = 12;
            content_area.row_spacing = 12;
            content_area.margin = 12;
            content_area.attach (title_label, 0, 1, 1, 1);
            content_area.attach (charger_label, 0, 2, 1, 1);

            add (content_area);
        }
    }
}
