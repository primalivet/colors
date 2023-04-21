open Base
open Tyxml.Html

let print document = Caml.Format.asprintf "%a" (Tyxml.Html.pp ()) document

let layout page_title page_content =
  html
    (head
       (title (txt page_title))
       [
         script ~a:[ a_src "https://cdn.tailwindcss.com" ] (txt "");
         meta ~a:[ a_charset "UTF-8" ] ();
         meta
           ~a:
             [
               a_name "viewport";
               a_content "width=device-width, initial-scale=1.0";
             ]
           ();
       ])
    (body
       ~a:[ a_class [ "dark" ] ]
       [
         div
           ~a:[ a_class [ "flex flex-col min-h-screen" ] ]
           [
             header
               ~a:[ a_class [ "bg-slate-200 sm:flex-grow sm:w-full p-2" ] ]
               [
                 h1
                   ~a:[ a_class [ "flex gap-2" ] ]
                   [ txt "Colors"; span [ txt page_title ] ];
                 nav
                   ~a:[ a_id "navigation" ]
                   [
                     h2 ~a:[ a_class [ "hidden" ] ] [ txt "Navigation" ];
                     ul
                       ~a:[ a_class [ "flex gap-2" ] ]
                       [
                         li
                           [
                             a
                               ~a:[ a_class [ "text-sky-600" ]; a_href "/" ]
                               [ txt "Home" ];
                           ];
                         li
                           [
                             a
                               ~a:
                                 [ a_class [ "text-sky-600" ]; a_href "/about" ]
                               [ txt "About" ];
                           ];
                       ];
                   ];
               ];
             main ~a:[ a_class [ "p-2 grow" ]; a_id "main" ] [ page_content ];
             footer ~a:[ a_class ["p-2 bg-slate-200 "]; a_id "footer" ] [ txt "Footer" ];
           ];
         script ~a:[ a_src "https://unpkg.com/htmx.org@1.9.0" ] (txt "");
       ])

let index_page = div [ txt "Index page" ]
let about_page = div [ txt "About page" ]
let hello _ = div [ txt @@ "Hello " ^ "world" ]
let key_val (k, v) = div [ span [ txt k ]; span [ txt ": " ]; span [ txt v ] ]
let goodbye queries = div (queries |> List.map ~f:key_val)
