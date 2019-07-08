Pod::Spec.new do |s|
    s.name             = "AmountView"
    s.version          = "1.0.1"
    s.summary          = "AmountView - Amount View component"
    s.homepage         = "https://github.com/MarceloOscarJose/AmountView"
    s.author           = { "Marcelo José" => "marcelo.oscar.jose@gmail.com" }

    s.source           = { :git => "git@github.com:MarceloOscarJose/AmountView.git", :tag => s.version.to_s}
    s.license          = 'none'
    s.platform         = :ios, '11.0'
    s.requires_arc     = true
    s.swift_version    = '5'

    s.source_files = 'Pod/Classes/**/*'
    s.resources = ['Pod/*.xcassets']
end