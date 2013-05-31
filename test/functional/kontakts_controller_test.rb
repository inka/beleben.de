require 'test_helper'

class KontaktsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:kontakts)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_kontakt
    assert_difference('Kontakt.count') do
      post :create, :kontakt => { }
    end

    assert_redirected_to kontakt_path(assigns(:kontakt))
  end

  def test_should_show_kontakt
    get :show, :id => kontakts(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => kontakts(:one).id
    assert_response :success
  end

  def test_should_update_kontakt
    put :update, :id => kontakts(:one).id, :kontakt => { }
    assert_redirected_to kontakt_path(assigns(:kontakt))
  end

  def test_should_destroy_kontakt
    assert_difference('Kontakt.count', -1) do
      delete :destroy, :id => kontakts(:one).id
    end

    assert_redirected_to kontakts_path
  end
end
