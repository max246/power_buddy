namespace Powerbuddy {

    public class HistoryGraph : Gtk.Box {
         private LiveChart.Chart live_chart;
         public LiveChart.Config config;

         construct {
            config = new LiveChart.Config ();
            config.y_axis.unit = "%";
            config.y_axis.tick_interval = 25;
            config.y_axis.fixed_max = 100.0;
            config.y_axis.labels.visible = false;
            config.x_axis.labels.visible = false;

            config.padding = LiveChart.Padding () {
                smart = LiveChart.AutoPadding.NONE,
                top = 0,
                right = 0,
                bottom = 0,
                left = -1
            };

            live_chart = new LiveChart.Chart (config);
            live_chart.expand = true;
            live_chart.legend.visible = false;
            live_chart.grid.visible = true;
            live_chart.background.main_color = Gdk.RGBA () {
                red= 1, green= 1, blue= 1, alpha= 1
            };


            //might not need it
            live_chart.refresh_every(1000);

         }

         public HistoryGraph() {

            for (int i = 0; i < series_quantity; i++) {
                var renderer = new LiveChart.SmoothLineArea (new LiveChart.Values(1000));
                var serie = new LiveChart.Serie (("Serie %d").printf(i), renderer);
                serie.set_main_color ({ 0.35 + i/20, 0.8, 0.1, 1.0});
                live_chart.add_serie (serie);
            }
            add (live_chart);

         }

         public void update() {

         }

         public void set_data() {

         }
    }
}
