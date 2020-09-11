namespace Powerbuddy {

    public  abstract class UPowerModel : Object {

        //public abstract string path { get; set construct; }
        protected string _path;
        public virtual string path {
            get {
                return this._path;
            }
            set {
                this._path = value;
            }
        }

       construct {
           this.path = "NO-PATH";
       }



        public string excute_command() {
            string ls_stdout = "";
            string ls_stderr = "";
            int ls_status = 0;
            try{
                Process.spawn_command_line_sync ("upower -i "+this.path,
                                    out ls_stdout,
                                    out ls_stderr,
                                    out ls_status);

                print(ls_stdout);

            } catch (SpawnError e) {
                print ("Error: %s\n", e.message);
            }
            return ls_stdout;
        }
    }
}
