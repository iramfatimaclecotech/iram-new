class OpenaiService
  attr_accessor :client

  def initialize(api_key)
		api_key = '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'
			@api_key = api_key
			@client = OpenAI::Client.new(access_token: "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")
			#@client = OpenAI::Client.new(access_token: @api_key)
	end

	def generate_text(prompt, retries = 3)
		response = nil
		begin
			response = @client.chat(
				parameters: {
					model: "gpt-3.5-turbo",
					messages: [{ role: "user", content: prompt }],
					temperature: 0.7,
				}
			)
			puts response.dig("choices", 0, "message", "content")
		rescue Faraday::TooManyRequestsError => e
			Rails.logger.warn("Rate limited by OpenAI. Retrying after waiting.")
			if retries > 0
				sleep(2**retries)
				generate_text(prompt, retries - 1)
			else
				Rails.logger.error("Max retries reached. Unable to generate text.")
			end
		end
		response
	end
end