-- cpp Compile and Run
local function CompileAndRun()
    -- 保存当前缓冲区
    vim.api.nvim_command "w"

    -- 获取当前文件路径
    local current_buffer = vim.api.nvim_get_current_buf()
    local filepath = vim.api.nvim_buf_get_name(current_buffer)

    -- 获取文件目录
    local dir = vim.fn.fnamemodify(filepath, ":h")

    -- 保存原始工作目录并切换到文件目录
    local original_cwd = vim.fn.getcwd()
    vim.fn.chdir(dir)

    -- 保存并设置 makeprg 编译 C++ 文件
    local makeprg_save = vim.o.makeprg
    vim.o.makeprg = "g++ -Wall % -o %:t:r"

    -- 运行编译命令
    vim.api.nvim_command "make"

    -- 检查编译是否成功
    if vim.v.shell_error == 0 then
        -- 打开底部终端窗口
        -- vim.api.nvim_command("botright terminal")
        require("nvchad.term").new { pos = "sp" }

        -- 获取终端缓冲区编号
        local termbuf = vim.api.nvim_get_current_buf()

        -- 获取可执行文件名，去掉扩展名
        local executable_name = vim.fn.fnamemodify(filepath, ":t:r")

        -- 处理文件名中可能包含空格
        local function quote_if_needed(str)
            if str:find "%s" then
                return '"' .. str:gsub('"', '\\"') .. '"'
            else
                return str
            end
        end
        local executable_quoted = quote_if_needed(executable_name)

        -- 发送运行命令到终端
        local cmd = "./" .. executable_quoted .. "\r"
        vim.api.nvim_buf_call(termbuf, function()
            vim.api.nvim_input(cmd)
        end)
    end

    -- 恢复原始 makeprg 和工作目录
    vim.o.makeprg = makeprg_save
    vim.fn.chdir(original_cwd)
end

-- 映射快捷键 <leader>r 调用 CompileAndRun
vim.keymap.set("n", "<leader>t", CompileAndRun, { desc = "compile and run current c++ file" })

-- 定义编译并运行函数
local function CompileAndRunCMake()
    -- 保存当前文件
    vim.api.nvim_command "w"

    -- 获取当前文件所在目录
    local filepath = vim.api.nvim_buf_get_name(0)
    local dir = vim.fn.fnamemodify(filepath, ":h")

    -- 保存当前工作目录并切换到项目目录
    local original_cwd = vim.fn.getcwd()
    vim.fn.chdir(dir)

    -- 打开终端窗口（使用 Neovim 内置终端）
    require("nvchad.term").new { pos = "sp" }

    -- 获取终端缓冲区
    local termbuf = vim.api.nvim_get_current_buf()

    -- 定义编译和运行命令
    local cmd = "cd .. && cmake . && make && ./hello\r"

    -- 发送命令到终端
    vim.api.nvim_buf_call(termbuf, function()
        vim.api.nvim_input(cmd)
    end)

    -- 恢复原始工作目录
    vim.fn.chdir(original_cwd)
end

-- 绑定快捷键
vim.keymap.set("n", "<leader>r", CompileAndRunCMake, { desc = "Compile and run CMake project" })
