// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap"
import "../stylesheets/application"
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("trix")
require("@rails/actiontext")


//

// // $('#carouselExampleControls').on('slid.bs.carousel', checkitem);
// $("#carouselExampleControls").on("slid.bs.carousel", "", checkitem);
// // $('#carouselExampleControls').on('slide.bs.carousel', checkitem);
// // $('#carouselExampleControls').on('slid.bs.carousel', checkitem);
//  //$("#carouselExampleControls").on("slide.bs.carousel", "", checkitem);
//
//  // $(document).ready(function(){               // on document ready
//  //     checkitem();
//  // });
// checkitem();
//
// function checkitem()                        // check function
// {
//     var $this = $('#carouselExampleControls');
//     if ($('.carousel-inner .carousel-item:first-of-type').hasClass('active')) {
//
//       $this.children('.carousel-control-prev').hide();
//       $this.children('.carousel-control-next').show();
//
//     } else if ($('.carousel-inner .carousel-item:last-of-type').hasClass('active')) {
//
//       $this.children('.carousel-control-next').hide();
//       $this.children('.carousel-control-prev').show();
//
//     } else {
//       $this.children('.carousel-control-prev').show();
//       $this.children('.carousel-control-prev').show();
//     }
// }

// $('#carouselExampleControls').on('slid.bs.carousel', checkitem);
// $("#carouselExampleControls").on("slid.bs.carousel", "", checkitem);
// function checkitem()                        // check function
// {
//     var $this = $('#carouselExampleControls');
//     if ($('.carousel-inner .carousel-item:last-of-type').hasClass('active')) {
//
//       $this.children('.carousel-control-next').hide();
//       $this.children('.carousel-control-prev').show();
//
//     } else if ($('.carousel-inner .carousel-item:first-of-type').hasClass('active')) {
//
//         $this.children('.carousel-control-prev').hide();
//         $this.children('.carousel-control-next').show();
//
//     } else {
//         $this.children('.carousel-control-prev').show();
//         $this.children('.carousel-control-next').show();
//     }
// }

// var checkitem = function() {
//   var $this;
//   $this = $("#carouselExampleControls");
//   if ($("#carouselExampleControls .carousel-inner .carousel-item:first-of-type").hasClass("active")) {
//             $this.children('.carousel-control-prev').hide();
//             $this.children('.carousel-control-next').show();
//   } else if ($("#carouselExampleControls .carousel-inner .carousel-item:last-of-type").hasClass("active")) {
//           $this.children('.carousel-control-next').hide();
//           $this.children('.carousel-control-prev').show();
//   } else {
//             $this.children('.carousel-control-prev').show();
//             $this.children('.carousel-control-next').show();
//   }
// };
//
// checkitem();
//
// $("#carouselExampleControls").on("slid.bs.carousel", "", checkitem);
