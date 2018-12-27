class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to({controller:"users",action:'login'}, notice: '注册成功,请登录') }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      
      if @user.update(user_params)
        format.html { render :edit, notice: '成功修改信息' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit,notice: '修改信息失败' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def 
  
  def login
    
  end
  
  def clogin
    if params[:name] and params[:key_word]
      user=User.find_by(name:params[:name])
      if user and user.password==params[:key_word]
        session[:user]=user.name
        session[:userid]=user.id
        redirect_to({controller:'phones',action:'index'})
      else
        redirect_to({controller:'users',action:'login'},notice:'用户名或者密码不正确')
      end
    else
        redirect_to({controller:'users',action:'login'},notice:'用户名或者密码不正确')
    end
  end
  
  def logout
    session[:user]=nil
    session[:userid]=nil
    session[:cart_id]=nil
    redirect_to({controller:'users',action:'login'})
  end
  
  def info
    
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password, :intro, :email, :phone,:avatar)
    end
end
