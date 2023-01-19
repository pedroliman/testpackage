

attachment::att_amend_desc()

devtools::document()
devtools::load_all()
#devtools::build_manual()

a <- my_class("abc")

# Wrappers work
summary(a)
simulate(a)
hello_world(a)

# And internal methods also work
a$hello_world()
a$summary()
a$simulate()
