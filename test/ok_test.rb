require "test_helper"

class IsOKTest < Minitest::Test
  def test_that_it_has_a_version_number()
    refute_nil ::IsOK::VERSION
  end

  def test_error_is_an_is_error()
    assert IsOK.error("something went_wrong").is_a?(IsOK::IsError)
  end

  def test_ok_is_an_is_ok()
    assert IsOK.ok("everything will be alright").is_a?(IsOK::IsOK)
  end

  def test_response_stores_data_of_any_type()
    array = ["an", "array"]
    hash = {a: "hash"}
    str = "a string"

    assert IsOK::IsResponse.new(array).data == array
    assert IsOK::IsResponse.new(hash).data == hash
    assert IsOK::IsResponse.new(str).data == str
  end

  def test_is_ok_example()
    response = IsOK.ok("it works!")

    is_true =
      case response
      when IsOK::IsOK
        true
      when IsOK::IsError
        false
      end
    assert is_true
  end

  def test_is_error_example()
    response = IsOK.error("it works!")

    is_true =
      case response
      when IsOK::IsOK
        true
      when IsOK::IsError
        false
      end
    refute is_true
  end
end
