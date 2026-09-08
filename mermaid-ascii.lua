--- SPDX-License-Identifier: Beerware
---
--- Render mermaid fenced code blocks as ASCII diagrams via mermaid-ascii(1).
---
--- Usage: pandoc -f gfm -t html --lua-filter=mermaid-ascii.lua
---    or: pandoc -d mermaid-ascii (with the bundled defaults file installed)

local function render (source)
    return pandoc.pipe("mermaid-ascii", { "-f", "-" }, source)
end

function CodeBlock (block)
    if not block.classes:includes("mermaid") then
        return nil
    end

    local ok, output = pcall(render, block.text)

    if not ok then
        io.stderr:write("mermaid-ascii failed, leaving block as-is\n")
        return nil
    end

    return pandoc.CodeBlock(output)
end
