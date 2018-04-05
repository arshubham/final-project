/*-
 * Copyright (c) 2018 Shubham Arora (https://github.com/arshubham/urutau-icon-pack)
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301 USA.
 *
 * Authored by: Shubham Arora <shubhamarora@protonmail.com>
 */

namespace App.Views {

    public class TView : Gtk.Grid {

        private Gtk.ScrolledWindow terminal_output;
        public Gtk.TextView terminal_view { get; construct; }

        construct {

	    terminal_view = new Gtk.TextView ();
	    terminal_view.buffer.text = "Select a test to run";
        terminal_view.bottom_margin = terminal_view.top_margin = terminal_view.left_margin = terminal_view.right_margin = 12;
        terminal_view.editable = false;
        terminal_view.cursor_visible = true;
        terminal_view.monospace = true;
        terminal_view.wrap_mode = Gtk.WrapMode.WORD_CHAR;
        terminal_view.get_style_context ().add_class ("terminal");

        terminal_output = new Gtk.ScrolledWindow (null, null);
        terminal_output.hscrollbar_policy = Gtk.PolicyType.NEVER;
        terminal_output.expand = true;
        terminal_output.add (terminal_view);


            Gtk.Box load_icons_button_box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);

  Gtk.Button vala_lint = new Gtk.Button.with_label ("Vala Lint");

   Gtk.Button memcheck = new Gtk.Button.with_label ("Memcheck");

   
    Gtk.Button cachecheck = new Gtk.Button.with_label ("Cachegrind");





  vala_lint.clicked.connect (() => {
        try {
           int exitCode;
           string std_out;
           string cmd = "io.elementary.vala-lint -d cipher/";
           Process.spawn_command_line_sync(cmd, out std_out, null, out exitCode);
           stdout.printf (std_out);
           terminal_view.buffer.text = std_out;
            }
            catch (Error e){
    stdout.printf (e.message);
            }

        });
        
  memcheck.clicked.connect (() => {
                  terminal_view.buffer.text = "Running Memcheck.......";
    try {
        int exitCode;   
        string std_out;

        string cmd = "valgrind --log-file=\"log.txt\" --leak-check=yes com.github.arshubham.cipher";
        Process.spawn_command_line_sync(cmd, out std_out, null, out exitCode);                      
        stdout.printf (std_out);


    } catch (Error e) {
        stdout.printf (e.message);
    }
    
       try {
        int exitCode;   
        string std_out2;
        string cmd2 = "cat /home/shubhamarora/log.txt";
 Process.spawn_command_line_sync(cmd2, out std_out2, null, out exitCode);
        stdout.printf (std_out2);

        terminal_view.buffer.text = std_out2;
    } catch (Error e) {
        stdout.printf (e.message);
    }
    
  });
  
   cachecheck.clicked.connect (() => {
                   terminal_view.buffer.text = "Running Cachegrind.......";
      try {
        int exitCode;   
        string std_out;

        string cmd = "valgrind  --tool=cachegrind  --log-file=\"/home/shubhamarora/log2.txt\" com.github.arshubham.cipher";
        Process.spawn_command_line_sync(cmd, out std_out, null, out exitCode);                      
        stdout.printf (std_out);


    } catch (Error e) {
        stdout.printf (e.message);
    }
    
       try {
        int exitCode;   
        string std_out2;
        string cmd2 = "cat /home/shubhamarora/log2.txt";
 Process.spawn_command_line_sync(cmd2, out std_out2, null, out exitCode);
        stdout.printf (std_out2);

        terminal_view.buffer.text = std_out2;
    } catch (Error e) {
        stdout.printf (e.message);
    }
    
   });

            load_icons_button_box.pack_start (vala_lint, false, false, 0);
            load_icons_button_box.pack_start (memcheck, false, false, 0);
            load_icons_button_box.pack_start (cachecheck, false, false, 0);
            attach (terminal_output, 0, 0, 1, 1);
            attach (new Gtk.Separator (Gtk.Orientation.HORIZONTAL), 0, 1, 1, 1);
            attach (load_icons_button_box, 0, 2, 1, 1);
        }



    }
}
