defmodule Weither.Api do
  require Logger

  @doc """
  возвращает данные о погоде за переданный период из базы данных
  """
  def get(:history, date) do
    Weither.HttpRequest.request_history(date)
  end

  @doc """
  возвращает прогноз погоды на 'num'-ный день от сегодняшней даты
  """
  def get(:forecast, num) do
    Weither.HttpRequest.request_forecast(num)
  end

  @doc """
  запрашивает данные о погоде на стороннем сайте на момент запроса,
  полученные данные помещает в базу данных
  """
  def get(:current) do
    case Weither.HttpRequest.request_current() do
      {:ok, _x} -> :ok
      {:error, message} ->
        Logger.warn("Error in HttpRequest.request_current(): #{inspect(message)}")
    end
  end
end
