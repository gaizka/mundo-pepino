require 'mundo_pepino_es_ES'

class Time
  alias :strftime_nolocale :strftime
  def strftime(format)
    format = format.dup
    # webrat uses strftime(%B) to select months
    format.gsub!(/%B/, I18n.translate('date.month_names')[self.mon])
    self.strftime_nolocale(format)
  end
end

MundoPepino::ModelsToClean = [
  Orchard,
  Terrace,
  Crop,
  Fertilizer,
  Tomato,
  Chard,
  Pepino,
  Lettuce,
  Sprinkler
]

String.model_mappings = {
  /^huert[oa]s?$/i            => Orchard,
  /^bancal(es)?$/i            => Terrace,
  /^cultivos?$/i              => Crop,
  /^(abono|fertilizante)s?$/i => Fertilizer,
  /^tomates?$/i		            => Tomato,
  /^acelgas?$/i		            => Chard,
  /^pepinos?$/i		            => Pepino,
  /^aspersor(es)?$/i          => Sprinkler,
  /^lechugas?$/i              => Lettuce,
  /^huerto de nacimiento$/i   => Orchard
}

String.field_mappings = {
  /^[Ááa]reas?$/i    => :area,
  /^color(es)?$/i   => :color,
  /^latitud(es)?$/i => :latitude,
  /^longitud(es)?/i => :length,
  /^pesos?/i        => :weight,
  /^di[áa]metros?/i => :diameter,
  /^matas?$/i       => :plants,
  /^variedad(es)?$/i           => :variety,
  /^campos? de texto/i         => :text_field,
  /^[áa]reas? de texto/i       => :textarea,
  /^tipos? de cultivos?/i      => :orchard_type,
  /^nacionalidad/i             => :nationality,
  /^fichero adjunto/i          => :file_field,
  /^casilla seleccionada/i     => :selected_check,
  /^casilla sin seleccionar/i  => :unselected_check,
  /^Orchard::longitud(es)?$/   => :longitude,
  /^cultivad[oa]$/             => :cultivated,
  /^caudal(es)?$/i             => :flow,
  /^unidad(es)? caudal(es)?$/i => :flow_units,
  /^estaci[oó]n(es)?$/i        => :season,
  /^huerto de nacimiento$/i    => :orchard_of_birth,
  /^hora de comenzar a regar$/i => :start_watering,
  /^hora de terminar de regar$/i => :stop_watering,
  /^precio$/i                  => :price
}

String.relation_model_mappings = {
  /^orchard_of_birth$/i => Orchard
}

String.url_mappings.merge!(
  /^la página de registro/i    => '/welcome/signup'
)

Before do
  MundoPepino::ModelsToClean.each { |model| model.destroy_all }
end

module MundoPepino
  include FixtureReplacement
end

World(MundoPepino)