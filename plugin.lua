function draw()
    imgui.Begin("Timing Line Hider")

    state.IsWindowHovered = imgui.IsWindowHovered()

    --local debug = state.GetValue("debug") or "hi"

    if imgui.Button("click me") then
        --math.floor may cause weird things to happen I'm not thinking very hard about this
        --this is to fix timing lines sometimes not being hidden
        --basically to check if this causes anything weird I just look at the beat snap colors of notes coming after the spam
        local start = math.floor(state.CurrentTimingPoint.StartTime) + .5
        local stop = state.CurrentTimingPoint.StartTime + map.GetTimingPointLength(state.CurrentTimingPoint) + 1
        if stop - start > 10000 then
            stop = start + 10000
        end
        local bpm = state.CurrentTimingPoint.Bpm

        local timingpoints = {}

        while stop - start > 1 do
            table.insert(timingpoints, utils.CreateTimingPoint(start, bpm))
            start = start + 1
        end
        actions.PlaceTimingPointBatch(timingpoints)
    end

    --imgui.TextWrapped(debug)

    --state.SetValue("debug", debug)

    imgui.End()
end
