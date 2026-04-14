
#縦並び
ggplot(data, aes(x = A)) + geom_histogram(fill = “white”, colour = “black”) +
facet_grid(race ~., scales = “free”) +
theme(strip.text = element_text(face = “bold”, size = rel(1.5)), +
strip.background = element_rect(fill = “lightblue”, colour = “black”, size = 1)

# other version (横並びと自由に並べる)
face_grid(.~race)
facet_wrap(~class, nrow = 2) # or ncol = 4
