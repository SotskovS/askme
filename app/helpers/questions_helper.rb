module QuestionsHelper
	def author_questions(question)
		if question.author.present?
			link_to(question.author&.username, user_path(question.author))
		else
			"Неизвестный автор"
		end
	end
end
