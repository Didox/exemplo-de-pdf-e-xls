class FuncionariosController < ApplicationController
  before_action :set_funcionario, only: [:show, :edit, :update, :destroy, :copiar_funcionario]

  # GET /funcionarios
  # GET /funcionarios.json
  def index
    @funcionarios = Funcionario.all

    if params[:nome].present?
      @funcionarios = @funcionarios.where("lower(nome) ilike '%#{params[:nome].downcase}%'")
    end

    if params[:selecionado].present?
      @selecionado = params[:selecionado].split(",")
      @funcionarios = @funcionarios.where(id: @selecionado)
    else
      @selecionado = []
    end

    if params[:gerar_pdf].present?
      render pdf: "Invoice No",
        orientation:'Landscape',
        page_size: 'A4',
        template: "funcionarios/index.pdf.erb",
        layout: "pdf.html",
        lowquality: true,
        zoom: 1,
        dpi: 75
      return
    end
    
    if params[:gerar_pdf_individual].present?
      @funcionario = Funcionario.find(params[:gerar_pdf_individual])
      render pdf: "Invoice No",
        page_size: 'A4',
        template: "funcionarios/show.pdf.erb",
        layout: "pdf.html",
        lowquality: true,
        zoom: 1,
        dpi: 75
      return
    end
  
    if params[:gerar_xlsx].present?
      filename = "funcionarios-#{Time.now.strftime("%Y%m%d%H%M%S")}.xlsx"
      workbook = WriteXLSX.new("/tmp/#{filename}")
      worksheet = workbook.add_worksheet

      format = workbook.add_format
      format.set_bold

      worksheet.write(0, 0, "Total", format)
      worksheet.write(0, 1, "Funcionário", format)
      worksheet.write(0, 2, "Número CNH", format)
      worksheet.write(0, 3, "Nascimento", format)
      worksheet.write(0, 4, "CPF", format)
      worksheet.write(0, 5, "RG", format)
      worksheet.write(0, 6, "Telefone", format)
      worksheet.write(0, 7, "Admissão", format)
      worksheet.write(0, 8, "Validade CNH", format)
      worksheet.write(0, 9, "Validade ASO", format)
      worksheet.write(0, 11, "Saída", format)
      worksheet.write(0, 12, "Setor", format)


      i = 1
      @funcionarios.each do |funcionario|
        worksheet.write(i, 0, i )
        worksheet.write(i, 1, funcionario.nome)
        worksheet.write(i, 3, (funcionario.nascimento.to_date.strftime("%d/%m/%Y") rescue "") )
        worksheet.write(i, 4, funcionario.cpf )
        worksheet.write(i, 5, funcionario.rg)
        worksheet.write(i, 6, funcionario.telefone)
        worksheet.write(i, 7, (funcionario.admissao.to_date.strftime("%d/%m/%Y") rescue "") )
        worksheet.write(i, 8, (funcionario.vencimento_cnh.to_date.strftime("%d/%m/%Y") rescue "") )
        worksheet.write(i, 9, (funcionario.vencimento_do_aso.to_date.strftime("%d/%m/%Y") rescue "") )
        i += 1
      end
      workbook.close

      send_data File.read("/tmp/#{filename}"), type: "application/xlsx", filename: filename

      return    

    end
  end
  # GET /funcionarios/1
  # GET /funcionarios/1.json
  def show
    if params[:gerar_pdf].present?
      @funcionario = Funcionario.find(params["id"])
      render pdf: "Invoice No",
        page_size: 'A4',
        template: "funcionarios/show.pdf.erb",
        layout: "pdf.html",
        lowquality: true,
        zoom: 1,
        dpi: 75
      return
    end
  end

  # GET /funcionarios/new
  def new
    @funcionario = Funcionario.new
  end

  # GET /funcionarios/1/edit
  def edit
  end

  def copiar_todos_funcionarios
    @empresa = Empresa.find(params[:empresa_host])
    funcionarios = @empresa.funcionarios

    funcionarios.each do |value|
      n_val = value.dup
      n_val.save
    end
  end

  def copiar_funcionario
    novo_funcionario = @funcionario.dup
    novo_funcionario.save
  end

  # POST /funcionarios
  # POST /funcionarios.json
  def create
    @funcionario = Funcionario.new(funcionario_params)

    respond_to do |format|
      if @funcionario.save
        format.html { redirect_to @funcionario, notice: 'Funcionario foi cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @funcionario }
      else
        format.html { render :new }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funcionarios/1
  # PATCH/PUT /funcionarios/1.json
  def update
    respond_to do |format|
      if @funcionario.update(funcionario_params)
        format.html { redirect_to @funcionario, notice: 'Funcionario foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @funcionario }
      else
        format.html { render :edit }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcionarios/1
  # DELETE /funcionarios/1.json
  def destroy
    @funcionario.destroy
    respond_to do |format|
      format.html { redirect_to funcionarios_url, notice: 'Funcionario foi apagado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_funcionario
      @funcionario = Funcionario.find(params[:id])
    end

    def check_empresa
      unless @funcionario.empresa_id == params[:empresa_id]
        redirect_to '/funcionarios'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funcionario_params
      params.require(:funcionario).permit(:nome, :telefone, :email, :nascimento, :admissao, :rg, :cpf, :endereco, :funcao, :data_do_aso, :vencimento_do_aso, :vencimento_da_integracao, :vencimento_cnh, :setor, :arquivo)
    end
end
