module CommonScopes
  extend ActiveSupport::Concern

  module ClassMethods
    #
    # query with limit
    # simplier alternative for load more features
    #
    def by_limit page, limit
      page = 1 if !page.present?
      limit(limit).offset(limit*(page.to_i-1))
    end

  end

end
