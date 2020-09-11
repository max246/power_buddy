namespace Powerbuddy {

    public class BatteryModel : Powerbuddy.UPowerModel {

        public string vendor = "";
        public  string model = "";
        public string serial  = "";
        public bool has_history = false;
        public bool has_stats = false;
        public string state = "";
        public string warning = "";
        public double energy = 0;
        public double energy_full  = 0;
        public double energy_full_designed = 0;
        public double energy_rate = 0;
        public double voltage  = 0.0;
        public string time_to_full = "";
        public int percent = 0;
        public int capacity = 0;
        public string technology = "";


        public BatteryModel(string path) {
            Object(path:path);
            title = "Battery #";
            string regString = "BAT(?<num>[0-9])";
            Regex regex;
            MatchInfo match;
            try {
                regex = new Regex(regString);
                if (regex.match(path, 0, out match)) {
                    title = "Battery #"+  match.fetch_named("num").to_string();
                }
            } catch (Error error) {
                 print (@"$(error.message)\n");
            }

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
           // print(output);
            string[] lines = output.split("\n");
            foreach (string line in lines) {
              //  print(line);
                if (line.contains("updated:")) {
                    this.parse_last_update(line);
                } else if (line.contains("vendor:")){
                     this.vendor = this.get_second_colum(line);
                } else if (line.contains("model:")){
                     this.model = this.get_second_colum(line);
                } else if (line.contains("serial:")){
                     this.serial = this.get_second_colum(line);
                } else if (line.contains("has history:")){
                     if (this.get_second_colum(line).contains("yes")) this.has_history = true;
                     else this.has_history = false;
                } else if (line.contains("has statistics:")){
                    if (this.get_second_colum(line).contains("yes")) this.has_stats = true;
                    else this.has_stats = false;
                }else if (line.contains("state:")){
                     this.state = this.get_second_colum(line);
                }else if (line.contains("warning-level:")){
                     this.warning = this.get_second_colum(line);
                } else if (line.contains("energy:")){
                     this.energy = double.parse( this.get_second_colum(line).replace("Wh",""));
                }else if (line.contains("energy-full:")){
                     this.energy_full = double.parse( this.get_second_colum(line).replace("Wh",""));
                }else if (line.contains("energy-full-design:")){
                     this.energy_full_designed = double.parse( this.get_second_colum(line).replace("Wh",""));
                }else if (line.contains("energy-rate:")){
                     this.energy_rate = double.parse( this.get_second_colum(line).replace("Wh",""));
                }else if (line.contains("voltage:")){
                     this.voltage = double.parse( this.get_second_colum(line).replace("V",""));
                }else if (line.contains("percentage:")){
                     this.percent = int.parse( this.get_second_colum(line).replace("%",""));
                }else if (line.contains("capacity:")){
                     this.capacity = int.parse( this.get_second_colum(line).replace("%",""));
                }else if (line.contains("technology:")){
                     this.technology = this.get_second_colum(line);
                }
            }

        }
    }
}
