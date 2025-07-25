local ls = require("luasnip");
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep

ls.add_snippets("lua", {
    s("hello", {
        t('print("hello '),
        i(1),
        t(' world")')
    }),

    -- s("if", {
    --     t('if '),
    --     i(1, "true"),
    --     t(' then '),
    --     i(2),
    --     t(' end')
    -- })
})
