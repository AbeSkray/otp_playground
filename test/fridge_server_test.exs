defmodule OtpPlayground.FridgeServerTest do
  use ExUnit.Case
  alias OtpPlayground.FridgeServer

  test "putting something into the fridge" do
    { :ok, fridge } = FridgeServer.start_link
    assert :ok == GenServer.call(fridge, {:store, :bacon})
  end

  test "removing something from the fridge" do
    { :ok, fridge } = FridgeServer.start_link
    GenServer.call(fridge, {:store, :bacon})
    assert {:ok, :bacon} == GenServer.call(fridge, {:take, :bacon})
  end

  test "taking something from the fridge that isn't in there" do
    { :ok, fridge } = FridgeServer.start_link
    assert :not_found == GenServer.call(fridge, {:take, :bacon})
  end
end
