require 'wunderlist/helper'

module Wunderlist
  class List

    include Wunderlist::Helper

    attr_accessor :id, :title, :api, :created_at, :revision

    def initialize(attrs = {})
      @api = attrs['api']
      @id = attrs['id']
      @title = attrs['title']
      @created_at = attrs['created_at']
      @revision = attrs['revision']
    end

    def new_task(attrs = {})
      self.api.new_task(self.title, attrs)
    end

    def tasks(completed: false)
      self.api.tasks([self.title], completed)
    end

    def members(status=["accepted"])
      self.api.members(self.id, status)
    end

    def new_member(attrs)
      attrs["list_id"] = self.id
      self.api.new_membership(attrs)
    end

    def webhooks
      self.api.webhooks(self.title)
    end
    private

    def set_attrs(attrs = {})
      self.id = attrs['id']
      self.title= attrs['title']
      self.created_at = attrs['created_at']
      self.revision = attrs['revision']
    end

  end
end
