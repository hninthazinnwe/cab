class Cab < ApplicationRecord
    # has_one_attached :image

    def getAll
        sql = <<-SQL
        SELECT
          *
        FROM
          get_all_cabs()
        SQL
        find_one_by_sql([sql, params])
    end
end
