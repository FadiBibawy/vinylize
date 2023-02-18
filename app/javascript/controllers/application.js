import { Application } from "@hotwired/stimulus"

const application = Application.start()
// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }



// document.addEventListener('DOMContentLoaded', function() {
//   flatpickr('.your-selector');
// })


// import flatpickr from "flatpickr"
// import "flatpickr/dist/flatpickr.min.css"
// flatpickr(".datepicker", {})





// import { Application } from 'stimulus'
// import { definitionsFromContext } from 'stimulus/webpack-helpers'

// const application = Application.start()
// const context = require.context('../controllers', true, /\.js$/)
// application.load(definitionsFromContext(context))

// // import Flatpickr
// import Flatpickr from 'stimulus-flatpickr'

// // Import style for flatpickr
// require("flatpickr/dist/flatpickr.css")

// // Manually register Flatpickr as a stimulus controller
// application.register('flatpickr', Flatpickr)
