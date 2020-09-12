namespace Powerbuddy {

    public class DeviceModel :  Powerbuddy.UPowerModel  {

        private bool is_connected = false;
        public double energy = 0.0;
        public double energy_full = 0.0;
        public double energy_rate = 0.0;
        public string warning = "";
        public string reamining_time = "";
        public int percent = 0;



        public DeviceModel(string path) {
           Object(path:path);
           title = "Device";
           this.pull_data();
        }

        public string get_second_colum(string line) {
            string result = "";
            string regString = ":(\\s*)(?<text>.*)";
            Regex regex;
            MatchInfo match;
            try {
                regex = new Regex(regString);
                if (regex.match(line, 0, out match)) {
                     result =  match.fetch_named("text");
                }
            } catch (Error error) {
                 print (@"$(error.message)\n");
            }
            return result;
        }

        public void pull_data() {
            string output = this.excute_command();
            string[] lines = output.split("\n");
            foreach (string line in lines) {
              //  print(line);
                if (line.contains("updated:")) {
                    this.parse_last_update(line);
                } else if (line.contains("charging:")) {
                    if (line.contains("yes")) {
                        this.is_connected = true;
                    } else {
                        this.is_connected = false;
                    }
                } else if (line.contains("warning-level:")) {
                    this.warning = this.get_second_colum(line);
                } else if (line.contains("energy:")){
                     this.energy = double.parse( this.get_second_colum(line).replace("Wh",""));
                }else if (line.contains("energy-full:")){
                     this.energy_full = double.parse( this.get_second_colum(line).replace("Wh",""));
                }else if (line.contains("energy-rate:")){
                     this.energy_rate = double.parse( this.get_second_colum(line).replace("W",""));
                }else if (line.contains("time to empty:")){
                     this.reamining_time =  this.get_second_colum(line);
                }else if (line.contains("percentage:")){
                     this.percent = int.parse( this.get_second_colum(line).replace("%",""));
                }
            }
        }

        public string get_status() {
            if (this.is_connected) return "Charging";
            else return "Discharging";
        }
    }
}
