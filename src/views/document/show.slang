h1 Show Document
p = document.name
p = document.description
p
  == link_to("back", "/documents", class: "btn btn-light btn-sm")
  == link_to("edit", "/documents/#{document.id}/edit", class: "btn btn-success btn-sm")
  == link_to("delete", "/documents/#{document.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
