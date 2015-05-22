require 'spec_helper'

RSpec.describe Cnab240::Lote do
  it 'deve conter trailer e header' do
    lote = Cnab240::Lote.new(operacao: :boleto, tipo: :remessa, versao: 'V81')
    expect(lote.header).to be_an_instance_of(Cnab240::Lote::V40::Boletos::Header)
    expect(lote.trailer).to be_an_instance_of(Cnab240::Lote::V40::Boletos::Trailer)
  end

  it 'deve conter segmento p' do
    lote = Cnab240::Lote.new(operacao: :boleto, tipo: :remessa, versao: 'V81')
    lote << :p
    expect(lote.segmentos[0]).to be_an_instance_of(Cnab240::V81::SegmentoP)
  end

  it 'deve conter segmento q' do
    lote = Cnab240::Lote.new(operacao: :boleto, tipo: :remessa, versao: 'V81')
    lote << :q
    expect(lote.segmentos[0]).to be_an_instance_of(Cnab240::V81::SegmentoQ)
  end

  it 'pode conter segmento r' do
    lote = Cnab240::Lote.new(operacao: :boleto, tipo: :remessa, versao: 'V81')
    lote << :r
    expect(lote.segmentos[0]).to be_an_instance_of(Cnab240::V81::SegmentoR)
  end

  it 'pode conter segmento s' do
    lote = Cnab240::Lote.new(operacao: :boleto, tipo: :remessa, versao: 'V81')
    lote << :s
    expect(lote.segmentos[0]).to be_an_instance_of(Cnab240::V81::SegmentoS)
  end

  it 'linhas devem ter 240' do
    lote = Cnab240::Lote.new(operacao: :boleto, tipo: :remessa, versao: 'V81')
    lote << :p
    lote.linhas.each do |linha|
      expect(linha.length).to be(240)
    end
  end
end
