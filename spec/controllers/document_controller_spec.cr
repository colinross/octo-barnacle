require "./spec_helper"

def document_hash
  {"name" => "Fake", "description" => "Fake"}
end

def document_params
  params = [] of String
  params << "name=#{document_hash["name"]}"
  params << "description=#{document_hash["description"]}"
  params.join("&")
end

def create_document
  model = Document.new(document_hash)
  model.save
  model
end

class DocumentControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe DocumentControllerTest do
  subject = DocumentControllerTest.new

  it "renders document index template" do
    Document.clear
    response = subject.get "/documents"

    response.status_code.should eq(200)
    response.body.should contain("documents")
  end

  it "renders document show template" do
    Document.clear
    model = create_document
    location = "/documents/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Document")
  end

  it "renders document new template" do
    Document.clear
    location = "/documents/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Document")
  end

  it "renders document edit template" do
    Document.clear
    model = create_document
    location = "/documents/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Document")
  end

  it "creates a document" do
    Document.clear
    response = subject.post "/documents", body: document_params

    response.headers["Location"].should eq "/documents"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a document" do
    Document.clear
    model = create_document
    response = subject.patch "/documents/#{model.id}", body: document_params

    response.headers["Location"].should eq "/documents"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a document" do
    Document.clear
    model = create_document
    response = subject.delete "/documents/#{model.id}"

    response.headers["Location"].should eq "/documents"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
