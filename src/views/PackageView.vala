/*-
 * Copyright (c) 2018 Shubham Arora
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

    public class PackageView : Gtk.Grid {

        private Gtk.ScrolledWindow terminal_output;
        public Gtk.TextView terminal_view { get; construct; }

        construct {

	    terminal_view = new Gtk.TextView ();
	    terminal_view.buffer.text = "Select an option";
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

  Gtk.Button view = new Gtk.Button.with_label ("View Manifest");

   Gtk.Button build = new Gtk.Button.with_label ("Build Flatpak");

   
    Gtk.Button repo = new Gtk.Button.with_label ("Create Repo");
    Gtk.Button install = new Gtk.Button.with_label ("Install & Test");





  view.clicked.connect (() => {
        try {
           int exitCode;
           string std_out;
           string cmd = "cat /home/shubhamarora/Projects/final-project/flatpak/cipher.json";
           Process.spawn_command_line_sync(cmd, out std_out, null, out exitCode);
           stdout.printf (std_out);
           terminal_view.buffer.text = std_out;
            }
            catch (Error e){
    stdout.printf (e.message);
            }

        });       

build.clicked.connect (() => {
      try {
         int exitCode;
         string std_out;
         string cmd = "flatpak-builder --force-clean  --repo=cipher-repo /home/shubhamarora/Projects/final-project/flatpak/cipher /home/shubhamarora/Projects/final-project/flatpak/cipher.json";
         Process.spawn_command_line_sync(cmd, out std_out, null, out exitCode);
         stdout.printf (std_out);
         terminal_view.buffer.text = std_out;
          }
          catch (Error e){
  stdout.printf (e.message);
          }

      });  
      
      repo.clicked.connect (() => {
            try {
               int exitCode;
               string std_out;
               string cmd = "flatpak --user remote-add --no-gpg-verify --if-not-exists cipher-repo /home/shubhamarora/Projects/final-project/flatpak/cipher-repo";
               Process.spawn_command_line_sync(cmd, out std_out, null, out exitCode);
               stdout.printf (std_out);
               terminal_view.buffer.text = std_out;
                }
                catch (Error e){
        stdout.printf (e.message);
                }
      
            }); 
            
            install.clicked.connect (() => {
                  try {
                     int exitCode;
                     string std_out;
                     string cmd = "flatpak --user install /home/shubhamarora/Projects/final-project/cipher-repo con.github.arshubham.cipher";
                     Process.spawn_command_line_sync(cmd, out std_out, null, out exitCode);
                     stdout.printf (std_out);
                     terminal_view.buffer.text = std_out;
                      }
                      catch (Error e){
              stdout.printf (e.message);
                      }
            
                  });   
      
            load_icons_button_box.pack_start (view, false, false, 0);
            load_icons_button_box.pack_start (build, false, false, 0);
            load_icons_button_box.pack_start (repo, false, false, 0);
            load_icons_button_box.pack_start (install, false, false, 0);
            attach (terminal_output, 0, 0, 1, 1);
            attach (new Gtk.Separator (Gtk.Orientation.HORIZONTAL), 0, 1, 1, 1);
            attach (load_icons_button_box, 0, 2, 1, 1);
        }



    }
}

