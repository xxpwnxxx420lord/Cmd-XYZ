local PrintCmd = {}

function PrintCmd.run(args)
    if #args > 0 then
        print(table.concat(args, " "))
    else
        print("Usage: print <text>")
    end
end

return PrintCmd
