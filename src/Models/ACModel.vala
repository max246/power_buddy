namespace Powerbuddy {

    public class ACModel : Powerbuddy.UPowerModel {


        private bool is_connected = false;
        public ACModel(string path) {
            Object(path: path);
            title = "AC";
            this.pull_data();
        }


        public void pull_data() {
            string output = this.excute_command();
            string[] lines = output.split("\n");
            foreach (string line in lines) {
              //  print(line);
                if (line.contains("updated:")) {
                    this.parse_last_update(line);
                } else if (line.contains("online:")) {
                    if (line.contains("yes")) {
                        this.is_connected = true;
                    } else {
                        this.is_connected = false;
                    }
                }
            }
        }

        public string get_status() {
            if (this.is_connected) return "Charger is connected";
            else return "Charger is not connected";
        }
    }
}
