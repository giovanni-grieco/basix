local glib = {}

glib.global_counter = 0

function glib.increase_counter()
    glib.global_counter = glib.global_counter + 1
    return glib.global_counter
end

function glib.get_global_counter()
    return glib.global_counter
end

function glib.set_global_counter(value)
    glib.global_counter = value
end

function glib.reset_global_counter()
    glib.global_counter = 0
end

return glib