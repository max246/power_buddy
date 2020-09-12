namespace Powerbuddy {

    public  abstract class UPowerModel : Object {

        //public abstract string path { get; set construct; }
        protected string _last_update = "";
        protected string _path;
        protected string _title;
        public virtual string path {
            get {
                return this._path;
            }
            set {
                this._path = value;
            }
        }

        public virtual string title {
            get {
                return this._title;
            }
            set {
                this._title = value;
            }
        }

        public virtual string last_update {
            get {
                return this._last_update;
            }
            set {
                this._last_update = value;
            }
        }

        construct {
            this.path = "NO-PATH";
        }


        public string get_header() {
            return this._title;
        }

        public string excute_command() {
            string ls_stdout = "";
            string ls_stderr = "";
            int ls_status = 0;//"flatpak-spawn" , " --host",
            string[] spawn_args = {"flatpak-spawn" , "--host",  "upower" ,"-i", this.path};
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
		            //print("stdout:\n");
				   // print (ls_stdout);
                   // print ("stderr:\n");
		           // print (ls_stderr);
		            // Output: ``0``
		            //print ("Status: %d\n", ls_status);
             } catch (SpawnError e) {
                print ("Error: %s\n", e.message);
            }catch (Error e) {
                // error logging here
              print ("Error: %s\n", e.message);
            }
            return ls_stdout;
        }

        public void parse_last_update(string line) {

            string regString = "\\((?<num>.*) seconds ago";
            Regex regex;
            MatchInfo match;
            try {
                regex = new Regex(regString);
                if (regex.match(line, 0, out match)) {
                    this._last_update = match.fetch_named("num");
                }
            } catch (Error error) {
                 print (@"$(error.message)\n");
            }
        }
    }
}
