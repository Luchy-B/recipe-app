require 'test_helper'

class MigratesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @migrate = migrates(:one)
  end

  test 'should get index' do
    get migrates_url
    assert_response :success
  end

  test 'should get new' do
    get new_migrate_url
    assert_response :success
  end

  test 'should create migrate' do
    assert_difference('Migrate.count') do
      post migrates_url,
           params: { migrate: { cooking_time: @migrate.cooking_time, description: @migrate.description, name: @migrate.name,
                                preparation_time: @migrate.preparation_time, public: @migrate.public, recipe_list: @migrate.recipe_list, string: @migrate.string } }
    end

    assert_redirected_to migrate_url(Migrate.last)
  end

  test 'should show migrate' do
    get migrate_url(@migrate)
    assert_response :success
  end

  test 'should get edit' do
    get edit_migrate_url(@migrate)
    assert_response :success
  end

  test 'should update migrate' do
    patch migrate_url(@migrate),
          params: { migrate: { cooking_time: @migrate.cooking_time, description: @migrate.description, name: @migrate.name,
                               preparation_time: @migrate.preparation_time, public: @migrate.public, recipe_list: @migrate.recipe_list, string: @migrate.string } }
    assert_redirected_to migrate_url(@migrate)
  end

  test 'should destroy migrate' do
    assert_difference('Migrate.count', -1) do
      delete migrate_url(@migrate)
    end

    assert_redirected_to migrates_url
  end
end
