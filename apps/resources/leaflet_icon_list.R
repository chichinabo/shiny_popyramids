require("leaflet")

# Make a list of leaflet R icons. We'll index into it based on name.
pyramidIcons <- iconList(
  bell = makeIcon("../resources/images/shape_bell.svg", 24, 24),
  bell_men_assymetric = makeIcon("../resources/images/shape_bell_men_assymetric.svg", 24, 24),
  bell_women_assymetric = makeIcon("../resources/images/shape_bell_women_assymetric.svg", 24, 24),
  
  pyramid = makeIcon("../resources/images/shape_pyramid.svg", 24, 24),
  pyramid_men_assymetric = makeIcon("../resources/images/shape_pyramid_men_assymetric.svg", 24, 24),
  pyramid_women_assymetric = makeIcon("../resources/images/shape_pyramid_women_assymetric.svg", 24, 24),
  
  star = makeIcon("../resources/images/shape_star.svg", 24, 24),
  star_men_assymetric = makeIcon("../resources/images/shape_star_men_assymetric.svg", 24, 24),
  star_women_assymetric = makeIcon("../resources/images/shape_star_women_assymetric.svg", 24, 24),
  
  tornado = makeIcon("../resources/images/shape_tornado.svg", 24, 24),
  tornado_men_assymetric = makeIcon("../resources/images/shape_tornado_men_assymetric.svg", 24, 24),
  tornado_women_assymetric = makeIcon("../resources/images/shape_tornado_women_assymetric.svg", 24, 24)
)
