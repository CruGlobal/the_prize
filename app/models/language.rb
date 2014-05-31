class Language < ActiveRecord::Base
	before_save :set_locale
	validates_presence_of :name, :code
	
	def set_locale
		self.locale ||= "#{self.code}-#{self.country}"
	end

	def country=(c)
		super(c.upcase)
	end

end
