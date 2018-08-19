defmodule FawkesWeb.TestView do
  use FawkesWeb, :view
end

defmodule FawkesWeb.GlobalViewHelpersTest do
  use FawkesWeb.ConnCase, async: true
  alias FawkesWeb.TestView

  test "formats time spans" do
    assert TestView.display_time(%{start: ~N[2018-09-06 15:45:00.000000],
                          finish: ~N[2018-09-06 16:00:00.000000]}) ==
           " 3:45 pm -  4:00 pm"
  end

  test "formats time" do
    assert TestView.display_time(~N[2018-09-06 15:45:00.000000]) == " 3:45 pm"
  end
end
