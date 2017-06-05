defmodule OtpPlayground.FridgeServer do
	use GenServer

	def init(_) do
		{:ok, []}
	end

	def handle_call({:store, item}, _from, state) do
		{:reply, :ok, [item | state]}
	end
end