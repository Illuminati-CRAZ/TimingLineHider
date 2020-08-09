function draw()
    imgui.Begin("Timing Line Hider")

    state.IsWindowHovered = imgui.IsWindowHovered()

    if imgui.Button("click me") then
        local start = state.SongTime + 1
        local stop = state.CurrentTimingPoint.StartTime + map.GetTimingPointLength(state.CurrentTimingPoint)
        if stop - start > 10000 then
            stop = start + 10000
        end
        local bpm = state.CurrentTimingPoint.Bpm

        local timingpoints = {}

        for i = start, stop, 1 do
            table.insert(timingpoints, utils.CreateTimingPoint(i , bpm))
        end
        actions.PlaceTimingPointBatch(timingpoints)
        actions.ChangeTimingPointOffsetBatch(timingpoints, -.5) --less likely to interfere with things like beat snap color override
    end

    imgui.End()
end
