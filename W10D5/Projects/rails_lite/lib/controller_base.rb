require 'active_support'
require 'active_support/core_ext'
require 'active_support/inflector'
require 'erb'
require_relative './session'
require 'byebug'

class ControllerBase
  attr_reader :req, :res, :params
  attr_accessor :already_built_response

  # Setup the controller
  def initialize(req, res)
    @res = res
    @req = req
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response ||= false
  end

  # Set the response status code and header
  def redirect_to(url)
    if !@already_built_response
      @res.header['location'] = url
      @res.status = 302
    else
      raise "double render error"
    end
    @already_built_response = true
    @session.store_session(@res)
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    if !@already_built_response
      @res.status = 200
      @res['Content-Type'] = content_type
      @res.body = [content]
      @res.finish
    else
      raise "double render error"
    end
    @already_built_response = true
    @session.store_session(@res)
  end
  
  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    controller_name = self.class.to_s.underscore
    content = File.read("views/#{controller_name}/#{template_name}.html.erb")
    # file_date = File.read("views/#{controller_name}/#{template_name}.html.erb")
    content = ERB.new(content).result(binding)
    render_content(content, "text/html")
  end

  # method exposing a `Session` object
  def session
    @session ||= Session.new(@req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
  end
end

