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

using App.Configs;

namespace App.Views {

    public class AppView : Gtk.Grid {

        private Gtk.ApplicationWindow app;
        private Gtk.HeaderBar headerbar;
        public Granite.Widgets.ModeButton view_mode;
        private App.Views.HomeView home_view;
        private App.Views.TView test_view;
        private App.Views.PackageView package_view;
        public Gtk.Stack content;

        construct {
            build_headerbar ();
            build_mode_buttons ();
            build_views ();
        }

        public AppView (Gtk.ApplicationWindow app) {
            this.app = app;
            app.set_default_size (900, 700);
            app.set_size_request (900, 700);
            app.resizable = false;
            app.deletable = true;
            app.set_titlebar (headerbar);

            var box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
            box.pack_end (content, true, true, 0);


            this.add (box);
            this.show_all ();
        }

        void build_headerbar () {

            headerbar = new Gtk.HeaderBar ();
            headerbar.title = _ ("Final Project");
            headerbar.show_close_button = true;
        }

        private void build_mode_buttons () {
            view_mode = new Granite.Widgets.ModeButton ();
            view_mode.margin = 1;
            view_mode.margin_right = 20;
            view_mode.append_text (_("Home"));
            view_mode.append_text (_("Testing"));
            view_mode.append_text (_("Packaging"));
            view_mode.selected = 0;

              view_mode.mode_changed.connect (
                () => {
                    switch (view_mode.selected) {
                    case 1 :
                        show_test ();
                        break;
                    case 2 :
                        show_package ();
                        break;
                    default :
                        show_home ();
                        break;
                    }
             });

            headerbar.set_custom_title (view_mode);
        }

        private void build_views () {
            content = new Gtk.Stack ();
            content.transition_type = Gtk.StackTransitionType.SLIDE_LEFT_RIGHT;
            content.transition_duration = 300;
            content.hhomogeneous = true;
            content.vhomogeneous = true;
            home_view = new HomeView ();
            test_view = new TView ();
            package_view = new PackageView ();
            content.add_named (home_view, "home");
            content.add_named (test_view, "test");
            content.add_named (package_view, "package");
            content.visible_child_name = "home";
        }

        public void show_home () {

            content.visible_child_name = "home";

        }

          public void show_test () {

            content.visible_child_name = "test";

        }

        public void show_package () {

            content.visible_child_name = "package";

        }
    }
}
