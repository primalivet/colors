open Colors

let () =
  Dream.run @@ Dream.logger
  @@ Dream.router
       [
         Dream.get "/" (fun _ ->
             Template.index_page |> Template.layout "Home" |> Template.print
             |> Dream.html);
         Dream.get "/about" (fun _ ->
             Template.about_page |> Template.layout "About" |> Template.print
             |> Dream.html);
         Dream.post "/hx/heart-likes-increase" (fun _ ->
             Template.about_page |> Template.layout "About" |> Template.print
             |> Dream.html);
       ]
