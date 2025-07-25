local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

-- Function to generate the include guard name based on the filename
local function generate_guard_name()
    local filename = vim.fn.expand("%:t")  -- Get the current filename
    filename = filename:upper()             -- Convert to uppercase
    filename = filename:gsub("%.", "_")     -- Replace dots with underscores
    return filename
end

return {
    s({
        trig = "incguard",
        dscr = "Insert C/C++ include guards"
    },
        fmt([[
        {tNode1} {tNode2}
        {tNode3} {tNode2}

        {iNode1}

        {tNode4}{tNode2}
    ]],
            {
                tNode1 = t("#ifndef"),
                tNode2 = t(generate_guard_name()),
                tNode3 = t("#define"),
                iNode1 = i(0),
                tNode4 = t("#endif //")
            }))
}
