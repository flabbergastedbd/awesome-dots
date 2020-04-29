# Follow all proceses
set detach-on-fork on

# Cache
set index-cache on
set print asm-demangle on

# Safe load helper gdb scriupts
add-auto-load-safe-path /home/tunnelshade/workspace/

# Load GEF
source ~/.config/gef.py

# Tested in 3.10 kernel and used there so far
#
# Allows you to specify a module name and file path to load symbols at address
# obtained by parsing kernel modules double linked list.
define insert-kbin
        set $current = modules.next
        set $offset =  ((int)&((struct module *)0).list)

	while($current.next != modules.next)
		set $name = ((struct module *) (((void *) ($current)) - $offset ))->name
		if($_streq($name, "$arg0"))
                        set $addr = ((struct module *) (((void *) ($current)) - $offset ))->module_core
			add-symbol-file $arg1 $addr
		end
                set $current = $current.next
        end
end

document insert-kbin
insert-kbin <module_name> <file_path>
end
