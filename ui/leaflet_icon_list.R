require("leaflet")

# Make a list of leaflet R icons. We'll index into it based on name.
pyramidIcons <- iconList(
  bell = makeIcon("https://raw.githubusercontent.com/chichinabo/popyramids_resources/master/ui/images/shape_bell.svg", 24, 24),
  bell_men_assymetric = makeIcon("https://raw.githubusercontent.com/chichinabo/popyramids_resources/master/ui/images/shape_bell_men_assymetric.svg", 24, 24),
  bell_women_assymetric = makeIcon("https://raw.githubusercontent.com/chichinabo/popyramids_resources/master/ui/images/shape_bell_women_assymetric.svg", 24, 24),
  
  pyramid = makeIcon("https://raw.githubusercontent.com/chichinabo/popyramids_resources/master/ui/images/shape_pyramid.svg", 24, 24),
  pyramid_men_assymetric = makeIcon("https://raw.githubusercontent.com/chichinabo/popyramids_resources/master/ui/images/shape_pyramid_men_assymetric.svg", 24, 24),
  pyramid_women_assymetric = makeIcon("https://raw.githubusercontent.com/chichinabo/popyramids_resources/master/ui/images/shape_pyramid_women_assymetric.svg", 24, 24),
  
  star = makeIcon("https://raw.githubusercontent.com/chichinabo/popyramids_resources/master/ui/images/shape_star.svg", 24, 24),
  star_men_assymetric = makeIcon("https://raw.githubusercontent.com/chichinabo/popyramids_resources/master/ui/images/shape_star_men_assymetric.svg", 24, 24),
  star_women_assymetric = makeIcon("https://raw.githubusercontent.com/chichinabo/popyramids_resources/master/ui/images/shape_star_women_assymetric.svg", 24, 24),
  
  tornado = makeIcon("https://raw.githubusercontent.com/chichinabo/popyramids_resources/master/ui/images/shape_tornado.svg", 24, 24),
  tornado_men_assymetric = makeIcon("https://raw.githubusercontent.com/chichinabo/popyramids_resources/master/ui/images/shape_tornado_men_assymetric.svg", 24, 24),
  tornado_women_assymetric = makeIcon("https://raw.githubusercontent.com/chichinabo/popyramids_resources/master/ui/images/shape_tornado_women_assymetric.svg", 24, 24)
)
