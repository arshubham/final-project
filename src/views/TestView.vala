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

    public class TestView : Gtk.Grid {
    public TestView () {
    
  Gtk.Grid main_grid = new Gtk.Grid();

  Gtk.Button vala_lint = new Gtk.Button.with_label ("Vala Lint");
  main_grid.attach(vala_lint, 0, 2, 2, 2);
   Gtk.Button memcheck = new Gtk.Button.with_label ("Memcheck");
   main_grid.attach(memcheck, 0, 4, 2, 2);
   
    Gtk.Button cachecheck = new Gtk.Button.with_label ("Memcheck");
    main_grid.attach(cachecheck, 0, 6, 2, 2);

  vala_lint.clicked.connect (() => {
        try {
           int exitCode;
           string std_out;
           string cmd = "io.elementary.vala-lint -d cipher/";
           Process.spawn_command_line_sync(cmd, out std_out, null, out exitCode);
           stdout.printf (std_out);
            }
            catch (Error e){
    stdout.printf (e.message);
            }

        });
        
  memcheck.clicked.connect (() => {
    try {
        int exitCode;
        string std_out;
        string cmd = "valgrind --log-file=\"log.txt\" --leak-check=yes com.github.arshubham.cipher";
        Process.spawn_command_line_sync(cmd, out std_out, null, out exitCode);
        stdout.printf (std_out);
    } catch (Error e) {
        stdout.printf (e.message);
    }
  });
  
   cachecheck.clicked.connect (() => {
     try {
         int exitCode;
         string std_out;
         string cmd = "valgrind --tool=cachegrind com.github.arshubham.cipher";
         Process.spawn_command_line_sync(cmd, out std_out, null, out exitCode);
         stdout.printf (std_out);
     } catch (Error e) {
         stdout.printf (e.message);
     }
   });
  
  main_grid.set_row_spacing (50);
  main_grid.set_column_spacing (50);
  main_grid.set_halign (Gtk.Align.CENTER);
  main_grid.set_row_baseline_position (0, Gtk.BaselinePosition.CENTER);
  main_grid.set_hexpand (true);
  main_grid.set_margin_top (100);
  main_grid.set_margin_left (20);
  main_grid.set_margin_right (20);
  main_grid.set_column_homogeneous(true);
  this.add (main_grid);
	

    }
    }
}
