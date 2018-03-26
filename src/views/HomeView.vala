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

    public class HomeView : Gtk.Grid {
        public HomeView () {
             Gtk.Grid main_grid = new Gtk.Grid();
             Gtk.Entry entry = new Gtk.Entry ();
             main_grid.attach(entry, 0, 0, 2, 2);
             entry.placeholder_text  = "Git Repositary Link";

             Gtk.Button button = new Gtk.Button.with_label ("Initialize Project");
             main_grid.attach(button, 0, 2, 2, 2);
             

             button.clicked.connect (() => {
                string url = entry.get_text ();
                string command = "git clone ".concat (url);
                Posix.system (command);
                Posix.system ("notify-send \"Repositary Cloned Succesfully\"");

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
