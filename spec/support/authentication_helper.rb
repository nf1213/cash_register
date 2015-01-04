module AuthenticationHelper
  def sign_in_as(employee)
    visit employees_sign_in_path
    select employee.name, from: "Name"
    fill_in "Password", with: employee.password

    click_on "Sign in"
  end
end
