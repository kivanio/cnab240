require 'spec_helper'

RSpec.describe Cnab240::Lote::V40::Boletos::Trailer do
  it 'deve conter campos trailer' do
    trailer = Cnab240::Lote::V40::Boletos::Trailer.new

    expect(trailer).to respond_to(:controle_banco)
    expect(trailer).to respond_to(:controle_lote)
    expect(trailer).to respond_to(:controle_registro)

    expect(trailer).to respond_to(:cnab_g004_1)

    expect(trailer).to respond_to(:totais_qtde_registros)
    expect(trailer).to respond_to(:qtde_cobranca_simples)
    expect(trailer).to respond_to(:total_cobranca_simples)
    expect(trailer).to respond_to(:qtde_cobranca_vinculada)
    expect(trailer).to respond_to(:total_cobranca_vinculada)
    expect(trailer).to respond_to(:qtde_cobranca_caucionada)
    expect(trailer).to respond_to(:total_cobranca_caucionada)
    expect(trailer).to respond_to(:qtde_cobranca_descontada)
    expect(trailer).to respond_to(:total_cobranca_descontada)

    expect(trailer).to respond_to(:aviso)
    expect(trailer).to respond_to(:cnab_g004_2)
  end

  it 'trailer deve ter 240 caracteres' do
    trailer = Cnab240::Lote::V40::Boletos::Trailer.new
    expect(trailer.linha.length).to be(240)
  end
end
