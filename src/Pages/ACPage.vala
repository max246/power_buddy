namespace Powerbuddy {
    public class ACPage : Granite.SettingsPage {

        Powerbuddy.ACModel model;
        Gtk.Label title_label;
        Gtk.Label title_output_label;
        Gtk.Label charger_label;
        Gtk.Label charger_output_label;
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
            title_output_label = new Gtk.Label ("");
            title_output_label.xalign = 1;

            charger_label = new Gtk.Label ("Status:");
            charger_label.xalign = 1;
            charger_output_label = new Gtk.Label ("Charger is connected");
            charger_output_label.xalign = 1;

            var content_area = new Gtk.Grid ();
            content_area.column_spacing = 2;
            content_area.row_spacing = 12;
            content_area.margin =4;
            content_area.attach (title_label, 0, 1, 1, 1);
            content_area.attach (title_output_label, 1, 1, 1, 1);
            content_area.attach (charger_label, 0, 2, 1, 1);
            content_area.attach (charger_output_label, 1, 2, 1, 1);

            add (content_area);
        }

        public void update_data() {
            title_output_label.set_text(this.model.last_update.to_string() + " seconds ago");
            charger_output_label.set_text(this.model.get_status());

            show_all();
        }
    }
}
