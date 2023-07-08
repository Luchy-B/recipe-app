require 'application_system_test_case'

class MigratesTest < ApplicationSystemTestCase
  setup do
    @migrate = migrates(:one)
  end

  test 'visiting the index' do
    visit migrates_url
    assert_selector 'h1', text: 'Migrates'
  end

  test 'should create migrate' do
    visit migrates_url
    click_on 'New migrate'

    fill_in 'Cooking time', with: @migrate.cooking_time
    fill_in 'Description', with: @migrate.description
    fill_in 'Name', with: @migrate.name
    fill_in 'Preparation time', with: @migrate.preparation_time
    check 'Public' if @migrate.public
    fill_in 'Recipe list', with: @migrate.recipe_list
    fill_in 'String', with: @migrate.string
    click_on 'Create Migrate'

    assert_text 'Migrate was successfully created'
    click_on 'Back'
  end

  test 'should update Migrate' do
    visit migrate_url(@migrate)
    click_on 'Edit this migrate', match: :first

    fill_in 'Cooking time', with: @migrate.cooking_time
    fill_in 'Description', with: @migrate.description
    fill_in 'Name', with: @migrate.name
    fill_in 'Preparation time', with: @migrate.preparation_time
    check 'Public' if @migrate.public
    fill_in 'Recipe list', with: @migrate.recipe_list
    fill_in 'String', with: @migrate.string
    click_on 'Update Migrate'

    assert_text 'Migrate was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Migrate' do
    visit migrate_url(@migrate)
    click_on 'Destroy this migrate', match: :first

    assert_text 'Migrate was successfully destroyed'
  end
end
