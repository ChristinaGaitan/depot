require "test_helper"

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal [ "dave@example.org" ], mail.to
    assert_equal [ "depot@example.com" ], mail.from
    assert_match /1 x The Pragmatic Programmer/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "Pragmatic Store Order Shipped", mail.subject
    assert_equal [ "dave@example.org" ], mail.to
    assert_equal [ "depot@example.com" ], mail.from

    html_body = mail.html_part&.body&.decoded
    assert_includes html_body, "<td class=\"text-right\">\n    1</td>\n  <td>&times;</td>\n\n  <td class=\"pr-2\">\n    The Pragmatic Programmer\n  </td>"
  end
end
