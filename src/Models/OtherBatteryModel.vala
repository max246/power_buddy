namespace Powerbuddy {

    public class OtherBatteryModel:  Powerbuddy.UPowerModel {



        public OtherBatteryModel(string path) {
            Object(path:path);
            title = "Other";
        }

        public void pull_data() {

        }
    }
}
