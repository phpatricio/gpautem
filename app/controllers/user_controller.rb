class UserController < ApplicationController
    load_and_authorize_resource
      before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    # GET /users
    # GET /users.json
    def index
      @users = User.all.paginate(page: params[:page], per_page: 5)
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @users }
      end
    end
  
  
    # GET /users/1
    # GET /users/1.json
    def show
      #authorize! :view, @user
      #@user = User.find(params[:id])
  
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @user }
      end
    end
  
    # GET /users/new
    # GET /users/new.json
    def new
  
      @user = User.new
  
      respond_to do |format|
        format.html # new.html.erb
        format.json { render :json => @user }
      end
    end
  
    # GET /users/1/edit
    def edit
      authorize! :edit, @user
      @user = User.find(set_user)
    end
  
  
  
  
    # POST /users
    # POST /users.json
    def create
      @user = User.new(user_params)
  
      respond_to do |format|
        if @user.save
          format.html { redirect_to @user, :notice => 'User was successfully created.' }
          format.json { render :json => @user, :status => :created, :location => @user }
        else
          format.html { render :action => "new" }
          format.json { render :json => @user.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # PUT /users/1
    # PUT /users/1.json
    def update
      @user = User.find(set_user)
  
      respond_to do |format|
        if @user.update_attributes(user_params)
          format.html { redirect_to @user, :notice => 'Usuario editado con exito.' }
          format.json { head :ok }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @user.errors, :status => :unprocessable_entity }
        end
      end
    end
  
    # DELETE /users/1
    # DELETE /users/1.json
    def destroy
      authorize! :delete, @user
      @user = User.find(set_user)
      @user.destroy
  
      respond_to do |format|
        format.html { redirect_to user_index_path, :notice => 'Usuario eliminado con exito' }
        format.json { head :ok }
      end
    end
  
  
  
  
  
    private
      def set_user
        @user = User.find(params[:id])
      end
  
      def user_params
        params.require(:user).permit(:email)
      end
  end
  
  