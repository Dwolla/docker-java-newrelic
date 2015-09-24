require "serverspec"
require "docker"
require "multi_json"

DOCKER_IMAGE_TAG = 'jenkins-linux.dwolla.net/dwolla/java:8'

describe "docker.dwolla.com/dwolla/java:8" do
  it "is maintained by Dwolla Dev" do
    expect(image_inspection['Author']).to eq 'Dwolla Engineering <dev+docker@dwolla.com>'
  end

  it "includes the newrelic jar" do
    expect(md5("/opt/newrelic/newrelic.jar")).to contain('d2671324f245917a76e60ef8f8adcac9')
  end

  def md5(filename)
    command("md5sum #{filename} | cut -f1 -d ' '").stdout
  end

  before(:all) do
    image = Docker::Image.build_from_dir('.', {
      't' => DOCKER_IMAGE_TAG
    })

    set :os, family: :debian
    set :backend, :docker
    set :docker_image, image.id

    @image = image
  end

  def image_inspection
    ::MultiJson.load(`docker inspect #{@image.id}`)[0]
  end
end

