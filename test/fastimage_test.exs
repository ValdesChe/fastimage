defmodule FastimageTest do
  use ExUnit.Case, async: true
  doctest Fastimage

  @expected_size %Fastimage.Dimensions{width: 283, height: 142}
  @webp_vp8_expected_size %Fastimage.Dimensions{width: 550, height: 368}
  @webp_vp8x_expected_size %Fastimage.Dimensions{width: 386, height: 395}
  @webp_vp8l_expected_size %Fastimage.Dimensions{width: 386, height: 395}

  @fastimage_task_timeout 3_000

  @jpg_url "https://raw.githubusercontent.com/stephenmoloney/fastimage/master/priv/test.jpg"
  @jpg_url_with_query "https://avatars0.githubusercontent.com/u/12668653?v=2&s=40"
  @jpg_with_redirect "http://seanmoloney.com/images/cover1.jpg"
  @png_url "https://raw.githubusercontent.com/stephenmoloney/fastimage/master/priv/test.png"
  @gif_url "https://raw.githubusercontent.com/stephenmoloney/fastimage/master/priv/test.gif"
  @bmp_url "https://raw.githubusercontent.com/stephenmoloney/fastimage/master/priv/test.bmp"
  @webp_vp8l_url "https://raw.githubusercontent.com/sdsykes/fastimage/master/test/fixtures/webp_vp8l.webp"
  @webp_vp8_url "https://raw.githubusercontent.com/sdsykes/fastimage/master/test/fixtures/webp_vp8.webp"
  @webp_vp8x_url "https://raw.githubusercontent.com/sdsykes/fastimage/master/test/fixtures/webp_vp8x.webp"

  @jpg_file "./priv/test.jpg"
  @png_file "./priv/test.png"
  @gif_file "./priv/test.gif"
  @bmp_file "./priv/test.bmp"
  @webp_vp8_file "./priv/test_vp8.webp"
  @webp_vp8x_file "./priv/test_vp8x.webp"
  @webp_vp8l_file "./priv/test_vp8l.webp"

  @jpg_binary File.read!(@jpg_file)
  @png_binary File.read!(@png_file)
  @gif_binary File.read!(@gif_file)
  @bmp_binary File.read!(@bmp_file)
  @webp_vp8_binary File.read!(@webp_vp8_file)
  @webp_vp8x_binary File.read!(@webp_vp8x_file)
  @webp_vp8l_binary File.read!(@webp_vp8l_file)

  @tag :jpeg
  test "Get type and size of remote jpeg url" do
    actual_type = Fastimage.type(@jpg_url)
    actual_size = Fastimage.size(@jpg_url)

    expected_type = {:ok, :jpeg}
    expected_size = {:ok, @expected_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of remote image with query in url" do
    actual_type = Fastimage.type(@jpg_url_with_query)
    expected_type = {:ok, :jpeg}

    actual_size = Fastimage.size(@jpg_url_with_query)
    expected_size = {:ok, %Fastimage.Dimensions{width: 40, height: 40}}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of local jpeg file" do
    actual_type = Fastimage.type(@jpg_file)
    actual_size = Fastimage.size(@jpg_file)

    expected_type = {:ok, :jpeg}
    expected_size = {:ok, @expected_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of a binary jpeg object" do
    actual_type = Fastimage.type(@jpg_binary)
    actual_size = Fastimage.size(@jpg_binary)

    expected_type = {:ok, :jpeg}
    expected_size = {:ok, @expected_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of remote png url" do
    actual_type = Fastimage.type(@png_url)
    actual_size = Fastimage.size(@png_url)

    expected_type = {:ok, :png}
    expected_size = {:ok, @expected_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of local png file" do
    actual_type = Fastimage.type(@png_file)
    actual_size = Fastimage.size(@png_file)

    expected_type = {:ok, :png}
    expected_size = {:ok, @expected_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of binary png object" do
    actual_type = Fastimage.type(@png_binary)
    actual_size = Fastimage.size(@png_binary)

    expected_type = {:ok, :png}
    expected_size = {:ok, @expected_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of remote gif url" do
    actual_type = Fastimage.type(@gif_url)
    actual_size = Fastimage.size(@gif_url)

    expected_type = {:ok, :gif}
    expected_size = {:ok, @expected_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of local gif file" do
    actual_type = Fastimage.type(@gif_file)
    actual_size = Fastimage.size(@gif_file)

    expected_type = {:ok, :gif}
    expected_size = {:ok, @expected_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of a binary gif object" do
    actual_type = Fastimage.type(@gif_binary)
    actual_size = Fastimage.size(@gif_binary)

    expected_type = {:ok, :gif}
    expected_size = {:ok, @expected_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of remote bmp url" do
    actual_type = Fastimage.type(@bmp_url)
    actual_size = Fastimage.size(@bmp_url)

    expected_type = {:ok, :bmp}
    expected_size = {:ok, @expected_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of local bmp file" do
    actual_type = Fastimage.type(@bmp_file)
    actual_size = Fastimage.size(@bmp_file)

    expected_type = {:ok, :bmp}
    expected_size = {:ok, @expected_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of a binary bmp object" do
    actual_type = Fastimage.type(@bmp_binary)
    actual_size = Fastimage.size(@bmp_binary)

    expected_type = {:ok, :bmp}
    expected_size = {:ok, @expected_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of remote webp vp8 url" do
    actual_type = Fastimage.type(@webp_vp8_url)
    actual_size = Fastimage.size(@webp_vp8_url)

    expected_type = {:ok, :webp}
    expected_size = {:ok, @webp_vp8_expected_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of local webp vp8 file" do
    actual_type = Fastimage.type(@webp_vp8_file)
    actual_size = Fastimage.size(@webp_vp8_file)

    expected_type = {:ok, :webp}
    expected_size = {:ok, @webp_vp8_expected_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of a binary webp vp8 object" do
    actual_type = Fastimage.type(@webp_vp8_binary)
    actual_size = Fastimage.size(@webp_vp8_binary)

    expected_type = {:ok, :webp}
    expected_size = {:ok, @webp_vp8_expected_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of remote webp vp8l url" do
    actual_type = Fastimage.type(@webp_vp8l_url)
    actual_size = Fastimage.size(@webp_vp8l_url)

    expected_type = {:ok, :webp}
    expected_size = {:ok, @webp_vp8l_expected_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of local webp vp8l file" do
    actual_type = Fastimage.type(@webp_vp8l_file)
    actual_size = Fastimage.size(@webp_vp8l_file)

    expected_type = {:ok, :webp}
    expected_size = {:ok, @webp_vp8l_expected_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of a binary webp vp8l object" do
    actual_type = Fastimage.type(@webp_vp8l_binary)
    actual_size = Fastimage.size(@webp_vp8l_binary)

    expected_type = {:ok, :webp}
    expected_size = {:ok, @webp_vp8l_expected_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of remote webp vp8x url" do
    actual_type = Fastimage.type(@webp_vp8x_url)
    actual_size = Fastimage.size(@webp_vp8x_url)

    expected_type = {:ok, :webp}
    expected_size = {:ok, @webp_vp8x_expected_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of local webp vp8x file" do
    actual_type = Fastimage.type(@webp_vp8x_file)
    actual_size = Fastimage.size(@webp_vp8x_file)

    expected_type = {:ok, :webp}
    expected_size = {:ok, @webp_vp8x_expected_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get type and size of a binary webp vp8x object" do
    actual_type = Fastimage.type(@webp_vp8x_binary)
    actual_size = Fastimage.size(@webp_vp8x_binary)

    expected_type = {:ok, :webp}
    expected_size = {:ok, @webp_vp8x_expected_size}

    assert(actual_type == expected_type)
    assert(actual_size == expected_size)
  end

  test "Get the size of multiple image files synchronously" do
    n = :rand.uniform(20)

    list_results =
      list(n)
      |> Enum.map(fn image -> {:ok, Kernel.elem(Fastimage.size(image), 1)} end)

    assert list_results == list_expected_results(n)
  end

  test "Get the size of multiple image files asynchronously" do
    n = :rand.uniform(20)

    list_results =
      list(n)
      |> Enum.map(&Task.async(Fastimage, :size, [&1]))
      |> Enum.map(&handle_task/1)

    assert list_results == list_expected_results(n)
  end

  test "Get the size of an image behind a redirect" do
    actual_size = Fastimage.size(@jpg_with_redirect)
    expected_size = {:ok, %Fastimage.Dimensions{width: 1200, height: 1230}}

    assert(actual_size == expected_size)
  end

  # private

  defp list(n) do
    Stream.cycle([
      @jpg_url,
      @jpg_url_with_query,
      @jpg_with_redirect,
      @png_url,
      @gif_url,
      @bmp_url,
      @webp_vp8_url,
      @webp_vp8x_url,
      @webp_vp8l_url
    ])
    |> Enum.take(n)
  end

  defp list_expected_results(n) do
    Stream.cycle([
      %Fastimage.Dimensions{width: 283, height: 142},
      %Fastimage.Dimensions{width: 40, height: 40},
      %Fastimage.Dimensions{width: 1200, height: 1230},
      %Fastimage.Dimensions{width: 283, height: 142},
      %Fastimage.Dimensions{width: 283, height: 142},
      %Fastimage.Dimensions{width: 283, height: 142},
      %Fastimage.Dimensions{width: 550, height: 368},
      %Fastimage.Dimensions{width: 386, height: 395},
      %Fastimage.Dimensions{width: 386, height: 395}
    ])
    |> Stream.flat_map(&[{:ok, &1}])
    |> Enum.take(n)
  end

  defp handle_task(task) do
    with {:ok, {:error, error}} <-
           Task.yield(task, @fastimage_task_timeout) || Task.shutdown(task) do
      {:error, error}
    else
      {:ok, val} ->
        val

      other ->
        other
    end
  end
end
