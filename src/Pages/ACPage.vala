namespace Powerbuddy {
    public class ACPage : Granite.SettingsPage {

        Powerbuddy.ACModel model;
        Gtk.Label title_label;
        Gtk.Label charger_label;
        public ACPage (Powerbuddy.ACModel model) {

               Object (
               header: model.get_header(),
                icon_name : "ac-adapter-symbolic",
                title: "Summary"
            );
            this.model = model;
            this.update_data();

        }

        construct {
            title_label = new Gtk.Label ("Last update:");
            title_label.xalign = 1;

            charger_label = new Gtk.Label ("Charger is connected");
            charger_label.xalign = 1;

            var content_area = new Gtk.Grid ();
            content_area.column_spacing = 12;
            content_area.row_spacing = 12;
            content_area.margin = 12;
            content_area.attach (title_label, 0, 1, 1, 1);
            content_area.attach (charger_label, 0, 2, 1, 1);

            add (content_area);
        }

        public void update_data() {
            this.title_label.set_text("Last update: "+this.model.last_update.to_string() + " seconds ago");

            this.charger_label.set_text(this.model.get_status());

            show_all();
        }
    }
}
