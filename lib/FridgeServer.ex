defmodule OtpPlayground.FridgeServer do
	use GenServer

	def init(_) do
		{:ok, []}
	end

	def handle_call({:store, item}, _from, state) do
		{:reply, :ok, [item | state]}
	end

	def handle_call({:take, item}, _from, state) do
		case Enum.member?(state, item) do
			true ->
				{:reply, {:ok, item}, List.delete(state, item)}
			false ->
				{:reply, :not_found, state}
		end
	end
end