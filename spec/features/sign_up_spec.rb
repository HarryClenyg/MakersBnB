feature "Can sign up" do
    scenario "can sign up" do
        visit("/")
        fill_in("email", with: "maker@maker.com")
        fill_in("password", with: "12345@" )
        click_button("sign up")
        expect(current_path).to eq "/spaces"
        expect(page).to have_content "sign out"

    end

    # scenario "incorrect sign up fails" do
    #     visit("/")
    #     fill_in("email", with: "maker@maker.com")
    #     click_button("sign up")
    #     # expect(current_path).to eq '/'
    #     expect(page).to have_content "Please fill in this field."
    # end

    scenario "no duplicated users" do
        User.create(email: "maker@maker.com", password:"12345@") 
        visit("/")
        fill_in("email", with: "maker@maker.com")
        fill_in("password", with: "12345@" )
        click_button("sign up")
        expect(current_path).to eq '/login'
        # expect(page).to have_content "Invalid user details"
    end

end