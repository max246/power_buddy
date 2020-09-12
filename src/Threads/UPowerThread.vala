namespace Powerbuddy {
    public class UPowerThread  : Object  {

        private string name;
        public signal void cb (Gee.ArrayList<Powerbuddy.UPowerModel>  models);
        public UPowerThread (string name) {
            this.name = name;
        }
        public int thread_func () {
            var models = get_models();
            this.cb(models);
            return 1;
        }

        public Gee.ArrayList<Powerbuddy.UPowerModel> get_models() {
            var models = new Gee.ArrayList<Powerbuddy.UPowerModel>();
            string ls_stdout = "";
            string ls_stderr = "";
            int ls_status = 0;//"flatpak-spawn" , " --host",
            string[] spawn_args = {"flatpak-spawn" , "--host",  "upower" ,"-e"};
		    string[] spawn_env = Environ.get ();

            try{
		            Process.spawn_sync ("/",
							            spawn_args,
							            spawn_env,
							            SpawnFlags.SEARCH_PATH,
							            null,
							            out ls_stdout,
							            out ls_stderr,
							            out ls_status);

		            // Output: <File list>
		            print("stdout:\n");
				    print (ls_stdout);
                    print ("stderr:\n");
		            print (ls_stderr);
		            // Output: ``0``
		            print ("Status: %d\n", ls_status);
		            if (ls_status == 0) {
                        string[] paths = ls_stdout.split ("\n");
                        foreach (unowned string str in paths) {
                            if (str.contains("/org/freedesktop")) {
		                        if (str.contains("/battery_")) {
		                            models.add(new Powerbuddy.BatteryModel(str));
		                        } else if (str.contains("_AC")) {
		                            models.add(new Powerbuddy.ACModel(str));
		                        } else if (str.contains("/DisplayDevice")) {
		                            models.add(new Powerbuddy.DeviceModel(str));
		                        } else {
		                            models.add(new Powerbuddy.OtherBatteryModel(str));
		                        }
		                         print("adding "+str+"\n");
		                     }
	                    }
	                }

            } catch (SpawnError e) {
                print ("Error: %s\n", e.message);
            }catch (Error e) {
                // error logging here
              print ("Error: %s\n", e.message);
            }
            return models;
        }


    }
}
