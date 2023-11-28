class QuestionsController < ApplicationController
    def index
      
    end

    def create
        @answer = "I don't know."
    end

		def generate_openai_text
			openai_service =OpenaiService.new(OpenAI.configuration.api_type)
			prompt = params[:prompt]
			api_key = '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' 
			openai_service = OpenaiService.new(api_key) 
			response = openai_service.generate_text(prompt)
			render turbo_stream: turbo_stream.replace('openai-output', partial: 'questions/openai_partial', locals: { text: response })
		end

    private
  
    def question
      params.require(:question).permit(:text)
    end
end
