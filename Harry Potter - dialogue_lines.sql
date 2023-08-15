SELECT COUNT(dialogue_id) AS dialogue_lines,movie_title FROM dialogues
INNER JOIN chapters ON dialogues.chapter_id = chapters.chapter_id
INNER JOIN movies   ON movies.movie_id = chapters.movie_id
GROUP BY movie_title
ORDER BY COUNT(dialogue_id) DESC;