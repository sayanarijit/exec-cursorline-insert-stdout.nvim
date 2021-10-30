Execute the line under cursor and insert the stdout below.

[![exec-cursorline-insert-stdout.gif](https://s5.gifyu.com/images/exec-cursorline-insert-stdout.gif)](https://gifyu.com/image/eUGt)

[![exec-cursorline-insert-stdout2.gif](https://s10.gifyu.com/images/exec-cursorline-insert-stdout2.gif)](https://gifyu.com/image/eVT0)

# Plug

```vim
Plug 'sayanarijit/exec-cursorline-insert-stdout.nvim'
```

# Usage

### Execute the line under cursor

```lua
require"exec-cursorline-insert-stdout".execute()
```

### Process the stdout before insert

```lua
require"exec-cursorline-insert-stdout".execute{
    process_stdout = function(stdout)
        return "---\n" .. stdout .. "---\n"
    end
}
```

### Prepare for the next command after executing one

```lua
require"exec-cursorline-insert-stdout".execute{
    prepare_for_next_command = true
}
```


# Recommended config

```vim
command ExecuteLine :lua require"exec-cursorline-insert-stdout".execute{prepare_for_next_command = true}

nnoremap <silent> X :ExecuteLine<CR>
```
