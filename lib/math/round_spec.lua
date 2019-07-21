local round = require "lib.math.round"

return function()
    describe("toNearest()", function()
        test("rounds up", function()
            assert_equal(round.toNearest(65, 128), 128)
            assert_equal(round.toNearest(127, 128), 128)
            assert_equal(round.toNearest(128, 128), 128)
        end)

        test("rounds down", function()
            assert_equal(round.toNearest(129, 128), 128)
            assert_equal(round.toNearest(191, 128), 128)
        end)
    end)
end