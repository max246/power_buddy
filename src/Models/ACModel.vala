namespace Powerbuddy {

    public class ACModel : Powerbuddy.UPowerModel {

        public ACModel(string path) {
            Object(path: path);
        }

        public void pull_data() {
            string output = this.excute_command();
            print (output);
        }
    }
}
