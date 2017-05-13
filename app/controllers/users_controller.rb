class UsersController < ApplicationController
  before_action :authorize_admin, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /signup
  def signup_new
    @user = User.new
  end

  # POST /signup
  def signup_create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to "/login", notice: "Usuario creado exitosamente."}
      else
        format.html { render :signup_new }
      end
    end
  end
  

  # GET /users 
  def index
    @users = User.all
  end

  # GET /users/1 
  def show        
  end

  def new 
    @user = User.new  
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Usuario creado exitosamente.' }        
      else
        format.html { render :new }        
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Usuario actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Usuario eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :role,
        :password,
        :password_confirmation
      )
    end
end
