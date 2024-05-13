defmodule RestApi.JSONUtils do

  defimpl Jason.Encoder, for: BSON.ObjectId do
    def encode(id, options) do
      BSON.ObjectId.encode!(id)
      |> Jason.Encoder.encode(options)
    end
  end

  def normaliseMongoId(doc) do
    doc
    |> Map.put("id", doc["_id"])
    |> Map.delete("_id")
  end
end
