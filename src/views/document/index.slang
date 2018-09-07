.row
  .col-sm-11
    h2 Documents
  .col-sm-1
    a.btn.btn-success.btn-sm href="/documents/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Description
        th Actions
    tbody
      - documents.each do |document|
        tr
          td = document.name
          td = document.description
          td
            span
              == link_to("read", "/documents/#{document.id}", class: "btn btn-primary btn-sm")
              == link_to("edit", "/documents/#{document.id}/edit", class: "btn btn-success btn-sm")
              == link_to("delete", "/documents/#{ document.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
