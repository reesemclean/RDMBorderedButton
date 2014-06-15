Pod::Spec.new do |s|
  s.name         = "RDMBorderedButton"
  s.version      = "1.0.0"
  s.summary      = "A subclass of UIButton that adds a border."
  s.description  = "RDMBorderedButton is a subclass of UIButton that makes it easy to add a bordered button to your project.
  
                    * Adds a thin border that is the same color as the text. 
                    * The border color respects the dimmed tint color when alerts show. 
                    * The corner radius is (optionally) automatically set based on button frame."

  s.homepage     = "https://github.com/reesemclean/RDMBorderedButton"
  s.screenshots  = "https://raw.githubusercontent.com/reesemclean/RDMBorderedButton/master/screenshot.png"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Reese McLean" => "reese.mclean@me.com" }
  s.social_media_url   = "http://twitter.com/reesemclean"
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/reesemclean/RDMBorderedButton.git", :tag => "v1.0.0" }
  s.source_files  = "RDMBorderedButton/RDMBorderedButton.{h,m}"
  s.public_header_files = "RDMBorderedButton/RDMBorderedButton.h"
  s.requires_arc = true
end
