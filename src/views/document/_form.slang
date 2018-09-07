- if document.errors
  ul.errors
    - document.errors.each do |error|
      li = error.to_s

== form(action: "/documents/#{document.id.to_s}", method: document.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "name", value: document.name, placeholder: "Name", class: "form-control")
  .form-group
    == text_area(name: "description", content: document.description, placeholder: "Description", class: "form-control", size: "30x10")
  == submit("Submit", class: "btn btn-primary btn-sm")
  == link_to("back", "/documents", class: "btn btn-light btn-sm")
